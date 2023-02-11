import 'dart:math';

import 'package:Ncert_Helper/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BookList extends StatefulWidget {
  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  List<String> _iconList = [
    "1.png",
    "2.png",
    "3.png",
    "4.png",
    "5.png",
    "6.png",
    "7.png",
  ];

  // int random = Random().nextInt(5);

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      width: SCREEN_WIDTH(context),
      height: SCREEN_WIDTH(context) * 0.1,
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
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 28.w),
                  padding: EdgeInsets.only(
                      left: 20.0.w, right: 20.0.w, top: 8.h, bottom: 8.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.w),
                      border: Border.all(
                        color: Color.fromARGB(255, 205, 205, 205),
                        width: 1,
                      ),
                      ),
                  child: Row(
                    children: [
                      Image(image: AssetImage( index > _iconList.length-1 ? "assets/${_iconList[Random().nextInt(5)]}" : "assets/${_iconList[index]}")),
                      SizedBox(width: 15.w,),
                      Center(
                          child: Text(
                        "${snapshot.data!.docs[index].id}",
                        style: SET_FONT_STYLE(
                            30.sp, FontWeight.w400, Color(0xff433728)),
                      )),
                    ],
                  ),
                );
              },
            );
          
          } else {
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 28.w),
                  padding: EdgeInsets.only(
                      left: 20.0.w, right: 20.0.w, top: 8.h, bottom: 8.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.w),
                      border: Border.all(
                        color: Color.fromARGB(255, 205, 205, 205),
                        width: 1,
                      ),
                      ),
                  child: Row(
                    children: [
                      Image(image: AssetImage( "assets/${_iconList[index]}" )),
                      SizedBox(width: 15.w,),
                      SizedBox(
                    width: 200.0,
                    height: 100.0,
                    child: Shimmer.fromColors(
                      baseColor: Color.fromARGB(255, 203, 203, 203),
                      highlightColor: Color.fromARGB(255, 201, 201, 201),
                      child: Container(
                          color: Colors.white,
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
    );
  
  }
}
