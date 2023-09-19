import 'package:coders_oasis/shared/cubit/course-details-cubit/course_details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsStates> {
  CourseDetailsCubit() : super(CourseDetailsInitialState());

  static CourseDetailsCubit get(context) => BlocProvider.of(context);

  void changeState() {
    emit(CourseDetailsRefreshState());
  }
}
