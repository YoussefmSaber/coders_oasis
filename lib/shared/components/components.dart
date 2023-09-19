import 'package:coders_oasis/screens/app-screens/video-player-screen/video_player.dart';
import 'package:coders_oasis/shared/components/constants.dart';
import 'package:curved_progress_bar/curved_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../models/boarding_model.dart';
import '../../models/course_model.dart';
import '../../models/video_model.dart';

Widget onBoardingItem(
  BoardingModel onBoardingItem,
) =>
    Column(
      children: [
        Image(image: AssetImage(onBoardingItem.image)),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 60,
          child: Text(
            onBoardingItem.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(
                textStyle:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
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
                  color: HexColor("78746D"))),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );

Widget defaultButton(
        {required String text,
        required Function onTap,
        double radius = 10,
        String color = "E3562A",
        required String textColor,
        required double buttonWidth,
        double? buttonHeight}) =>
    SizedBox(
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
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(text,
              style: GoogleFonts.rubik(
                  textStyle:
                      TextStyle(color: HexColor(textColor), fontSize: 18))),
        ),
      ),
    );

Widget iconButton(
        {required Image buttonImage,
        required Function onTap,
        double radius = 10,
        String color = "65AAEA",
        required String heroTag}) =>
    FloatingActionButton(
        heroTag: heroTag,
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
        side: BorderSide(width: 1, color: darkGray),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: darkFont,
      ),
    );

Widget notificationButton({required Function onTap}) => FloatingActionButton(
      onPressed: () {
        onTap();
      },
      backgroundColor: Colors.transparent,
      elevation: 0,
      highlightElevation: 0,
      splashColor: defaultColorTransparent,
      mini: true,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: darkGray),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ImageIcon(
        const AssetImage("assets/images/icons/notification-icon.png"),
        color: darkFont,
      ),
    );

Widget defaultTextField(
        {required String labelText,
        required TextInputType inputType,
        required bool isPassword,
        required TextEditingController controller}) =>
    TextField(
      controller: controller,
      obscureText: isPassword,
      cursorColor: defaultColor,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: defaultColor),
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

Widget otpPin(context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 68,
              width: 44,
              child: TextField(
                onChanged: (s) {
                  if (s.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                cursorColor: defaultColor,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  focusColor: defaultColor,
                  labelStyle:
                      GoogleFonts.rubik(textStyle: TextStyle(color: darkGray)),
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
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 68,
              width: 44,
              child: TextField(
                onChanged: (s) {
                  if (s.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                cursorColor: defaultColor,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  focusColor: defaultColor,
                  labelStyle:
                      GoogleFonts.rubik(textStyle: TextStyle(color: darkGray)),
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
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 58,
              width: 44,
              child: TextField(
                onChanged: (s) {
                  if (s.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                cursorColor: defaultColor,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  focusColor: defaultColor,
                  labelStyle:
                      GoogleFonts.rubik(textStyle: TextStyle(color: darkGray)),
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
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 58,
              width: 44,
              child: TextField(
                onChanged: (s) {
                  if (s.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                cursorColor: defaultColor,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  focusColor: defaultColor,
                  labelStyle:
                      GoogleFonts.rubik(textStyle: TextStyle(color: darkGray)),
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
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 58,
              width: 44,
              child: TextField(
                onChanged: (s) {
                  if (s.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                cursorColor: defaultColor,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  focusColor: defaultColor,
                  labelStyle:
                      GoogleFonts.rubik(textStyle: TextStyle(color: darkGray)),
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
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 58,
              width: 44,
              child: TextField(
                cursorColor: defaultColor,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  focusColor: defaultColor,
                  labelStyle:
                      GoogleFonts.rubik(textStyle: TextStyle(color: darkGray)),
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
              ),
            ),
          ),
        ],
      ),
    );

Widget settingsItem(
        {required String label,
        required IconData itemIcon,
        required String subLabel}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                child: Icon(
                  itemIcon,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.rubik(
                      textStyle: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              letterSpacing: -0.50,
                              fontSize: 20,
                              color: darkFont,
                              fontWeight: FontWeight.w500))),
                ),
                SizedBox(
                  width: 220,
                  child: Text(
                    subLabel,
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                            letterSpacing: -0.50,
                            fontSize: 16,
                            color: darkGray,
                            fontWeight: FontWeight.w400)),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Icon(Icons.arrow_forward_ios_sharp, color: gray),
            )
          ],
        ),
      ),
    );

Widget profileItem({required String label, required Function onTap}) => Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(width: 1.5, color: gray)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        splashColor: defaultColorTransparent,
        onTap: () {
          onTap();
        },
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Row(
              children: [
                const Spacer(),
                Text(
                  label,
                  style: GoogleFonts.rubik(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: darkFont,
                      letterSpacing: -0.5),
                ),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );

Widget courseItem({required Course course, required context}) => Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.5, color: gray),
          borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      surfaceTintColor: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                course.thumbnailPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.duration,
                    style: GoogleFonts.rubik(
                        color: successColor,
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  Text(
                    course.name,
                    style: GoogleFonts.rubik(
                        color: darkFont,
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w500,
                        fontSize: 24),
                  ),
                  Text(
                    course.briefDesc,
                    style: GoogleFonts.rubik(
                        color: darkFont,
                        letterSpacing: -0.5,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

Widget videoItem({required Video video, required context}) => InkWell(
  onTap: () => navigateTo(context, VideoPlayer(videoUrl: video.videoUrl)),
  child:   Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.2, color: gray),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    video.thumbnailPath,
                    width: 120,
                  )),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video.videoName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.rubik(
                          textStyle: TextStyle(
                              fontSize: 18,
                              color: darkFont,
                              fontWeight: FontWeight.w500),
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CurvedLinearProgressIndicator(
                        value: 0.98,
                        strokeWidth: 8,
                        backgroundColor: progressBackgroundColor,
                        color: secondaryColor,
                      ),
                    ],
                  ),
                ),
              )
            ],
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
