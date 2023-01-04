import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';

abstract class Authentication {
  Future<User> signIn(String email, String password);
  Future<User> signUp(String email, String password);
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<String> getUser();
  Future<User> currentUser();
}

// Path: lib\authentication\firebase_authentication.dart
class Auth implements Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<User> currentUser() async {
    return _firebaseAuth.currentUser!;
  }

  @override
  Future<User> signIn(String email, String password) async {
    final UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    final User user = userCredential.user!;
    return user;
  }

  @override
  Future<User> signUp(String email, String password) async {
    final UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    final User user = userCredential.user!;
    return user;
    
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  @override
  Future<bool> isSignedIn() async {
    final User user = _firebaseAuth.currentUser!;
    return user != null;
  }

  @override
  Future<String> getUser() async {
    return (_firebaseAuth.currentUser)!.uid;
  }
}
