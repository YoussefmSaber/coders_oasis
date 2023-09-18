import 'package:coders_oasis/shared/network/local/cahce_helper.dart';
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
    await CacheHelper.clearCache();
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

  Future<List<Course>> getUserCourses(String userId) async {
    final List<dynamic> coursesData = await supabase
        .from('enrolled_courses')
        .select("course_id")
        .eq("user_id", userId);

    List<String> coursesId = coursesData
        .map((courseId) => courseId["course_id"].toString())
        .toList();
    print(coursesId);
    List<Course> courses = [];

    for (var courseId in coursesId) {
      final courseResponse = await supabase
          .from("courses")
          .select("*")
          .eq("id", courseId);
      final courseList = (courseResponse as List<dynamic>);
      if (courseList.isNotEmpty) {
        final course = Course.fromJson(courseList.first);
        courses.add(course);
        print(course.toString());
      }
    }
    print(courses.toString());
    return courses;
  }

  Future<List<Video>> getCourseVideos({required String courseId}) async {
    final response =
        await supabase.from('videos').select('*').eq('course_id', courseId).order('video_num', ascending: true);

    final videos = (response as List<dynamic>)
        .map((json) => Video.fromJson(json))
        .toList();
    return videos;
  }

  Future<AuthResponse> signup(
      {required String email,
      required String password,
      required String username}) async {
    final AuthResponse res = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {'username': username},
    );

    final Session? session = res.session;
    final User? user = res.user;
    return res;
  }

  Future<AuthResponse> login(
      {required String email, required String password}) async {
    final AuthResponse res = await supabase.auth
        .signInWithPassword(password: password, email: email);

    return res;
  }

  Future<bool> isEmailAlreadyUsed(String email) async {
    final response =
        await supabase.from('auth.users').select().eq('email', email).single();

    // If a user with the given email exists, response.data will not be null
    return response.data != null;
  }

  void addCourseToUser(String userId, String courseId) async {
    print("$userId, $courseId");

    var asd = await supabase
        .from("enrolled_courses")
        .insert({'user_id': userId, 'course_id': courseId});
    print("added the course to the user");
  }

  Future<bool> isCourseEnrolled(String userId, String courseId) async {
    try {
      final List<dynamic> response = await supabase
          .from('enrolled_courses')
          .select("id")
          .eq('user_id', userId)
          .eq('course_id', courseId);

      if (response.runtimeType == null || response.isEmpty) {
        return false;
      } else {
        return true;
      }
    } catch (error) {
      print("Error in isCourseEnrolled: $error");
      return false; // Handle the error here as well.
    }
  }
}
