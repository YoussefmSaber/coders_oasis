import 'package:coders_oasis/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CourseAddedScreen extends StatelessWidget {
  const CourseAddedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), (){
      Navigator.pop(context);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
          children: [
            const Spacer(),
            Image.asset("assets/images/images/course-added.png"),
            const SizedBox(height: 16,),
            Text(
            "Course was added",
            style: GoogleFonts.rubik(
                fontSize: 24,
                color: darkFont,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.5),
          ),
            Text(
            "You can find this course in \nyour profile",
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(fontSize: 14, color: darkGray),
          ),
            const Spacer(),
          ],
      )),
    );
  }
}
