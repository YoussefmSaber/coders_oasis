import 'package:coders_oasis/screens/authentication-screens/login/login_screen.dart';
import 'package:coders_oasis/shared/components/components.dart';
import 'package:coders_oasis/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 10), (){
      navigateAndFinish(context, LoginScreen());
    });
    
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset("assets/images/images/verify-email.svg"),
              const SizedBox(height: 16,),
              Text(
                "Email Verification",
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 24,
                    color: darkFont,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.5
                  )
                ),
              ),
              const SizedBox(height: 8,),
              Text(
                "We’ve send a message to your email\n go and verify your email then login to the application",
                textAlign: TextAlign.center,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: darkGray
                  )
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
