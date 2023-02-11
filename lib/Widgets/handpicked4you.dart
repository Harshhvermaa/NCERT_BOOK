import 'dart:convert';
import 'dart:math';

import 'package:Ncert_Helper/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HandPicked4You extends StatefulWidget {
  @override
  State<HandPicked4You> createState() => _HandPicked4YouState();
}

class _HandPicked4YouState extends State<HandPicked4You> {
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

  // int random = Random().nextInt(5);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Hand-Picked only for you",
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
          height: SCREEN_WIDTH(context) * 0.51,
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
                  itemCount: snapshot.data!.docs.length > 6
                      ? 6
                      : snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 28.w),
                      padding: EdgeInsets.only(left: 8.h, right: 8.h, top: 8.h),
                      decoration: BoxDecoration(
                        color: _colorsList[index],
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
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20.w),
                              image: DecorationImage(
                                  image: MemoryImage(
                                base64Decode(
                                    "${snapshot.data!.docs[index].data()["Icon"]}"),
                              )),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RatingBar.builder(
                                  initialRating: double.parse(
                                      (Random().nextInt(3) + 3).toString()),
                                  direction: Axis.horizontal,
                                  allowHalfRating: false,
                                  itemSize: 25,
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
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              } else {
                return 
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 28.w),
                      padding: EdgeInsets.only(left: 8.h, right: 8.h, top: 8.h),
                      decoration: BoxDecoration(
                        color: _colorsList[index],
                        borderRadius: BorderRadius.circular(20.w),
                      ),
                      child: Column(
                        children: [
                          /// Image
                          SizedBox(
                            width: 200.0,
                            height: 100.0,
                            child: Shimmer.fromColors(
                              baseColor: Color(0xffFDF8ED),
                              highlightColor: Color.fromARGB(255, 28, 28, 28),
                              child: SizedBox()
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RatingBar.builder(
                                  initialRating: double.parse(
                                      (Random().nextInt(3) + 3).toString()),
                                  direction: Axis.horizontal,
                                  allowHalfRating: false,
                                  itemSize: 25,
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
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
                ;
              }
            },
          ),
        ),
      ],
    );
  }
}
