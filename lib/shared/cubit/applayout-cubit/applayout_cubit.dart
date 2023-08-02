import 'package:bloc/bloc.dart';
import 'package:coders_oasis/shared/components/components.dart';
import 'package:coders_oasis/shared/components/constants.dart';
import 'package:coders_oasis/shared/cubit/applayout-cubit/applayout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLayoutCubit extends Cubit<AppLayoutStates> {
  AppLayoutCubit() : super(AppLayoutInitialState());

  List<Widget> bottomNavigationItems = [
    NavigationDestination(
      icon: const Icon(Icons.class_rounded),
      label: "Courses",
      selectedIcon: Icon(
        Icons.class_rounded,
        color: defaultColor,
      ),
    ),
    NavigationDestination(
        selectedIcon: ImageIcon(
          AssetImage("assets/images/icons/profile.png"),
          color: defaultColor,
        ),
        icon: const ImageIcon(AssetImage("assets/images/icons/profile.png")),
        label: "Profile"),
    NavigationDestination(
        selectedIcon: ImageIcon(
          AssetImage("assets/images/icons/settings.png"),
          color: defaultColor,
        ),
        icon: ImageIcon(AssetImage("assets/images/icons/settings.png")),
        label: "Settings")
  ];

  List<BottomNavigationBarItem> bottomNavigationItems2 = [
    BottomNavigationBarItem(
      icon: const Icon(Icons.class_rounded),
      label: "Courses",
    ),
    BottomNavigationBarItem(
        icon: const ImageIcon(AssetImage("assets/images/icons/profile.png")),
        label: "Profile"),
    BottomNavigationBarItem(
        icon: ImageIcon(AssetImage("assets/images/icons/settings.png")),
        label: "Settings")
  ];

  static AppLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex(index) {
    currentIndex = index;
    emit(AppLayoutChangedState());
  }
}
