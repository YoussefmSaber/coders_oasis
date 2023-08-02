import 'package:bloc/bloc.dart';
import 'package:coders_oasis/screens/app-screens/courses-screen/courses_screen.dart';
import 'package:coders_oasis/screens/app-screens/profile-screen/profile_screen.dart';
import 'package:coders_oasis/screens/app-screens/settings-screen/settings_screen.dart';
import 'package:coders_oasis/shared/components/components.dart';
import 'package:coders_oasis/shared/components/constants.dart';
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
        icon: ImageIcon(AssetImage("assets/images/icons/profile.png")),
        label: "Profile"),
    BottomNavigationBarItem(
        icon: ImageIcon(AssetImage("assets/images/icons/settings.png")),
        label: "Settings")
  ];
  List<Widget> appScreens = const [
    CoursesScreen(),
    ProfileScreen(),
    SettingsScreen()
  ];

  static AppLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 2;

  void changeIndex(index) {
    currentIndex = index;
    emit(AppLayoutChangedState());
  }
}
