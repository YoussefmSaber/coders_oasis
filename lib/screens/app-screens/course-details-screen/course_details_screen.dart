import 'package:coders_oasis/shared/components/components.dart';
import 'package:coders_oasis/shared/network/remote/supabase_api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/course_model.dart';
import '../../../shared/components/constants.dart';

class CourseDetailsScreen extends StatelessWidget {
  final Course course;

  CourseDetailsScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    var supabaseService = SupabaseService();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            FutureBuilder(
                future: supabaseService.currentUserId(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  } else {
                    String userId = snapshot.data ?? "";
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: SizedBox(
                              width: 250,
                              child: Text(
                                course.name,
                                style: GoogleFonts.rubik(
                                  textStyle: TextStyle(
                                    letterSpacing: -0.5,
                                    color: darkFont,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              course.thumbnailPath,
                              width: double.infinity,
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
                            child: Text(course.description,
                                style: GoogleFonts.rubik(
                                    fontSize: 14,
                                    height: 1.5,
                                    color: darkFont,
                                    fontWeight: FontWeight.w400)),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 4.0, top: 16.0, bottom: 8),
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
                                course.duration,
                                style: GoogleFonts.rubik(
                                    color: darkFont,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                          const Spacer(),
                          FutureBuilder(
                              future: supabaseService.isCourseEnrolled(
                                  userId, course.id),
                              builder: (BuildContext context,
                                  AsyncSnapshot<bool> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  // Handle errors here.
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  // The future has completed. Check the result.
                                  if (snapshot.data == true) {
                                    return defaultButton(
                                        text: "Continue to the course",
                                        onTap: () {},
                                        textColor: "ffffff",
                                        buttonWidth: double.infinity);
                                  }
                                  else if (snapshot.data == false) {
                                    return defaultButton(
                                        text: "Add to your library",
                                        onTap: () {
                                          print(userId);
                                          supabaseService.addCourseToUser(userId, course.id);
                                        },
                                        textColor: "ffffff",
                                        buttonWidth: double.infinity);
                                  }
                                  else {
                                    return Text("Error happend");
                                  }
                                }
                              }),
                        ],
                      ),
                    );
                  }
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: backButton(onTap: () {
                Navigator.pop(context);
              }),
            )
          ],
        ),
      ),
    );
  }
}
