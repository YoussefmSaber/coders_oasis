import 'package:bloc/bloc.dart';
import 'package:coders_oasis/shared/cubit/my-courses-cubit/my_courses_states.dart';
import 'package:coders_oasis/shared/network/remote/supabase_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/course_model.dart';

class MyCoursesCubit extends Cubit<MyCoursesStates> {
  static MyCoursesCubit get(context) => BlocProvider.of(context);

  late final Future<List<Course>> coursesFuture;
  final supabaseService = SupabaseService();
  late Future<String?> userId;

  MyCoursesCubit() : super(MyCoursesInitialState()) {
    userId = supabaseService.currentUserId();
  }

  void changeState() {
    emit(MyCoursesRefreshState());
  }
}

