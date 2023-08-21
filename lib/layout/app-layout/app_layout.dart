import 'package:coders_oasis/shared/components/constants.dart';
import 'package:coders_oasis/shared/cubit/applayout-cubit/applayout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/cubit/applayout-cubit/applayout_states.dart';

class AppLayout extends StatelessWidget {
  int selectedItemIndex = 0;

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
          body: SafeArea(
            child: FutureBuilder(
              // Wait for appScreens to be initialized
              future: cubit.appScreensInitialized,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return cubit.appScreens[cubit.currentIndex];
                }
              },
            ),
          ),
        );
      },
    );
  }
}
