import 'package:coders_oasis/models/video_model.dart';
import 'package:coders_oasis/shared/components/components.dart';
import 'package:coders_oasis/shared/components/constants.dart';
import 'package:coders_oasis/shared/network/remote/supabase_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/course_model.dart';

class CourseVideosScreen extends StatelessWidget {
  CourseVideosScreen({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: getVideos(course.id),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
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
                        Card(
                          elevation: 0,
                          surfaceTintColor: Colors.white,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1.2, color: gray),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: Image.network(
                                  course.thumbnailPath,
                                  width: double.infinity,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  course.name,
                                  style: GoogleFonts.rubik(
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -.5,
                                          color: darkFont)),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  course.briefDesc,
                                  style: GoogleFonts.rubik(
                                      textStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -.5,
                                          color: darkGray)),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (_, index) => videoItem(
                                  video: snapshot.data![index],
                                  context: context),
                              separatorBuilder: (_, index) =>
                                  const SizedBox(height: 8),
                              itemCount: snapshot.data!.length),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: backButton(onTap: () => Navigator.pop(context)),
                  )
                ],
              );
            }
          }),
    ));
  }

  Future<List<Video>> getVideos(courseId) async {
    return await SupabaseService().getCourseVideos(courseId: courseId);
  }
}
