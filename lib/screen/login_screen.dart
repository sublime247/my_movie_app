import 'package:flutter/material.dart';
import 'package:my_movie_app/services/auth_exceptions.dart';
import 'package:my_movie_app/services/auth_service.dart';
import 'package:my_movie_app/widgets/dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF840052),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Log in",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Enter the email',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        fillColor: Color.fromARGB(255, 75, 0, 46),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        fillColor: Color.fromARGB(255, 75, 0, 46),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        await AuthService.firebase().logIn(
                            email: _emailController.text,
                            password: _passwordController.text);

                        final user = AuthService.firebase().currentUser;
                        if (user?.isEmailVErified ?? false) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/main-home', (route) => false);
                        } else {
                          Navigator.of(context).pushNamed('/verify-email');
                        }
                      } on InvalidEmail {
                        return showErrorDialog(context, 'Enter a Valid E-mail');
                      } on IncorrectPassword {
                        return showErrorDialog(context, 'Password In-correct');
                      } on UserNotFound {
                        return showErrorDialog(context, 'User Not found');
                      } on GenericException {
                        return showErrorDialog(context, 'Authentication error');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 201, 0, 124),
                      fixedSize: const Size(300, 50),
                      // : Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: const Text("Login"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/register', (route) => false);
                    },
                    child: const Text(
                      'Not a member? Join in',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
