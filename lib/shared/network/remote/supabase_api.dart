import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:coders_oasis/models/course_model.dart';

import '../../../models/video_model.dart';

class SupabaseService {
  static final supabase = Supabase.instance.client;

  static void signInUsingToken(
      {required Provider provider,
      required String userIdToken,
      String? userAccessToken}) {
    supabase.auth
        .signInWithIdToken(
          provider: Provider.google,
          idToken: userIdToken,
          accessToken: userAccessToken,
        )
        .then((value) => print(value));
  }

  Future<List<Course>> getAllCourses() async {
    final response = await supabase.from('courses').select('*');
    final courseList = (response as List<dynamic>)
        .map((json) => Course.fromJson(json))
        .toList();
    print(courseList.length);
    return courseList;
  }

  Future<List<Video>> getCourseVideos({required String courseId}) async {
    final response =
        await supabase.from('videos').select('*').eq('course_id', courseId);

    final videos = (response as List<dynamic>)
        .map((json) => Video.fromJson(json))
        .toList();
    print('Fetched videos: $videos');
    return videos;
  }
}
