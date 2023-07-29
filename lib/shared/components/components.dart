import 'package:coders_oasis/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../models/boarding_model.dart';

Widget onBoardingItem(
  BoardingModel onBoardingItem,
) =>
    Container(
      child: Column(
        children: [
          Image(image: AssetImage(onBoardingItem.image)),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 70,
            child: Text(
              onBoardingItem.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                textStyle:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            onBoardingItem.body,
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: HexColor("78746D")),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );

Widget defaultButton(
        {required String text,
        required Function onTap,
        double radius = 10,
        String color = "E3562A",
        required String textColor,
        required double buttonWidth,
        double? buttonHeight}) =>
    Container(
      width: buttonWidth,
      height: buttonHeight,
      child: FilledButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          )),
          backgroundColor: MaterialStateProperty.all(HexColor(color)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            text,
            style: GoogleFonts.rubik(
                textStyle: TextStyle(color: HexColor(textColor), fontSize: 18)),
          ),
        ),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void navigateAndFinish(context, widget) => Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));
