import 'package:coders_oasis/shared/cubit/search-cubit/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

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
