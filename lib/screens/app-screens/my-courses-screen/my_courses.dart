import 'package:animations/animations.dart';
import 'package:coders_oasis/shared/cubit/my-courses-cubit/my_courses_cubit.dart';
import 'package:coders_oasis/shared/cubit/my-courses-cubit/my_courses_states.dart';
import 'package:coders_oasis/shared/network/remote/supabase_api.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

import '../../../models/course_model.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../course-details-screen/course_details_screen.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCoursesCubit, MyCoursesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MyCoursesCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(top: 16.0, right: 16, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: SizedBox(
                          width: 250,
                          child: Text(
                            "My Courses",
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
                      FutureBuilder<List<Course>>(
                          future: cubit.userId.then((value) {
                            if (value != null) {
                              return SupabaseService().getUserCourses(value);
                            } else {
                              return SupabaseService().getUserCourses("");
                            }
                          }),
                          builder: (context, snapshot) {
                            return ConditionalBuilder(
                              condition: state == MyCoursesRefreshState() && snapshot.connectionState != ConnectionState.waiting,
                              builder: (context) =>
                                  Expanded(
                                      child: Column(children: [
                                        const Spacer(),
                                        CircularProgressIndicator(
                                          color: defaultColor,
                                        ),
                                        const Spacer()
                                      ])),
                              fallback: (context) {
                                if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else if (!snapshot.hasData ||
                                    snapshot.data!.isEmpty) {
                                  return Text('No courses found.');
                                } else {
                                  return Expanded(
                                      child: ListView.separated(
                                        itemCount: snapshot.data!.length,
                                        physics: const BouncingScrollPhysics(
                                          decelerationRate:
                                          ScrollDecelerationRate.normal,
                                        ),
                                        itemBuilder: (context, index) {
                                          final course = snapshot.data![index];
                                          return OpenContainer(
                                              openElevation: 0,
                                              closedElevation: 0,
                                              closedShape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(16)),
                                              transitionDuration:
                                              const Duration(milliseconds: 450),
                                              transitionType:
                                              ContainerTransitionType
                                                  .fadeThrough,
                                              closedBuilder: (context, action) {
                                                return courseItem(
                                                  course: course,
                                                  context: context,
                                                );
                                              },
                                              openBuilder: (context, action) {
                                                return CourseDetailsScreen(
                                                    course: course);
                                              });
                                        },
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                        const SizedBox(
                                          height: 8,
                                        ),
                                      ));
                                }
                              },
                            );
                          })
                    ],
                  ),
                ),
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
      },
    );
  }
}
