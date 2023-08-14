import 'package:coders_oasis/screens/authentication-screens/forgetPassword/forget_password_screen.dart';
import 'package:coders_oasis/shared/components/components.dart';
import 'package:coders_oasis/shared/components/constants.dart';
import 'package:coders_oasis/shared/network/remote/api-keys.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final supabase = Supabase.instance.client;

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
              const SizedBox(height: 100),
              const Image(
                  image: AssetImage("assets/images/images/login-image.png")),
              const SizedBox(
                height: 16,
              ),
              Text("Log in",
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                          color: darkFont,
                          fontSize: 24,
                          fontWeight: FontWeight.w500))),
              const SizedBox(
                height: 2,
              ),
              Text("Login with social networks",
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                          color: darkGray,
                          fontSize: 16,
                          fontWeight: FontWeight.w400))),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconButton(
                      heroTag: 'google',
                      onTap: () {
                        return supabase.auth
                            .signInWithOAuth(Provider.google,
                            redirectTo: 'https://wfppzqbzandnuqqxrhez.supabase.co/',
                            authScreenLaunchMode:
                            LaunchMode.inAppWebView,
                          queryParams: {
                              "apikey": projectApiKey
                          }
                        )
                            .then((value) => print(value))
                            .catchError((error) => print(error));
                      },
                      buttonImage: const Image(
                        image:
                        AssetImage("assets/images/icons/google-icon.png"),
                      )),
                  iconButton(
                      heroTag: 'facebook',
                      onTap: () {},
                      buttonImage: const Image(
                          image: AssetImage(
                              "assets/images/icons/facebook-icon.png"))),
                  iconButton(
                      heroTag: 'apple',
                      onTap: () {},
                      buttonImage: const Image(
                          image: AssetImage(
                              "assets/images/icons/apple-icon.png"))),
                ],
              ),
              const SizedBox(
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
                style: ButtonStyle(
                    splashFactory: InkSplash.splashFactory,
                    overlayColor: MaterialStateProperty.resolveWith((state) {
                      if (state.contains(MaterialState.pressed)) {
                        return secondaryColorTransparent;
                      }
                      return null;
                    })),
                onPressed: () {
                  navigateTo(context, const ForgetPasswordScreen());
                },
                child: Text("Forgot Password?",
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                            color: darkGray,
                            fontSize: 16,
                            fontWeight: FontWeight.w500))),
              ),
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
                style: ButtonStyle(
                    splashFactory: InkSplash.splashFactory,
                    overlayColor: MaterialStateProperty.resolveWith((state) {
                      if (state.contains(MaterialState.pressed)) {
                        return secondaryColorTransparent;
                      }
                      return null;
                    })),
                onPressed: () {
                  navigateTo(context, const SignupScreen());
                },
                child: Text("Sign up",
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                            color: darkGray,
                            fontSize: 16,
                            fontWeight: FontWeight.w500))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
