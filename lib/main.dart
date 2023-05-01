import 'package:flutter/material.dart';
import 'package:my_flash_chat_flutter/welcome_screen.dart';
import 'package:my_flash_chat_flutter/login_screen.dart';
import 'package:my_flash_chat_flutter/registration_screen.dart';
import 'package:my_flash_chat_flutter/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async  {
  runApp(FlashChat());
  await Firebase.initializeApp();
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
      },
    );
  }
}
