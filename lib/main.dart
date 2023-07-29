import 'package:bloc/bloc.dart';
import 'package:coders_oasis/screens/onboarding/onboarding.dart';
import 'package:coders_oasis/shared/bloc_observer.dart';
import 'package:coders_oasis/shared/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:coders_oasis/shared/cubit/onboarding_cubit/onboarding_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                      body: SafeArea(child: OnBoardingScreen())),
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    useMaterial3: true,
                  ),
                )));
  }
}
