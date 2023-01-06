import 'package:my_movie_app/services/auth_provider.dart';
import 'package:my_movie_app/services/auth_user.dart';

class AuthService implements AuthProvider {
  final AuthProvider authProvider;

  const AuthService(this.authProvider);
  @override
  // TODO: implement currentUser
  AuthUser? get currentUser => authProvider.currentUser;

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      authProvider.logIn(
        email: email,
        password: password,
      );

  @override
  Future<void> sendEmailVerification() => authProvider.sendEmailVerification();

  @override
  Future<void> signOut() => authProvider.signOut();

  @override
  Future<AuthUser> signUp({required String email, required String password}) =>
      authProvider.signUp(
        email: email,
        password: password,
      );
}
