import 'package:flutter/material.dart';
import 'package:flutter_homework/ui/home/home_screen.dart';
import 'package:flutter_homework/ui/movie_detail/movie_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // signUpScreen: (context) => const SignUpScreen(),
        // loginScreen: (context) => const LoginScreen(),
        homeScreen: (context) => const HomeScreen(),
        movieDetailScreen: (context) => const MovieDetailScreen(),
      },
    );
  }
}
