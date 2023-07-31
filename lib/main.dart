import 'package:bloc/bloc.dart';
import 'package:coders_oasis/screens/login/login_screen.dart';
import 'package:coders_oasis/screens/onboarding/onboarding.dart';
import 'package:coders_oasis/shared/bloc_observer.dart';
import 'package:coders_oasis/shared/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:coders_oasis/shared/cubit/onboarding_cubit/onboarding_states.dart';
import 'package:coders_oasis/shared/network/local/cahce_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;
  runApp(MyApp(onBoarding));
}

class MyApp extends StatelessWidget {
  bool onBoarding;

  MyApp(this.onBoarding, {super.key,});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => OnBoardingCubit())],
        child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
            listener: (context, state) {},
            builder: (context, state) => MaterialApp(
                  title: 'Flutter Demo',
                  home: Scaffold(
                      body: SafeArea(child: openScreen())),
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    useMaterial3: true,
                  ),
                )));
  }

  Widget openScreen() {
    if (onBoarding) {
        print(onBoarding);
        return LoginScreen();
    } else {
      return OnBoardingScreen();
    }
  }
}
