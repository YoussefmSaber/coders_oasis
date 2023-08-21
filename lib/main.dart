import 'package:coders_oasis/screens/authentication-screens/login/login_screen.dart';
import 'package:coders_oasis/screens/onboarding/onboarding.dart';
import 'package:coders_oasis/shared/bloc_observer.dart';
import 'package:coders_oasis/shared/cubit/applayout-cubit/applayout_cubit.dart';
import 'package:coders_oasis/shared/cubit/courses-screen-cubit/courses_cubit.dart';
import 'package:coders_oasis/shared/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:coders_oasis/shared/cubit/settings-cubit/settings_cubit.dart';
import 'package:coders_oasis/shared/network/local/cahce_helper.dart';
import 'package:coders_oasis/shared/network/remote/api-keys.dart';
import 'package:coders_oasis/shared/network/remote/supabase_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'layout/app-layout/app_layout.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: projectUrl,
    anonKey: projectanonKey,
  );
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  var onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;

  runApp(MyApp(onBoarding));
}

class MyApp extends StatelessWidget {
  final bool onBoarding;

  MyApp(
    this.onBoarding, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnBoardingCubit()),
        BlocProvider(create: (context) => AppLayoutCubit()),
        BlocProvider(create: (context) => SettingsCubit()),
        BlocProvider(create: (context) => CoursesScreenCubit())
      ],
      child: FutureBuilder<String?>(
        future: SupabaseService().currentUserId(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Handle error if necessary
            return MaterialApp(
              title: 'Flutter Demo',
              home: Scaffold(
                body: SafeArea(child: Text('An error occurred')),
              ),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: true,
              ),
            );
          } else {
            final currentUserId = snapshot.data;

            // Check if the current user session is valid
            if (currentUserId != null) {
              return MaterialApp(
                title: 'Flutter Demo',
                home: AppLayout(),
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  useMaterial3: true,
                ),
              );
            } else {
              return MaterialApp(
                title: 'Flutter Demo',
                home: Scaffold(
                  body: SafeArea(
                      child: onBoarding ? LoginScreen() : OnBoardingScreen()),
                ),
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  useMaterial3: true,
                ),
              );
            }
          }
        },
      ),
    );
  }
}
