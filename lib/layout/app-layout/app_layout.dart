import 'package:coders_oasis/shared/components/constants.dart';
import 'package:coders_oasis/shared/cubit/applayout-cubit/applayout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/cubit/applayout-cubit/applayout_states.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLayoutCubit, AppLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppLayoutCubit.get(context);
        return Scaffold(
          bottomNavigationBar:
          BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            type: BottomNavigationBarType.fixed,
            items: cubit.bottomNavigationItems2,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            selectedItemColor: defaultColor,
            onTap: (index) => cubit.changeIndex(index),
          )
        );
      },
    );
  }
}
