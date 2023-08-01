import 'package:coders_oasis/shared/components/constants.dart';
import 'package:coders_oasis/shared/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:coders_oasis/shared/cubit/onboarding_cubit/onboarding_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/components/components.dart';
import '../../shared/network/local/cahce_helper.dart';
import '../credentials-screens/login/login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  final PageController boardController = PageController();
  bool isNext = true;

  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = OnBoardingCubit.get(context);
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            TextButton(
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(defaultColorTransparent)),
                onPressed: () {
                  skipOnBoarding(context);
                },
                child: Text(
                  "Skip",
                  style: GoogleFonts.rubik(
                      textStyle:
                          TextStyle(color: HexColor("78746D"), fontSize: 16)),
                ))
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Expanded(
              child: PageView.builder(
                controller: boardController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  cubit.currentIndex = index;
                  return onBoardingItem(
                      cubit.onBoardingItems[cubit.currentIndex]);
                },
                itemCount: cubit.onBoardingItems.length,
              ),
            ),
            SmoothPageIndicator(
              effect: ExpandingDotsEffect(
                dotWidth: 10,
                dotHeight: 10,
                dotColor: HexColor("D5D4D4"),
                activeDotColor: HexColor("65AAEA"),
              ),
              controller: boardController,
              count: cubit.onBoardingItems.length,
            ),
            const SizedBox(
              height: 160,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: defaultButton(
                textColor: "ffffff",
                buttonWidth: double.infinity,
                text: isNext ? "Next" : "Let’s Start",
                onTap: () {
                  if (cubit.currentIndex < 2) {
                    boardController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linearToEaseOut,
                    );
                  } else {
                    skipOnBoarding(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void skipOnBoarding(context) {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinish(context, LoginScreen());
      }
    });
  }
}
