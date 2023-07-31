import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Image(image: AssetImage("assets/images/login-image.png"))),
          Row(
            children: [
              Image(
                image: AssetImage("assets/images/google-icon.png"),
              )
            ],
          )
        ],
      ),
    );
  }
}
