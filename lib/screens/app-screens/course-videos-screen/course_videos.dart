import 'package:coders_oasis/models/video_model.dart';
import 'package:coders_oasis/shared/components/components.dart';
import 'package:coders_oasis/shared/network/remote/supabase_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CourseVideosScreen extends StatelessWidget {
  const CourseVideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var supabaseService = SupabaseService();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FutureBuilder(
            future: getVideos("607fe6b7-f624-4b2d-ae89-83a984a98c6d"),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                return ListView.separated(
                    itemBuilder: (_, index) =>
                        videoItem(video: snapshot.data![index], context: context),
                    separatorBuilder: (_, index) => const SizedBox(height: 8),
                    itemCount: snapshot.data!.length);
              }
            }),
      ),
    ));
  }

  Future<List<Video>> getVideos(courseId) async {
    return await SupabaseService().getCourseVideos(courseId: courseId);
  }
}
