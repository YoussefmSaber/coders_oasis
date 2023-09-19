import 'package:animations/animations.dart';
import 'package:coders_oasis/screens/app-screens/search_screen.dart';
import 'package:coders_oasis/shared/components/components.dart';
import 'package:coders_oasis/shared/components/constants.dart';
import 'package:coders_oasis/shared/components/shimmer_components.dart';
import 'package:coders_oasis/shared/cubit/courses-screen-cubit/courses_cubit.dart';
import 'package:coders_oasis/shared/cubit/courses-screen-cubit/courses_states.dart';
import 'package:coders_oasis/shared/network/remote/supabase_api.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/course_model.dart';
import '../course-details-screen/course_details_screen.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CoursesScreenCubit, CoursesScreenStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CoursesScreenCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello,",
                          style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w400,
                              color: darkFont,
                              letterSpacing: -0.5,
                              fontSize: 18),
                        ),
                        FutureBuilder<String>(
                          future: cubit.userName,
                          builder: (_, snapshot) => SizedBox(
                            width: 300,
                            child: Text(
                              snapshot.data ?? "",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w600,
                                  color: darkFont,
                                  letterSpacing: -0.5,
                                  fontSize: 24),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    notificationButton(onTap: () {})
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: () => navigateTo(context, SearchScreen()),
                  child: Card(
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          width: 1.2,
                          color: darkGray,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          Text(
                            "Search course",
                            style: GoogleFonts.rubik(
                                textStyle: TextStyle(
                                    color: gray,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400)),
                          ),
                          const Spacer(),
                          Image.asset("assets/images/icons/search-icon.png")
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: RefreshIndicator(
                    backgroundColor: Colors.white,
                    color: defaultColor,
                    onRefresh: () async {
                      // Use await here if SupabaseService().getAllCourses() is asynchronous
                      await SupabaseService().getAllCourses();
                    },
                    child: FutureBuilder<List<Course>>(
                      future: cubit.coursesFuture,
                      builder: (context, snapshot) {
                        return ConditionalBuilder(
                          condition: snapshot.connectionState ==
                              ConnectionState.waiting,
                          builder: (context) => ListView.separated(
                              itemBuilder: (_, index) => courseItemShimmer(),
                              physics: const BouncingScrollPhysics(
                                decelerationRate: ScrollDecelerationRate.normal,
                              ),
                              separatorBuilder: (_, index) => const SizedBox(
                                    height: 8,
                                  ),
                              itemCount: 3),
                          fallback: (context) {
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return const Text('No courses found.');
                            } else {
                              return ListView.separated(
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
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    transitionDuration:
                                        const Duration(milliseconds: 450),
                                    transitionType:
                                        ContainerTransitionType.fadeThrough,
                                    closedBuilder: (context, action) {
                                      return courseItem(
                                        course: course,
                                        context: context,
                                      );
                                    },
                                    openBuilder: (context, action) {
                                      return CourseDetailsScreen(
                                          course: course);
                                    },
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const SizedBox(height: 8),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
