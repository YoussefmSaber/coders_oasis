import 'package:coders_oasis/shared/components/constants.dart';
import 'package:coders_oasis/shared/cubit/applayout-cubit/applayout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/cubit/applayout-cubit/applayout_states.dart';

class AppLayout extends StatelessWidget {
  final int selectedItemIndex = 0;

  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLayoutCubit, AppLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppLayoutCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            type: BottomNavigationBarType.fixed,
            items: cubit.bottomNavigationItems,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            selectedItemColor: defaultColor,
            onTap: (index) => cubit.changeIndex(index),
          ),
          body: SafeArea(child: cubit.appScreens[cubit.currentIndex]),
        );
      },
    );
  }
}
