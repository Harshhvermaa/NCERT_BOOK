import 'package:Ncert_Helper/SCREENS/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Constants/app_colors.dart';
import '../Constants/constants.dart';
import '../Widgets/custom_Button.dart';
import 'homescreen2.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SCREEN_HEIGHT(context),
        width: SCREEN_WIDTH(context),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 150.h,
            ),
            Image(
              image: AssetImage("assets/bookspng.png"),
              width: SCREEN_WIDTH(context) * 0.8,
            ),
            SizedBox(
              height: 100.h,
            ),
            Text(
              "Your Book Library\nMake Your Own Space.",
              textAlign: TextAlign.center,
              style: SET_FONT_STYLE(60.sp, FontWeight.w800, Colors.black),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "A place where you can find all your\nfavorite authors and characters.",
              textAlign: TextAlign.center,
              style: SET_FONT_STYLE(35.sp, FontWeight.w200, Colors.black),
            ),
            Spacer(),
            Container(
              height: 90.h,
              width: SCREEN_WIDTH(context) * 0.9,
              child: CustomButtonWidget(
                text: "Get Started",
                color: AppColors.primaryColor,
                onPressed: () {
                  print("object");
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Homescreen2(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
          ],
        ),
      ),
    );
  }
}
