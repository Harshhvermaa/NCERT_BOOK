import 'package:Ncert_Helper/SCREENS/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Global/global.dart';
import 'SCREENS/SplashScreen.dart';
import 'SCREENS/bookInformation.dart';
import 'SCREENS/demo.dart';
import 'SCREENS/homescreen2.dart';
import 'SCREENS/newHomescreen.dart';
import 'SCREENS/onBoardingone2.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(800, 1280),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
        title: "Class 10 Ncert Books 2023",
      home: sharedPreferences!.getString("Username") == null ? onBoardingtwo() : newHomescreen(),
      builder: EasyLoading.init(),
    );
      },
    );
  }
}