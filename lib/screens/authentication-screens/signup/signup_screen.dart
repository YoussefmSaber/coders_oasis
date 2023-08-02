import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../login/login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 150,),
                const Image(
                    image: AssetImage("assets/images/images/signup-image.png")),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Sign up",
                  style: GoogleFonts.rubik(
                      color: darkFont,
                      textStyle:
                          const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "Create your account",
                  style: GoogleFonts.rubik(
                      color: darkGray,
                      textStyle:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: defaultTextField(
                        labelText: "Name",
                        inputType: TextInputType.text,
                        isPassword: false)),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: defaultTextField(
                        labelText: "Email",
                        inputType: TextInputType.emailAddress,
                        isPassword: false)),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: defaultTextField(
                        labelText: "Password",
                        inputType: TextInputType.emailAddress,
                        isPassword: true)),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: defaultButton(
                      text: "Sign up",
                      onTap: () {},
                      textColor: "ffffff",
                      buttonWidth: double.infinity),
                ),
                TextButton(
                    style: ButtonStyle(
                        splashFactory: InkSplash.splashFactory,
                        overlayColor:
                        MaterialStateProperty.resolveWith((state) {
                          if (state.contains(MaterialState.pressed)) {
                            return secondaryColorTransparent;
                          }
                        })),
                    onPressed: () {
                      navigateAndFinish(context, LoginScreen());
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              color: darkGray,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    )),
                const SizedBox(height: 40,),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: backButton(onTap: () {
                navigateAndFinish(context, LoginScreen());
              }),
            ),
          ]),
        ),
      ),
    );
  }
}
