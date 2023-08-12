import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:green_house/cubit/login_cubit.dart';
import 'package:green_house/View/OnboardingScreen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:green_house/constants/constimage.dart';
import 'package:green_house/controller/bottom_nav_bar_controller.dart';
import 'package:green_house/View/Login.dart';
import 'package:green_house/View/species.dart';
import 'package:green_house/View/species_search.dart';
import 'package:green_house/View/planet_details_screen.dart';
import 'package:green_house/View/profile_screen.dart';
import 'package:path_provider/path_provider.dart'
    as path_provider; // Import this line for Hive initialization.

import 'cubit/createaccount_cubit.dart';
import 'model/planet_data_model.dart';
import 'network/dio_helper.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PlanetDataModelAdapter());
  DioHelper.init();

  runApp(const MyApp());
  // WidgetsFlutterBinding.ensureInitialized();
  // final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  // Hive.init(appDocumentDir.path);
  // Hive.registerAdapter(PlanetDataModelAdapter());
  // Register your Hive adapter.
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => CreateaccountCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,

        home: OnboardingScreen(num: 1),
        // home: OnboardingScreen(num: 1),
        //home: Sign_UP(),
      ),
    );
  }
}
