import 'package:coders_oasis/screens/app-screens/courses-screen/courses_screen.dart';
import 'package:coders_oasis/screens/app-screens/profile-screen/profile_screen.dart';
import 'package:coders_oasis/screens/app-screens/settings-screen/settings_screen.dart';
import 'package:coders_oasis/shared/cubit/applayout-cubit/applayout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLayoutCubit extends Cubit<AppLayoutStates> {
  AppLayoutCubit() : super(AppLayoutInitialState());

  List<BottomNavigationBarItem> bottomNavigationItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.class_rounded),
      label: "Courses",
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: "Profile"),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings_rounded),
        label: "Settings")
  ];
  List<Widget> appScreens = [
    CoursesScreen(),
    ProfileScreen(),
    const SettingsScreen()
  ];

  static AppLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex(index) {
    currentIndex = index;
    emit(AppLayoutChangedState());
  }
}
