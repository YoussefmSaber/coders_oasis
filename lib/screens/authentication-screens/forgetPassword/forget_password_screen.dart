import 'package:coders_oasis/screens/authentication-screens/check-code/verify-code-screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../login/login_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final searchController = TextEditingController();

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
                const Spacer(),
                const Image(
                    image:
                        AssetImage("assets/images/images/send-code-image.png")),
                const SizedBox(
                  height: 8,
                ),
                Text("Reset Password",
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                            color: darkFont,
                            fontSize: 24,
                            fontWeight: FontWeight.w500))),
                const SizedBox(
                  height: 2,
                ),
                Text("Enter you email.",
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                            color: darkGray,
                            fontSize: 16,
                            fontWeight: FontWeight.w400))),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: defaultTextField(
                        controller: searchController,
                        labelText: "Email",
                        inputType: TextInputType.emailAddress,
                        isPassword: false)),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: defaultButton(
                      text: "Send Code",
                      onTap: () {
                        navigateTo(context, const VerifyCodeScreen());
                      },
                      textColor: "ffffff",
                      buttonWidth: double.infinity),
                ),
                const Spacer(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: backButton(onTap: () {
                navigateAndFinish(context, LoginScreen());
              }),
            )
          ]),
        ),
      ),
    );
  }
}
