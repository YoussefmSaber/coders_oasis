import 'package:coders_oasis/shared/components/components.dart';
import 'package:coders_oasis/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Image(image: AssetImage("assets/images/login-image.png")),
              SizedBox(
                height: 16,
              ),
              Text(
                "Log in",
                style: GoogleFonts.rubik(
                    color: darkFont,
                    textStyle:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "Login with social networks",
                style: GoogleFonts.rubik(
                    color: darkGray,
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconButton(
                      onTap: () {},
                      buttonImage: Image(
                        image: AssetImage("assets/images/google-icon.png"),
                      )),
                  iconButton(
                      onTap: () {},
                      buttonImage: Image(
                          image:
                              AssetImage("assets/images/facebook-icon.png"))),
                  iconButton(
                      onTap: () {},
                      buttonImage: Image(
                          image: AssetImage("assets/images/apple-icon.png"))),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: defaultTextField(
                      labelText: "Email",
                      inputType: TextInputType.emailAddress,
                      isPassword: false)),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: defaultTextField(
                      labelText: "Password",
                      inputType: TextInputType.emailAddress,
                      isPassword: true)),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                            color: darkGray,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: defaultButton(
                    text: "Log in",
                    onTap: () {},
                    textColor: "ffffff",
                    buttonWidth: double.infinity),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Sign up",
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                            color: darkGray,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
