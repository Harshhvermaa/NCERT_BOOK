import 'package:Ncert_Helper/SCREENS/viewPDF.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../Constants/constants.dart';

class newSubjectScreen extends StatefulWidget {
  String chapterName;
  newSubjectScreen({required this.chapterName });

  @override
  State<newSubjectScreen> createState() => _newSubjectScreenState();
}

class _newSubjectScreenState extends State<newSubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("${"Chapters of " + widget.chapterName}"),
          backgroundColor: Color.fromARGB(255, 0, 18, 211),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("AppData")
              .doc("Class 10")
              .collection("Subjects")
              .doc("${widget.chapterName}")
              .collection("Chapters of ${widget.chapterName}")
              .snapshots(),
          builder: (context, snapshot) {
            // print(widget.chapterName);
            if (snapshot.hasData) {
              // print("object");
              // print(snapshot.data!.docs.length);
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
                        Get.to( () => PDFview(pdfLink: "${snapshot.data!.docs[index].data()["PDF Link"]}",
                        index: "Chapter : ${index+1} " "Of " "${widget.chapterName}", nightMode: false , ) );
                      },
                      child: Container(
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
                                left: 18.0, right: 18.0, top: 30, bottom: 30),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 60.w,
                                  child: Image(image: AssetImage("assets/bullet.png"),)
                                ),
                                SizedBox(
                                  width: 60.w,
                                ),
                                Expanded(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    "Chapter :  ${index+1}",
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
