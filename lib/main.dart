import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_house/Cubit/login_cubit.dart';
import 'package:green_house/View/OnboardingScreen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:green_house/constants/constimage.dart';
import 'package:green_house/controller/bottom_nav_bar_controller.dart';
import 'package:green_house/View/Login.dart';
import 'package:green_house/View/species.dart';
import 'package:green_house/View/species_search.dart';
import 'package:green_house/View/planet_details_screen.dart';
import 'package:green_house/View/profile_screen.dart';

void main() async {
  runApp(const MyApp());
  await Hive.initFlutter();
  Hive.openBox(plant1);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: OnboardingScreen(num: 1),
        // home: MyPlanetApp() ,
        //home: Sign_UP(),
      ),
    );
  }
}
