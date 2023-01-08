import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_movie_app/firebase_options.dart';
import 'package:my_movie_app/services/auth_exceptions.dart';
import 'package:my_movie_app/services/auth_user.dart';

abstract class AuthProvider {
  Future<void> initialize();
  AuthUser? get currentUser;
  Future<AuthUser> signUp({required String email, required String password});
  Future<AuthUser> logIn({required String email, required String password});
  Future<void> signOut();
  Future<void> sendEmailVerification();
  Future<AuthUser> signInWithGoogle();
}

class Auth implements AuthProvider {
  @override
  // TODO: implement currentUser
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return AuthUser.fromFirebase(user);
    } else {
      return null;
    }
  }

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedIn();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw InvalidEmail();
      } else if (e.code == 'password-incorrect') {
        throw IncorrectPassword();
      } else if (e.code == 'user-not-found') {
        throw UserNotFound();
      } else {
        throw GenericException();
      }
    } catch (e) {
      throw GenericException();
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    } else {
      throw UserNotLoggedIn();
    }
  }

  @override
  Future<void> signOut() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseAuth.instance.signOut();
    } else {
      throw UserNotLoggedIn();
    }
  }

  @override
  Future<AuthUser> signUp(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedIn();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw InvalidEmail();
      } else if (e.code == 'weak-password') {
        throw WeakPassowrd();
      } else if (e.code == 'email-already-in-use') {
        throw UsedEmail();
      } else {
        throw GenericException();
      }
    } catch (_) {
      throw GenericException();
    }
  }

  @override
  Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Future<AuthUser> signInWithGoogle() async {
    final withGoogle = GoogleSignIn();
    final googleUsers = await withGoogle.signIn();
    if (googleUsers != null) {
      final googleAuth = await googleUsers.authentication;
      if (googleAuth.idToken != null) {
        final userCredential = await FirebaseAuth.instance.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken));
        return userCredential.user != null
            ? AuthUser.fromFirebase(userCredential.user!)
            : throw UserNotLoggedIn();
      }
    }
    throw UserNotLoggedIn();
  }
}
