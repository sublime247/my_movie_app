import 'package:firebase_auth/firebase_auth.dart' show User;

class AuthUser {
  final bool isEmailVErified;
  AuthUser(this.isEmailVErified);
  factory AuthUser.fromFirebase(User user) => AuthUser(user.emailVerified);
}
