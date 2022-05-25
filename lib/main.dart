import 'package:flutter/material.dart';
import 'package:flutter_homework/ui/login/login.dart';
import 'ui/sign_up/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        signUpScreen: (context) => const SignUpScreen(),
        loginScreen: (context) => const LoginScreen(),
      },
    );
  }
}
