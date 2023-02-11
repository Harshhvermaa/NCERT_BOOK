import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../Constants/constants.dart';
import 'newSubjectScreen.dart';

class newHomescreen extends StatefulWidget {
  const newHomescreen({super.key});

  @override
  State<newHomescreen> createState() => _newHomescreenState();
}

class _newHomescreenState extends State<newHomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Class 10 Ncert Books"),
          backgroundColor: Color.fromARGB(255, 0, 18, 211),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("AppData")
              .doc("Class 10")
              .collection("Subjects")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("object");
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 15),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => newSubjectScreen(
                              chapterName: "${snapshot.data!.docs[index].id}",
                            ));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: Offset(0, 0),
                                  blurRadius: 15,
                                  spreadRadius: 0.3,
                                  )
                            ],
                            borderRadius: BorderRadius.circular(20.w),
                            color: Colors.white,
                            // border: Border.all(
                            //   color: Color.fromARGB(255, 205, 205, 205),
                            //   width: 1,
                            // ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 18.0, right: 18.0, top: 10, bottom: 10),
                            child: Row(
                              children: [
                                Container(
                                  height: 140.h,
                                  width: 140.w,
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
                                  width: 20.w,
                                ),
                                // SizedBox(
                                //   width: 80.w,
                                //   child: Text(
                                //     overflow: TextOverflow.ellipsis,
                                //     "${index + 1} : ",
                                //     style: SET_FONT_STYLE(
                                //         20, FontWeight.w600, Colors.black),
                                //   ),
                                // ),
                                Expanded(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    "${snapshot.data!.docs[index].id}",
                                    style: SET_FONT_STYLE(
                                        20, FontWeight.w500, Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  );
                },
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                      // margin: EdgeInsets.only(bottom: 28.w),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(0, 0),
                              blurRadius: 15,
                              spreadRadius: 0.3)
                        ],
                        borderRadius: BorderRadius.circular(20.w),
                        color: Colors.white,
                        // border: Border.all(
                        //   color: Color.fromARGB(255, 205, 205, 205),
                        //   width: 1,
                        // ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 18.0, right: 18.0, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 170.h,
                              width: SCREEN_WIDTH(context)*0.9,
                              child: Shimmer.fromColors(
                                enabled: true,
                                direction: ShimmerDirection.ltr,
                                baseColor: Color.fromARGB(255, 255, 255, 255),
                                highlightColor: Color.fromARGB(255, 210, 210, 210),
                                child: Container(
                                  height: 140.h,
                                  width: 140.w,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(20.w),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            // SizedBox(
                            //   width: 80.w,
                            //   child: Text(
                            //     overflow: TextOverflow.ellipsis,
                            //     "${index + 1} : ",
                            //     style: SET_FONT_STYLE(
                            //         20, FontWeight.w600, Colors.black),
                            //   ),
                            // ),
                          ],
                        ),
                      ));
                },
              );
            }
          },
        ));
  }
}
