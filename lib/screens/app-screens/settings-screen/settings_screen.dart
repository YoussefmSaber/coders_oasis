import 'package:coders_oasis/shared/components/components.dart';
import 'package:coders_oasis/shared/components/constants.dart';
import 'package:coders_oasis/shared/cubit/applayout-cubit/applayout_cubit.dart';
import 'package:coders_oasis/shared/cubit/settings-cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/cubit/settings-cubit/settings_states.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SettingsCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Text("Settings",
                              style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                    letterSpacing: -0.50,
                                    color: darkFont,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Image(
                            image: AssetImage(
                                "assets/images/images/settings-image.png")),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.5, color: gray),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          color: Colors.transparent,
                          elevation: 0,
                          surfaceTintColor: Colors.black,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: CircleAvatar(
                                  backgroundColor: secondaryColor,
                                  child: const Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text("Notifications",
                                  style: GoogleFonts.rubik(
                                    textStyle: TextStyle(
                                        letterSpacing: -0.50,
                                        fontSize: 20,
                                        color: darkFont,
                                        fontWeight: FontWeight.w500),
                                  )),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Switch(
                                    activeColor: lightGray,
                                    splashRadius: 0,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    activeTrackColor: successColor,
                                    inactiveTrackColor: Colors.transparent,
                                    value: cubit.isNotificationOn,
                                    onChanged: (state) =>
                                        cubit.changeNotificationState(state)),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.5, color: gray),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          color: Colors.transparent,
                          elevation: 0,
                          surfaceTintColor: Colors.black,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: CircleAvatar(
                                  backgroundColor: secondaryColor,
                                  child: const Icon(
                                    Icons.dark_mode_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text("Dark Mode",
                                  style: GoogleFonts.rubik(
                                    textStyle: TextStyle(
                                        letterSpacing: -0.50,
                                        fontSize: 20,
                                        color: darkFont,
                                        fontWeight: FontWeight.w500),
                                  )),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Switch(
                                    activeColor: lightGray,
                                    splashRadius: 0,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    activeTrackColor: successColor,
                                    inactiveTrackColor: Colors.transparent,
                                    value: cubit.isDarkMode,
                                    onChanged: (state) =>
                                        cubit.changeDarkModeState(state)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: backButton(onTap: () {
                      AppLayoutCubit.get(context).changeIndex(0);
                    }),
                  ),
                ]),
              ),
            ),
          );
        });
  }
}
