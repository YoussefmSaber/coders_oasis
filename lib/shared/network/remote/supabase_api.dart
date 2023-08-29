import 'package:coders_oasis/shared/network/remote/google-signin.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:coders_oasis/models/course_model.dart';

import '../../../models/video_model.dart';

import 'package:supabase/supabase.dart';

class SupabaseService {
  static final SupabaseService _singleton = SupabaseService._internal();

  factory SupabaseService() {
    return _singleton;
  }

  SupabaseService._internal();

  final supabase = Supabase.instance.client;

  Future<void> signInUsingToken({
    required Provider provider,
    required String userIdToken,
    String? userAccessToken,
  }) async {
    final AuthResponse res = await supabase.auth.signInWithIdToken(
      provider: provider,
      idToken: userIdToken,
      accessToken: userAccessToken,
    );
    final Session? session = res.session;
    final User? user = res.user;

    // You can store the user session and user data in variables here.
  }

  Future<String?> currentUserId() async {
    return await supabase.auth.currentUser?.id;
  }

  Future<void> signout() async {
    return await supabase.auth.signOut();
  }

  Future<String?> currentUserEmail() async {
    return await supabase.auth.currentUser?.email;
  }

  Future<List<Course>> getAllCourses() async {
    final response = await supabase.from('courses').select('*');
    final courseList = (response as List<dynamic>)
        .map((json) => Course.fromJson(json))
        .toList();
    return courseList;
  }

  Future<List<Video>> getCourseVideos({required String courseId}) async {
    final response =
        await supabase.from('videos').select('*').eq('course_id', courseId);

    final videos = (response.data as List<dynamic>)
        .map((json) => Video.fromJson(json))
        .toList();
    return videos;
  }

  Future<AuthResponse> signup({
    required String email,
    required String password,
    required String username
}) async {
    final AuthResponse res = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {'username': username},
    );

    final Session? session = res.session;
    final User? user = res.user;
    print("'supabase_api:--' \n\n user Data: ${user?.userMetadata}");
    print("'supabase_api:--' \n\n Session Data: ${session?.user.userMetadata}");
    return res;
  }

  Future<AuthResponse> login({
    required String email,
    required String password
}) async {
    final AuthResponse res = await supabase.auth.signInWithPassword(password: password, email: email);

    return res;
  }
}
