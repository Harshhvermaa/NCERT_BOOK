// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:math';

import 'package:Ncert_Helper/Constants/constants.dart';
import 'package:Ncert_Helper/Function/firebaseFunction.dart';
import 'package:Ncert_Helper/Models/bookData.dart';
import 'package:Ncert_Helper/SCREENS/bookInformation.dart';
import 'package:Ncert_Helper/Widgets/bookList.dart';
import 'package:Ncert_Helper/Widgets/custom_Button.dart';
import 'package:Ncert_Helper/Widgets/searchbar.dart';
import 'package:cached_memory_image/provider/cached_memory_image_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../Widgets/handpicked4you.dart';

class Homescreen2 extends StatefulWidget {
  const Homescreen2({super.key});

  @override
  State<Homescreen2> createState() => _Homescreen2State();
}

class _Homescreen2State extends State<Homescreen2> {
  List<String> _iconList = [
    "1.png",
    "2.png",
    "3.png",
    "4.png",
    "5.png",
    "6.png",
    "7.png",
  ];
  List<String> _quotesList = [
    "A book is a gift you can open again and again.",
    "A good book is an event in my life.",
    "Reading is a discount ticket to everywhere.",
    "I intend to put up with nothing that I can put down",
    "Once you learn to read,you will be forever free",
  ];
  List<Color> _colorsList = [
    Color(0xffE9A93A),
    Color(0xffB8EAD9),
    Color(0xffF8EC70),
    Color(0xffFAA978),
    Color(0xffFF768B),
    Color(0xff6A5EEF),
    Color(0xffBCE1E1),
    Color(0xffFDB850),
  ];
  List<int> _randomIndexList = [
    9,
    8,
    7,
    2,
    1,
    5,
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
                image: AssetImage("assets/bg.png"), fit: BoxFit.fill)),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("AppData")
              .doc("Class 10")
              .collection("Subjects")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  // SEARCH BAT
                  Padding(
                    padding:
                        EdgeInsets.only(left: 25.0.w, right: 25.0.w, top: 90.h),
                    child: Container(
                      height: SCREEN_HEIGHT(context) * 0.06,
                      width: SCREEN_WIDTH(context),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                offset: Offset(5, 6),
                                blurRadius: 5,
                                spreadRadius: 0.3)
                          ],
                          borderRadius: BorderRadius.circular(20.w)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30.w,
                          ),
                          Image(
                            image: AssetImage("assets/search.png"),
                            height: 40.h,
                            width: 40.w,
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          Expanded(
                              child: TextFormField(
                            cursorColor: Colors.black,
                            cursorHeight: 50.sp,
                            cursorRadius: Radius.circular(80.w),
                            showCursor: true,
                            style: SET_FONT_STYLE(
                                40.sp, FontWeight.w400, Colors.black),
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          )),
                        ],
                      ),
                    ),
                  ),
                  // CHAPTER NAME LIST
                  Padding(
                    padding: EdgeInsets.only(left: 25.0.w, top: 30.h),
                    child: Container(
                      width: SCREEN_WIDTH(context),
                      height: SCREEN_WIDTH(context) * 0.1,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(
                                () => BookInformation(
                                    about:
                                        "${snapshot.data!.docs[index].data()["about"]}",
                                    icon:
                                        "${snapshot.data!.docs[index].data()["Icon"]}",
                                    whichclass:
                                        "${snapshot.data!.docs[index].data()["Class"]}",
                                    bookName:
                                        "${snapshot.data!.docs[index].data()["Subject"]}"),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 28.w),
                              padding: EdgeInsets.only(
                                  left: 20.0.w,
                                  right: 20.0.w,
                                  top: 8.h,
                                  bottom: 8.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.w),
                                border: Border.all(
                                  color: Color.fromARGB(255, 205, 205, 205),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Image(
                                      image: AssetImage(index >
                                              _iconList.length - 1
                                          ? "assets/${_iconList[Random().nextInt(5)]}"
                                          : "assets/${_iconList[index]}")),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Center(
                                      child: Text(
                                    "${snapshot.data!.docs[index].id}",
                                    style: SET_FONT_STYLE(30.sp,
                                        FontWeight.w400, Color(0xff433728)),
                                  )),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // HAND PICKED FOR YOU
                  Padding(
                    padding:
                        EdgeInsets.only(left: 25.0.w, right: 25.0.w, top: 30.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Hand-Picked for you",
                          style: SET_FONT_STYLE(42.sp, FontWeight.w600,
                              Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                  ),
                  // BOOKS
                  Padding(
                    padding: EdgeInsets.only(left: 25.0.w, top: 30.h),
                    child: Container(
                      width: SCREEN_WIDTH(context),
                      height: SCREEN_WIDTH(context) * 0.51,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length > 6
                            ? 6
                            : snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 28.w),
                            padding: EdgeInsets.only(
                                left: 8.h, right: 8.h, top: 8.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color.fromARGB(255, 205, 205, 205),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(20.w),
                            ),
                            child: Column(
                              children: [
                                /// Image
                                InkWell(
                                  onTap: () {
                                    Get.to(
                                      () => BookInformation(
                                          about:
                                              "${snapshot.data!.docs[index].data()["about"]}",
                                          icon:
                                              "${snapshot.data!.docs[index].data()["Icon"]}",
                                          whichclass:
                                              "${snapshot.data!.docs[index].data()["Class"]}",
                                          bookName:
                                              "${snapshot.data!.docs[index].data()["Subject"]}"),
                                    );
                                  },
                                  child: Container(
                                    height: 250.h,
                                    width: 240.w,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(20.w),
                                      image: DecorationImage(
                                        image: CachedMemoryImageProvider(
                                          'app://image/${snapshot.data!.docs[index].id}image',
                                          base64:
                                              "${snapshot.data!.docs[index].data()["Icon"]}",
                                        )
                                        //     MemoryImage(
                                        //   base64Decode(
                                        //       "${snapshot.data!.docs[index].data()["Icon"]}"),
                                        // )
                                        ,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  width: 240.w,
                                  // height: 20,
                                  // color: Colors.white,
                                  child: RatingBar.builder(
                                    initialRating: double.parse(
                                        (Random().nextInt(3) + 3).toString()),
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemSize: 25,
                                    itemCount: 5,
                                    unratedColor: Colors.black,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 2.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Color.fromARGB(255, 255, 191, 0),
                                    ),
                                    ignoreGestures: true,
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // SOMETHING INTERESTING FOR YOU
                  Padding(
                    padding:
                        EdgeInsets.only(left: 25.0.w, right: 25.0.w, top: 30.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Something-Interesting for you",
                          style: SET_FONT_STYLE(42.sp, FontWeight.w600,
                              Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                  ),
                  // BOOKS
                  Padding(
                    padding: EdgeInsets.only(left: 25.0.w, top: 30.h),
                    child: InkWell(
                      child: Container(
                        width: SCREEN_WIDTH(context),
                        height: SCREEN_WIDTH(context) * 0.41,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length > 5
                              ? 5
                              : snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                print(
                                    "${snapshot.data!.docs[index].data()["Subject"]}");
                                Get.to(
                                  () => BookInformation(
                                      about:
                                          "${snapshot.data!.docs[_randomIndexList[index]].data()["about"]}",
                                      icon:
                                          "${snapshot.data!.docs[_randomIndexList[index]].data()["Icon"]}",
                                      whichclass:
                                          "${snapshot.data!.docs[_randomIndexList[index]].data()["Class"]}",
                                      bookName:
                                          "${snapshot.data!.docs[_randomIndexList[index]].data()["Subject"]}"),
                                );
                              },
                              child: Container(
                                width: SCREEN_WIDTH(context) * 0.9,
                                margin: EdgeInsets.only(right: 28.w),
                                padding: EdgeInsets.only(
                                    left: 12.h,
                                    right: 12.h,
                                    top: 12.h,
                                    bottom: 12.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.w),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      color: Colors.black,
                                      height: 0,
                                      child: RatingBar.builder(
                                        initialRating: double.parse(
                                            (Random().nextInt(3) + 3)
                                                .toString()),
                                        direction: Axis.horizontal,
                                        allowHalfRating: false,
                                        itemSize: 25,
                                        itemCount: 5,
                                        unratedColor: Colors.black,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color:
                                              Color.fromARGB(255, 255, 191, 0),
                                        ),
                                        ignoreGestures: true,
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: SCREEN_WIDTH(context) * 0.4,
                                          child: Text(
                                            "${_quotesList[index]}",
                                            style: SET_FONT_STYLE(
                                                42.sp,
                                                FontWeight.w600,
                                                Color.fromARGB(255, 0, 0, 0)),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            /// Image
                                            Container(
                                              height: 215.h,
                                              width: 200.w,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.w),
                                                image: DecorationImage(
                                                    image: MemoryImage(
                                                  base64Decode(
                                                      "${snapshot.data!.docs[_randomIndexList[index]].data()["Icon"]}"),
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  // Ncert Class 10
                  Padding(
                    padding:
                        EdgeInsets.only(left: 25.0.w, right: 25.0.w, top: 30.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Ncert Class 10",
                          style: SET_FONT_STYLE(42.sp, FontWeight.w600,
                              Color.fromARGB(255, 0, 0, 0)),
                        ),
                        // CustomButtonWidget(
                        //   text: text)
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  // SEARCH BAR
                  Padding(
                    padding:
                        EdgeInsets.only(left: 25.0.w, right: 25.0.w, top: 90.h),
                    child: Container(
                      height: SCREEN_HEIGHT(context) * 0.06,
                      width: SCREEN_WIDTH(context),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                offset: Offset(5, 6),
                                blurRadius: 5,
                                spreadRadius: 0.3)
                          ],
                          borderRadius: BorderRadius.circular(20.w)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30.w,
                          ),
                          Image(
                            image: AssetImage("assets/search.png"),
                            height: 40.h,
                            width: 40.w,
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          Expanded(
                              child: TextFormField(
                            cursorColor: Colors.black,
                            cursorHeight: 50.sp,
                            cursorRadius: Radius.circular(80.w),
                            showCursor: true,
                            style: SET_FONT_STYLE(
                                40.sp, FontWeight.w400, Colors.black),
                            decoration:
                                InputDecoration(border: InputBorder.none),
                          )),
                        ],
                      ),
                    ),
                  ),
                  // CHAPTER NAME LIST
                  Padding(
                    padding: EdgeInsets.only(left: 25.0.w, top: 30.h),
                    child: Container(
                      width: SCREEN_WIDTH(context),
                      height: SCREEN_WIDTH(context) * 0.1,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 28.w),
                            padding: EdgeInsets.only(
                                left: 20.0.w,
                                right: 20.0.w,
                                top: 8.h,
                                bottom: 8.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.w),
                              border: Border.all(
                                color: Color.fromARGB(255, 205, 205, 205),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Image(
                                    image: AssetImage(
                                        "assets/${_iconList[index]}")),
                                SizedBox(
                                  width: 15.w,
                                ),
                                SizedBox(
                                  width: 200.0,
                                  height: 100.0,
                                  child: Shimmer.fromColors(
                                    baseColor:
                                        Color.fromARGB(255, 203, 203, 203),
                                    highlightColor:
                                        Color.fromARGB(255, 201, 201, 201),
                                    child: Container(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // HAND PICKED FOR YOU
                  Padding(
                    padding:
                        EdgeInsets.only(left: 25.0.w, right: 25.0.w, top: 30.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Hand-Picked for you",
                          style: SET_FONT_STYLE(42.sp, FontWeight.w600,
                              Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                  ),
                  // BOOKS
                  Padding(
                    padding: EdgeInsets.only(left: 25.0.w, top: 30.h),
                    child: Container(
                        width: SCREEN_WIDTH(context),
                        height: SCREEN_WIDTH(context) * 0.51,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 28.w),
                              padding: EdgeInsets.only(
                                  left: 8.h, right: 8.h, top: 8.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.w),
                              ),
                              child: Column(
                                children: [
                                  /// Image
                                  Container(
                                    height: 250.h,
                                    width: 240.w,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(20.w),
                                    ),
                                    child: Shimmer.fromColors(
                                      enabled: true,
                                      direction: ShimmerDirection.ltr,
                                      baseColor: Color(0xffFDF8ED),
                                      highlightColor:
                                          Color.fromARGB(255, 255, 218, 138),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.w),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Container(
                                    width: 240.w,
                                    // height: 20,
                                    // color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RatingBar.builder(
                                          initialRating: double.parse(
                                              (Random().nextInt(3) + 3)
                                                  .toString()),
                                          direction: Axis.horizontal,
                                          allowHalfRating: false,
                                          itemSize: 25,
                                          itemCount: 5,
                                          unratedColor:
                                              Color.fromARGB(255, 79, 79, 79),
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Color.fromARGB(
                                                255, 255, 191, 0),
                                          ),
                                          ignoreGestures: true,
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        )),
                  ),
                  // SOMETHING INTERESTING FOR YOU
                  Padding(
                    padding:
                        EdgeInsets.only(left: 25.0.w, right: 25.0.w, top: 30.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Something-Interesting for you",
                          style: SET_FONT_STYLE(42.sp, FontWeight.w600,
                              Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                  ),
                  // BOOKS
                  Padding(
                    padding: EdgeInsets.only(left: 25.0.w, top: 30.h),
                    child: Container(
                        width: SCREEN_WIDTH(context),
                        height: SCREEN_WIDTH(context) * 0.41,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              width: SCREEN_WIDTH(context) * 0.9,
                              margin: EdgeInsets.only(right: 28.w),
                              padding: EdgeInsets.only(
                                  left: 12.h,
                                  right: 12.h,
                                  top: 12.h,
                                  bottom: 12.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.w),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: RatingBar.builder(
                                          initialRating: double.parse(
                                              (Random().nextInt(3) + 3)
                                                  .toString()),
                                          direction: Axis.horizontal,
                                          allowHalfRating: false,
                                          itemSize: 20,
                                          itemCount: 5,
                                          unratedColor:
                                              Color.fromARGB(255, 79, 79, 79),
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Color.fromARGB(
                                                255, 255, 191, 0),
                                          ),
                                          ignoreGestures: true,
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: SCREEN_WIDTH(context) * 0.4,
                                        child: Text(
                                          "${_quotesList[index]}",
                                          style: SET_FONT_STYLE(
                                              42.sp,
                                              FontWeight.w600,
                                              Color.fromARGB(255, 0, 0, 0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 215.h,
                                    width: 200.w,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(20.w),
                                    ),
                                    child: Shimmer.fromColors(
                                      enabled: true,
                                      direction: ShimmerDirection.ltr,
                                      baseColor: Color(0xffFDF8ED),
                                      highlightColor:
                                          Color.fromARGB(255, 28, 28, 28),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20.w),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
