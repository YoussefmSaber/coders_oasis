import 'package:coders_oasis/screens/authentication-screens/forgetPassword/forget_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Image(
                  image:
                      AssetImage("assets/images/images/verify-code-image.png")),
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
              otpPin(context),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: defaultButton(
                    text: "Verify Code",
                    onTap: () {},
                    textColor: "ffffff",
                    buttonWidth: double.infinity),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Didn’t recive a code?",
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                          color: darkGray,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        splashFactory: InkSplash.splashFactory,
                        overlayColor:
                            MaterialStateProperty.resolveWith((state) {
                          if (state.contains(MaterialState.pressed)) {
                            return secondaryColorTransparent;
                          }
                        })),
                    child: Text(
                      "Send Code",
                      style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              color: secondaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      selectionColor: secondaryColorTransparent,
                    ),
                  )
                ],
              ),
              const Spacer()
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: backButton(onTap: (){
              navigateAndFinish(context, ForgetPasswordScreen());
            }),
          )
        ]),
      ),
    );
  }
}
