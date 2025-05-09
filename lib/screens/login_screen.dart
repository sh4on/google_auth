import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_auth/controllers/auth_controller.dart';

import 'my_home_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () async {
            UserCredential? user =
                await Get.put(SocialAuthController()).signInWithGoogle();
            if (user == null) {
              print('failed');
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            }
          },
          icon: Icon(
            FontAwesomeIcons.google,
          ),
        ),
      ),
    );
  }
}
