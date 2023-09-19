import 'package:coders_oasis/models/course_model.dart';
import 'package:coders_oasis/shared/cubit/search-cubit/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  List<Course> courses = [];

  void setCourses(List<Course> courses) {
    this.courses = courses;
  }

  void changeToLoadingState() {
    emit(SearchLoadingState());
  }

  void changeToSuccessState() {
    emit(SearchSuccessState());
  }

  void changeToErrorState() {
    emit(SearchErrorState());
  }
}
