import 'dart:convert';
import 'dart:math';

import 'package:Ncert_Helper/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class SomethingInteresting extends StatefulWidget {
  @override
  State<SomethingInteresting> createState() => SomethingInterestingState();
}

class SomethingInterestingState extends State<SomethingInteresting> {
  List<int> _randomIndexList = [
    9,
    8,
    7,
    2,
    1,
    5,
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
  List<String> _quotesList = [
    "A book is a gift you can open again and again.",
    "A good book is an event in my life.",
    "Reading is a discount ticket to everywhere.",
    "I intend to put up with nothing that I can put down",
    "Once you learn to read,you will be forever free",
  ];

  // int random = Random().nextInt(5);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Something-Interesting for you",
              style: SET_FONT_STYLE(
                  42.sp, FontWeight.w600, Color.fromARGB(255, 0, 0, 0)),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          width: SCREEN_WIDTH(context),
          height: SCREEN_WIDTH(context) * 0.41,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("AppData")
                .doc("Class 10")
                .collection("Subjects")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length > 5
                      ? 5
                      : snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: SCREEN_WIDTH(context) * 0.9,
                      margin: EdgeInsets.only(right: 28.w),
                      padding: EdgeInsets.only(
                          left: 12.h, right: 12.h, top: 12.h, bottom: 12.h),
                      decoration: BoxDecoration(
                        color: _colorsList[index],
                        borderRadius: BorderRadius.circular(20.w),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: RatingBar.builder(
                                  initialRating: double.parse(
                                      (Random().nextInt(3) + 3).toString()),
                                  direction: Axis.horizontal,
                                  allowHalfRating: false,
                                  itemSize: 20,
                                  itemCount: 5,
                                  unratedColor: Color.fromARGB(255, 79, 79, 79),
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
                              ),
                              SizedBox(
                                width: SCREEN_WIDTH(context) * 0.4,
                                child: Text(
                                  "${_quotesList[index]}",
                                  style: SET_FONT_STYLE(42.sp, FontWeight.w600,
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
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20.w),
                              image: DecorationImage(
                                  image: MemoryImage(
                                base64Decode(
                                    "${snapshot.data!.docs[_randomIndexList[index]].data()["Icon"]}"),
                              )),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      width: SCREEN_WIDTH(context) * 0.9,
                      margin: EdgeInsets.only(right: 28.w),
                      padding: EdgeInsets.only(
                          left: 12.h, right: 12.h, top: 12.h, bottom: 12.h),
                      decoration: BoxDecoration(
                        color: _colorsList[index],
                        borderRadius: BorderRadius.circular(20.w),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: RatingBar.builder(
                                  initialRating: double.parse(
                                      (Random().nextInt(3) + 3).toString()),
                                  direction: Axis.horizontal,
                                  allowHalfRating: false,
                                  itemSize: 20,
                                  itemCount: 5,
                                  unratedColor: Color.fromARGB(255, 79, 79, 79),
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
                              ),
                              SizedBox(
                                width: SCREEN_WIDTH(context) * 0.4,
                                child: Text(
                                  "${_quotesList[index]}",
                                  style: SET_FONT_STYLE(42.sp, FontWeight.w600,
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
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20.w),
                            ),
                            child: Shimmer.fromColors(
                              enabled: true,
                              direction: ShimmerDirection.ltr,
                              baseColor: Color(0xffFDF8ED),
                              highlightColor: Color.fromARGB(255, 28, 28, 28),
                              child: Container(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              
              }
            },
          ),
        ),
      ],
    );
  }
}
