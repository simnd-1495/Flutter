import 'package:flutter/material.dart';
import 'package:flutter_homework/ui/login/login.dart';
import '../../colors.dart';

const signUpScreen = '/';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
          ColorsApp.crusta,
          ColorsApp.violetRed,
        ]),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/connexion.png',
                    width: 135,
                    height: 135,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(color: ColorsApp.violetRed, fontSize: 30),
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'CONN',
                        ),
                        TextSpan(
                          text: 'EXION',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 4),
                    child: const Text(
                      'Find and Meet people around\nyou to find LOVE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'aria',
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                          side: const BorderSide(color: Colors.white),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * .6,
                      height: 56,
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/ic_fb.png',
                            width: 24,
                            height: 24,
                          ),
                          const VerticalDivider(
                            indent: 6,
                            endIndent: 6,
                            thickness: 2,
                            color: ColorsApp.bittersweet,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            child: Text(
                              'Sign in with Facebook',
                              style: TextStyle(color: ColorsApp.bittersweet),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Colors.white),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * .6,
                      height: 56,
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/ic_tw.png',
                            width: 24,
                            height: 24,
                          ),
                          const VerticalDivider(
                            indent: 6,
                            endIndent: 6,
                            thickness: 2,
                            color: ColorsApp.bittersweet,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            child: Text(
                              'Sign in with Twitter',
                              style: TextStyle(color: ColorsApp.bittersweet),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Colors.white),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * .6,
                      height: 56,
                      alignment: Alignment.center,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: ColorsApp.bittersweet),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      'ALREADY REGISTERED? SIGN IN',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
