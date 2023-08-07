import 'package:coders_oasis/screens/authentication-screens/login/login_screen.dart';
import 'package:coders_oasis/screens/onboarding/onboarding.dart';
import 'package:coders_oasis/shared/bloc_observer.dart';
import 'package:coders_oasis/shared/cubit/applayout-cubit/applayout_cubit.dart';
import 'package:coders_oasis/shared/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:coders_oasis/shared/cubit/onboarding_cubit/onboarding_states.dart';
import 'package:coders_oasis/shared/cubit/settings-cubit/settings_cubit.dart';
import 'package:coders_oasis/shared/network/local/cahce_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'layout/app-layout/app_layout.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: '',
    anonKey: 'public-anon-key',
  );

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();
  var onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;

  runApp(MyApp(onBoarding));
}

class MyApp extends StatelessWidget {
  bool onBoarding;

  MyApp(
    this.onBoarding, {
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => OnBoardingCubit()),
          BlocProvider(create: (context) => AppLayoutCubit()),
          BlocProvider(create: (context) => SettingsCubit())
        ],
        child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
            listener: (context, state) {},
            builder: (context, state) => MaterialApp(
                  title: 'Flutter Demo',
                  home: Scaffold(body: SafeArea(child: AppLayout())),
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    useMaterial3: true,
                  ),
                )));
  }

  Widget openScreen() {
    if (onBoarding) {
      return const LoginScreen();
    } else {
      return OnBoardingScreen();
    }
  }
}
