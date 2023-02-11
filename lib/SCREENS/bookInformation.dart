import 'dart:convert';
import 'dart:math';

import 'package:Ncert_Helper/Constants/app_colors.dart';
import 'package:Ncert_Helper/Widgets/custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/constants.dart';

class BookInformation extends StatefulWidget {
  String icon;
  String about;
  String whichclass;
  String bookName;
  BookInformation(
      {super.key,
      required this.about,
      required this.icon,
      required this.whichclass,
      required this.bookName});

  @override
  State<BookInformation> createState() => _BookInformationState();
}

class _BookInformationState extends State<BookInformation> {
  List<String> difficultyLevel = [
    "Easy",
    "Medium",
    "Hard",
    "Pro",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: SCREEN_HEIGHT(context),
        width: SCREEN_WIDTH(context),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.png"), fit: BoxFit.fill),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                /// orange Background
                Container(
                  height: SCREEN_HEIGHT(context) * 0.68,
                  width: SCREEN_WIDTH(context),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/bookinformation.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),

                Column(
                  children: [
                    SizedBox(
                      height: 70.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 40.w,
                        ),
                        Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                          size: 40.h,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Container(
                      height: 370.h,
                      width: 340.w,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                          color: Color.fromARGB(255, 235, 235, 235),
                          width: 5,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(0, 6),
                              blurRadius: 9,
                              spreadRadius: 0.3)
                        ],
                        borderRadius: BorderRadius.circular(40.w),
                        image: DecorationImage(
                            image: MemoryImage(
                              base64Decode("${widget.icon}"),
                            ),
                            fit: BoxFit.fill),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "${widget.whichclass}",
                      style: SET_FONT_STYLE(62.sp, FontWeight.w600,
                          Color.fromARGB(255, 255, 255, 255)),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "${widget.bookName!}",
                      style: SET_FONT_STYLE(32.sp, FontWeight.w600,
                          Color.fromARGB(255, 255, 255, 255)),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    SizedBox(
                      width: SCREEN_WIDTH(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Difficulty",
                                style: SET_FONT_STYLE(40.sp, FontWeight.w300,
                                    Color.fromARGB(255, 255, 255, 255)),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                "${difficultyLevel[Random().nextInt(3)]}",
                                style: SET_FONT_STYLE(36.sp, FontWeight.w600,
                                    Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Language",
                                style: SET_FONT_STYLE(40.sp, FontWeight.w300,
                                    Color.fromARGB(255, 255, 255, 255)),
                              ),
                              Text(
                                "Eng",
                                style: SET_FONT_STYLE(36.sp, FontWeight.w600,
                                    Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    transform: Matrix4.translationValues(0.0, -45.0.h, 0.0),
                    width: SCREEN_WIDTH(context) * 0.8,
                    decoration: BoxDecoration(
                        color: Color(0xffD23402),
                        image: DecorationImage(
                            image: MemoryImage(
                          base64Decode("${widget.icon!}"),
                        )),
                        borderRadius: BorderRadius.circular(20.w)),
                    child: CustomButtonWidget(
                      text: "Read Book",
                      fontSize: 37.sp,
                      textColor: AppColors.whiteColor,
                      color: Color(0xffD23402),
                      onPressed: () {},
                    )),
              ],
            ),
            
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.0.w),
                        child: Text(
                          "About Book",
                          style: SET_FONT_STYLE(
                              42.sp, FontWeight.w600, Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 20.h),
                        child: Text(
                          "${widget.about!}",
                          style: SET_FONT_STYLE(
                              32.sp, FontWeight.w400, Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
