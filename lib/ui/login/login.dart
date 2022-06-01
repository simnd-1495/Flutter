import 'package:flutter/material.dart';
import 'package:flutter_homework/ui/home/home_screen.dart';

import '../../colors.dart';

const loginScreen = '/second';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
          ColorsApp.crusta,
          ColorsApp.violetRed,
        ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(right: 50, left: 50, bottom: 20),
                child: Column(
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
                    Text(
                      'Find and Meet people around \nyou to find LOVE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'SIGN IN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      textAlignVertical: TextAlignVertical.bottom,
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                        ),
                        hintText: 'Enter Email',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextFormField(
                      textAlignVertical: TextAlignVertical.bottom,
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Checkbox(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          checkColor: Colors.white,
                          activeColor: Colors.orange,
                          value: value,
                          onChanged: (bool? isCheck) {
                            setState(() {
                              value = isCheck!;
                            });
                          },
                        ),
                        Text(
                          'Remember Password',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ButtonCustom(),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconLoginWith(icon: 'assets/images/ic_fb.png'),
                        IconLoginWith(icon: 'assets/images/ic_tw.png'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'FORGOT PASSWORD?',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.black.withOpacity(0.1),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: ColorsApp.crusta,
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'DONT HAVE ACCOUNT ? ',
                        ),
                        TextSpan(
                          text: 'SIGNUP',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IconLoginWith extends StatelessWidget {
  final String icon;

  const IconLoginWith({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
        child: InkWell(
          onTap: () {},
          splashColor: Colors.black12,
          child: Image.asset(
            '${icon}',
            width: 30,
            height: 30,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: StadiumBorder(),
      clipBehavior: Clip.antiAlias,
      child: Ink(
        width: double.infinity,
        decoration: ShapeDecoration(
          shape: StadiumBorder(),
          color: Colors.white,
        ),
        child: InkWell(
          // onTap: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => const HomeScreen()),
          //   );
          // },
          splashColor: Colors.black12,
          child: Ink(
            padding: EdgeInsets.all(20),
            child: Text(
              'GET STARTED',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
