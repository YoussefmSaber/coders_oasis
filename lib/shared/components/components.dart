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

Widget iconButton({
  required Image buttonImage,
  required Function onTap,
  double radius = 10,
  String color = "65AAEA",
}) =>
    FloatingActionButton(
        onPressed: () {
          onTap();
        },
        backgroundColor: HexColor(color),
        elevation: 0,
        highlightElevation: 0,
        splashColor: HexColor("53535379"),
        mini: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: buttonImage);

Widget backButton({
  required Function onTap,
}) =>
      FloatingActionButton(
        onPressed: () {
          onTap();
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        highlightElevation: 0,
        splashColor: defaultColorTransparent,
        mini: true,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1,color: darkGray),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(Icons.arrow_back_ios_new_rounded),

      );


Widget defaultTextField(
        {required String labelText,
        required TextInputType inputType,
        required bool isPassword}) => TextField(
      obscureText: isPassword,
      cursorColor: defaultColor,
      decoration: InputDecoration(
        focusColor: defaultColor,
        labelText: labelText,
        labelStyle: GoogleFonts.rubik(textStyle: TextStyle(color: darkGray)),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: gray,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1.5,
            color: defaultColor,
          ),
        ),
      ),
      keyboardType: inputType,
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
