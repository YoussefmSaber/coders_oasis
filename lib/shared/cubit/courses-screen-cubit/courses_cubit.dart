import 'package:bloc/bloc.dart';
import 'package:coders_oasis/shared/cubit/courses-screen-cubit/courses_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/course_model.dart';
import '../../network/remote/supabase_api.dart';

class CoursesScreenCubit extends Cubit<CoursesScreenStates> {


  late Future<List<Course>> coursesFuture;
  final supabaseService = SupabaseService();
  final userName = "";
  late Future<String?> userId;

  static CoursesScreenCubit get(context) => BlocProvider.of(context);

  CoursesScreenCubit() : super(CoursesScreenInitialState()){
    coursesFuture = supabaseService.getAllCourses();
    userId = supabaseService.currentUserId();
  }

  void changeState() {
    emit(CoursesScreenLoadingState());
  }
}
