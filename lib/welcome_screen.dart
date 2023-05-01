import 'package:my_flash_chat_flutter/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:my_flash_chat_flutter/login_screen.dart';
import 'package:my_flash_chat_flutter/registration_screen.dart';
import 'package:my_flash_chat_flutter/chat_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:my_flash_chat_flutter/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {

  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      upperBound: 1.0,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);

    controller.forward();


    controller.addListener(() {
      print(animation.value);
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(Colour: Colors.lightBlueAccent, onPressed: () {Navigator.pushNamed(context, LoginScreen.id);}, text: 'log in',),
            RoundedButton(Colour: Colors.blueAccent, onPressed: () {Navigator.pushNamed(context, RegistrationScreen.id);}, text: 'Register',),
          ],
        ),
      ),
    );
  }
}

