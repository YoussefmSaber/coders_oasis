import 'package:coders_oasis/shared/components/components.dart';
import 'package:coders_oasis/shared/components/constants.dart';
import 'package:coders_oasis/shared/network/remote/google-signin.dart';
import 'package:coders_oasis/shared/network/remote/supabase_api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/course_model.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final supabaseService = SupabaseService();
  late Future<List<Course>> coursesFuture;

  @override
  void initState() {
    super.initState();
    coursesFuture = supabaseService.getAllCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                    Text(
                      "Youssef Mohammed",
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w600,
                          color: darkFont,
                          letterSpacing: -0.5,
                          fontSize: 24),
                    )
                  ],
                ),
                const Spacer(),
                notificationButton(onTap: () {})
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              cursorColor: defaultColor,
              decoration: InputDecoration(
                floatingLabelStyle: TextStyle(color: defaultColor),
                labelText: "Search course",
                labelStyle: TextStyle(color: gray),
                suffixIcon: Image(
                  image: AssetImage("assets/images/icons/search-icon.png"),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: gray,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: defaultColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
                child: FutureBuilder<List<Course>>(
              future: coursesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No courses found.');
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    physics: const BouncingScrollPhysics(
                      decelerationRate: ScrollDecelerationRate.normal,
                    ),
                    itemBuilder: (context, index) {
                      final course = snapshot.data![index];
                      return courseItem(
                        duration: course.duration,
                        courseTitle: course.name,
                        courseDescription: course.brief_desc,
                        imageLink: course.thumbnail_path,
                        context: context,
                      );
                    },
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
