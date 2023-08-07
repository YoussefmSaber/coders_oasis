import 'package:coders_oasis/shared/components/components.dart';
import 'package:coders_oasis/shared/components/constants.dart';
import 'package:coders_oasis/shared/cubit/applayout-cubit/applayout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Profile",
                style: GoogleFonts.rubik(
                  color: darkFont,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: CircleAvatar(
                backgroundColor: secondaryColor,
                radius: 70,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 65,
                  child: Image.asset(
                    "assets/images/images/login-image.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: profileItem(label: "Your Courses"),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: profileItem(label: "Saved"),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: profileItem(label: "Payment"),
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
                onPressed: () {},
                child: Text(
                  "Log out",
                  style: GoogleFonts.rubik(color: darkGray, fontSize: 14),
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: backButton(onTap: (){
            AppLayoutCubit.get(context).changeIndex(0);
          }),
        )
      ]),
    );
  }
}