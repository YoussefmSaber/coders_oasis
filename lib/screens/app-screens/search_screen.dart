import 'package:animations/animations.dart';
import 'package:coders_oasis/models/course_model.dart';
import 'package:coders_oasis/screens/app-screens/course-details-screen/course_details_screen.dart';
import 'package:coders_oasis/shared/components/components.dart';
import 'package:coders_oasis/shared/components/constants.dart';
import 'package:coders_oasis/shared/components/shimmer_components.dart';
import 'package:coders_oasis/shared/cubit/search-cubit/search_cubit.dart';
import 'package:coders_oasis/shared/cubit/search-cubit/search_states.dart';
import 'package:coders_oasis/shared/network/remote/supabase_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isClearOn = false;
    var cubit = SearchCubit.get(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocConsumer<SearchCubit, SearchStates>(
            listener: (_, state) {},
            builder: (_, state) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    backButton(onTap: () => Navigator.pop(context)),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) async {
                          cubit.changeToLoadingState();
                          List<Course> updatedCourses =
                              await SupabaseService().courseSearch(value);
                          if (updatedCourses.isEmpty) {
                            cubit.changeToErrorState();
                          } else {
                            cubit.changeToSuccessState();
                            cubit.setCourses(updatedCourses);
                          }
                        },
                        cursorColor: defaultColor,
                        cursorRadius: const Radius.circular(10),
                        cursorWidth: 2,
                        decoration: InputDecoration(
                          hintText: "Search for courses",
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: defaultColor)),
                          suffixIcon: //clear button
                              IconButton(
                            onPressed: () {
                              searchController.clear();
                              cubit.changeToErrorState();
                            },
                            icon: isClearOn
                                ? const Icon(Icons.clear)
                                : Image.asset(
                                    "assets/images/icons/search-icon.png"),
                          ),
                        ),
                        onTapOutside: (event) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        onTap: () {
                          isClearOn = true;
                          cubit.changeToLoadingState();
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (state is SearchLoadingState)
                      Expanded(
                          child: ListView.separated(
                              itemBuilder: (_, index) => courseItemShimmer(),
                              separatorBuilder: (_, index) =>
                                  const SizedBox(height: 8),
                              itemCount: 3))
                    else if (state is SearchSuccessState)
                      Expanded(
                          child: ListView.separated(
                              itemBuilder: (_, index) => OpenContainer(
                                    openElevation: 0,
                                    closedElevation: 0,
                                    closedShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    transitionDuration:
                                        const Duration(milliseconds: 450),
                                    transitionType:
                                        ContainerTransitionType.fadeThrough,
                                    closedBuilder: (context, action) =>
                                        courseItem(
                                            course: cubit.courses[index],
                                            context: context),
                                    openBuilder: (context, action) =>
                                        CourseDetailsScreen(
                                      course: cubit.courses[index],
                                    ),
                                  ),
                              separatorBuilder: (_, index) =>
                                  const SizedBox(height: 8),
                              itemCount: cubit.courses.length))
                    else
                      Expanded(
                          child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                  "assets/images/images/empty-search.png"),
                              const SizedBox(height: 2),
                              Text("No courses found",
                                  style: GoogleFonts.rubik(
                                    textStyle: TextStyle(
                                        color: darkFont,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.5),
                                  )),
                              const SizedBox(height: 2),
                              Text(
                                "Try searching the course with \na different keyword",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.rubik(
                                  textStyle: TextStyle(
                                      color: darkGray,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  ]),
            ),
          ),
        ));
  }
}
