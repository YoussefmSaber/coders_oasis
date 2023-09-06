import 'package:coders_oasis/models/user_model.dart';
import 'package:coders_oasis/screens/app-screens/my-courses-screen/my_courses.dart';
import 'package:coders_oasis/screens/authentication-screens/login/login_screen.dart';
import 'package:coders_oasis/shared/components/components.dart';
import 'package:coders_oasis/shared/components/constants.dart';
import 'package:coders_oasis/shared/cubit/applayout-cubit/applayout_cubit.dart';
import 'package:coders_oasis/shared/cubit/profile-cubit/profile_cubit.dart';
import 'package:coders_oasis/shared/cubit/profile-cubit/profile_states.dart';
import 'package:coders_oasis/shared/network/local/cahce_helper.dart';
import 'package:coders_oasis/shared/network/remote/supabase_api.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  var supabaseService = SupabaseService();

  @override
  Widget build(BuildContext context) {
    var cubit = ProfileCubit.get(context);
    return BlocConsumer<ProfileCubit, ProfileScreenState>(
      listener: (context, state) async {
        var name = await cubit.name;
        print(name);
      },
      builder: (context, state) {
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
                  child: profileItem(
                      label: "Your Courses",
                      onTap: () {
                        navigateTo(context, MyCoursesScreen());
                      }),
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: Text(
                      "Account information",
                      style: TextStyle(
                          letterSpacing: -0.50,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: darkFont),
                    ),
                  ),
                ),
                FutureBuilder<UserModel>(
                    future: cubit.userData,
                    builder: (_, snapshot) {
                      return Expanded(
                        child: Column(
                          children: [
                            settingsItem(
                                label: "Name",
                                itemIcon: Icons.person,
                                subLabel: "${snapshot.data?.name.toString()}"),
                            settingsItem(
                                label: "Email",
                                itemIcon: Icons.email_rounded,
                                subLabel: "${snapshot.data?.email.toString()}"),
                            settingsItem(
                                label: "Password",
                                itemIcon: Icons.lock_rounded,
                                subLabel: "Changed 2 weeks ago"),
                          ],
                        ),
                      );
                    }),
                TextButton(
                    style: ButtonStyle(
                        splashFactory: InkSplash.splashFactory,
                        overlayColor:
                            MaterialStateProperty.resolveWith((state) {
                          if (state.contains(MaterialState.pressed)) {
                            return errorColorTransparent;
                          }
                          return null;
                        })),
                    onPressed: () {
                      supabaseService.signout();
                      CacheHelper.clearData(key: "displayName");
                      CacheHelper.clearData(key: "userEmail");
                      AppLayoutCubit().currentIndex = 0;
                      navigateAndFinish(context, LoginScreen());
                    },
                    child: Text(
                      "Log out",
                      style: GoogleFonts.rubik(color: errorColor, fontSize: 14),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: backButton(onTap: () {
                AppLayoutCubit.get(context).changeIndex(0);
              }),
            )
          ]),
        );
      },
    );
  }
}
