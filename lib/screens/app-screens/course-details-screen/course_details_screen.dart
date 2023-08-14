import 'package:coders_oasis/layout/app-layout/app_layout.dart';
import 'package:coders_oasis/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/components/constants.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      "Course Name",
                      style: GoogleFonts.rubik(
                        letterSpacing: -0.5,
                        color: darkFont,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      "assets/images/images/ui-course.jpg",
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Card(
                        color: secondaryColor,
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 2),
                          child: Text(
                            "\$ 50",
                            style: GoogleFonts.rubik(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4),
                      child: Text(
                        "About the course",
                        style: GoogleFonts.rubik(
                            letterSpacing: -0.5,
                            color: darkFont,
                            fontWeight: FontWeight.w500,
                            fontSize: 22),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                        "You can launch a new career in web development today by learning HTML & CSS. You don't need a computer science degree or expensive software. All you need is a computer, a bit of time, a lot of determination, and a teacher you trust.",
                        style: GoogleFonts.rubik(
                            fontSize: 14,
                            height: 1.5,
                            color: darkFont,
                            fontWeight: FontWeight.w400)),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 4.0, top: 16.0, bottom: 8),
                      child: Text(
                        "Duration",
                        style: GoogleFonts.rubik(
                            letterSpacing: -0.5,
                            color: darkFont,
                            fontWeight: FontWeight.w500,
                            fontSize: 22),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 4.0,
                      ),
                      child: Text(
                        "1 h 30 min",
                        style: GoogleFonts.rubik(
                            color: darkFont,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  const Spacer(),
                  defaultButton(
                      text: "Add to cart",
                      onTap: () {},
                      textColor: "ffffff",
                      buttonWidth: double.infinity)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: backButton(onTap: () {
                navigateTo(context, AppLayout());
              }),
            )
          ],
        ),
      ),
    );
  }
}
