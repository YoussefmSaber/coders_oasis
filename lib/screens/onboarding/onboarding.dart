import 'package:coders_oasis/shared/components/constants.dart';
import 'package:coders_oasis/shared/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/onboarding_cubit/onboarding_states.dart';

class OnBoardingScreen extends StatelessWidget {
  final PageController boardController = PageController();

  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = OnBoardingCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(defaultColorTransparent)
            ),
              onPressed: () {},
              child: Text(
                "Skip",
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(color: HexColor("78746D"), fontSize: 16)),
              ))
        ],
      ),
      body: Column(
        children: [
                SizedBox(height: 150,),
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
          SizedBox(height: 160,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: defaultButton(
              textColor: "ffffff",
              buttonWidth: double.infinity,
              text: "Next",
              onTap: () {
                if (cubit.currentIndex < 2) {
                  boardController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linearToEaseOut,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
