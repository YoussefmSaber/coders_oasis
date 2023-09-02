import 'package:coders_oasis/screens/authentication-screens/verify-email/verify_email.dart';
import 'package:coders_oasis/shared/network/remote/supabase_api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../login/login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var userNameController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Stack(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  const Image(
                      image:
                          AssetImage("assets/images/images/signup-image.png")),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Sign up",
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                            color: darkFont,
                            fontSize: 24,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Create your account",
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                            color: darkGray,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: defaultTextField(
                          controller: userNameController,
                          labelText: "Name",
                          inputType: TextInputType.text,
                          isPassword: false)),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: defaultTextField(
                          controller: emailController,
                          labelText: "Email",
                          inputType: TextInputType.emailAddress,
                          isPassword: false)),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: defaultTextField(
                          controller: passwordController,
                          labelText: "Password",
                          inputType: TextInputType.emailAddress,
                          isPassword: true)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: defaultButton(
                        text: "Sign up",
                        onTap: () async {
                          try {
                            var supabaseService = SupabaseService();

                            var variable = await supabaseService.signup(
                                email: emailController.text,
                                password: passwordController.text,
                                username: userNameController.text);
                            if (variable.user?.identities?.isEmpty == true) {
                              Fluttertoast.showToast(
                                  msg: "The email is already used",
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: errorColor,
                                  textColor: Colors.white);
                            } else {
                              navigateTo(context, VerifyEmailScreen());
                              print("'signup screen:--' \n\n ${variable.user}");
                            }
                          } catch (error) {
                            print("Error: $error");
                          }
                        },
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
                    child: Text("Login",
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                                color: darkGray,
                                fontSize: 16,
                                fontWeight: FontWeight.w500))),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
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
      ),
    );
  }
}
