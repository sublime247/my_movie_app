import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/services/auth_exceptions.dart';
import 'package:my_movie_app/services/auth_provider.dart';
import 'package:my_movie_app/services/auth_service.dart';
import 'package:my_movie_app/widgets/dialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                "Sign Up",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'FirstName',
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
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'LastName',
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
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
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
                      obscureText: true,
                      autocorrect: false,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: '........',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        suffixIcon: Icon(
                          Icons.visibility_off,
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
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed:() async{
                   await AuthService.firebase().signInWithGoogle();
                   Navigator.of(context).pushNamed('/main-home');
                  },child: Text('continue with googlr')),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                         AuthService.firebase().signUp(
                            email: _emailController.text,
                            password: _passwordController.text);

                        final user = AuthService.firebase().currentUser;
                        if (user!.isEmailVErified) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/login', (route) => false);
                        } else {
                          await AuthService.firebase().sendEmailVerification();
                          showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                    content: Text(
                                        'Check your email for verification'),
                                  ));
                        }
                     } on InvalidEmail{
                        return showErrorDialog(context, 'Enter a Valid E-mail');
                      }on WeakPassowrd{
                        return showErrorDialog(context, 'Password is weak');
                      }on UsedEmail{
                        return showErrorDialog(context, 'E-mail already used');
                      }on GenericException{
                        return showErrorDialog(context, 'An error occured');
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
                    child: const Text("Sign Up"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/login', (route) => false);
                    },
                    child: const Text(
                      'Already have an account? Log in',
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

  //sign Function

}
