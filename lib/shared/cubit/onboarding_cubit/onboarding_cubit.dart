import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/boarding_model.dart';
import 'onboarding_states.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  List<BoardingModel> onBoardingItems = [
    BoardingModel(
        image: 'assets/images/onboarding1.png',
        title: 'Learn anytime\nand anywhere',
        body: 'Quarantine is the perfect time to spend your\n'
            'day learning something new, from anywhere!'),
    BoardingModel(
        image: 'assets/images/onboarding2.png',
        title: 'Find a course\nfor you',
        body: 'You can search across thousands of courses\n'
            'and discover your passion through diverse options.'),
    BoardingModel(
        image: 'assets/images/onboarding3.png',
        title: 'Improve your skills',
        body: 'Enhance skills through daily practice,\nunlock potential, achieve greatness')
  ];
  int currentIndex = 0;

  static OnBoardingCubit get(context) => BlocProvider.of(context);
}
