import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../login/login_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Image(
                    image: AssetImage("assets/images/images/send-code-image.png")),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Reset Password",
                  style: GoogleFonts.rubik(
                      color: darkFont,
                      textStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "Enter you email.",
                  style: GoogleFonts.rubik(
                      color: darkGray,
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: defaultTextField(
                        labelText: "Email",
                        inputType: TextInputType.emailAddress,
                        isPassword: false)),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: defaultButton(
                      text: "Send Code",
                      onTap: () {},
                      textColor: "ffffff",
                      buttonWidth: double.infinity),
                ),
                Spacer(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: backButton(onTap: (){
                navigateAndFinish(context, LoginScreen());
              }),
            )
          ]),
        ),
      ),
    );
  }
}
