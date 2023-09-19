import 'package:coders_oasis/shared/cubit/courses-screen-cubit/courses_states.dart';
import 'package:coders_oasis/shared/network/local/cahce_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/course_model.dart';
import '../../network/remote/supabase_api.dart';

class CoursesScreenCubit extends Cubit<CoursesScreenStates> {


  late Future<List<Course>> coursesFuture;
  final supabaseService = SupabaseService();
  late Future<String> userName;
  late Future<String?> userId;

  static CoursesScreenCubit get(context) => BlocProvider.of(context);

  CoursesScreenCubit() : super(CoursesScreenInitialState()){
    coursesFuture = supabaseService.getAllCourses();
    userId = supabaseService.currentUserId();
    userName = gettingUserName();
  }

  Future<String> gettingUserName() async {
    return await CacheHelper.getData(key: "displayName");
  }

  void changeState() {
    emit(CoursesScreenLoadingState());
  }
}
