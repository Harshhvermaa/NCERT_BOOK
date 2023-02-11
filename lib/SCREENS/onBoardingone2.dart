import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../Constants/constants.dart';
import '../Global/global.dart';
import 'newHomescreen.dart';

class onBoardingtwo extends StatelessWidget {
  onBoardingtwo({super.key});
  TextEditingController _username = TextEditingController();

  checkField() async {
    if (_username.text.length < 1) {
      Get.defaultDialog(
        title: "",
        content: Column(
          children: [
            Image(
              image: AssetImage("assets/browser.png"),
              height: 100,
              width: 100,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Oops, Unfortunately you\ndidn't provide your name",
              style: SET_FONT_STYLE(
                20,
                FontWeight.w500,
                Color.fromARGB(255, 23, 23, 23),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      );
    } else {
      if (GetUtils.isEmail(_username.text)) {
        EasyLoading.show(dismissOnTap: true);
        await sharedPreferences!
            .setString("Username", _username.text.toString());
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(_username.text.toString())
            .set(
          {
            "Email": _username.text.toString(),
            "Creation-date":
                "${DateFormat.MEd().format(DateTime.now()).toString()}",
            "Creation-time":
                "${DateFormat.Hms().format(DateTime.now()).toString()}"
          },
        );
        EasyLoading.dismiss();
        Get.off(() => newHomescreen());
      } else {
        Get.defaultDialog(
          title: "Oops, Unfortunately your\nmail is faulty",
          content: Column(
            children: [
              Image(
                image: AssetImage("assets/browser.png"),
                height: 100,
                width: 100,
              ),
              SizedBox(
                height: 15,
              ),
              Text("")
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print(sharedPreferences!.getString("Username"));
    var screenHeight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.07,
            ),
            // image
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsetsDirectional.all(29),
                  height: screenHeight * 0.35,
                  width: screenwidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 66, 66, 66),
                    //   image: DecorationImage(image: AssetImage("assets/fs3.png"),
                    // fit: BoxFit.cover,
                  ),
                  child: Image(
                    image: const AssetImage("assets/fs3.png"),
                    height: screenHeight * 0.3,
                    width: screenwidth * 0.4,
                  ),
                )
              ],
            ),

            // text
            Container(
              margin: EdgeInsets.only(
                  left: screenwidth * 0.05,
                  right: screenwidth * 0.05,
                  top: screenHeight * 0.08),
              child: Text(
                "Today a reader,\ntomorrow a leader.",
                style: SET_FONT_STYLE(
                  20,
                  FontWeight.w500,
                  Color.fromARGB(255, 23, 23, 23),
                ),
              ),
            ),

            SizedBox(
              height: screenHeight * 0.175,
            ),

            // What shall i call you
            Container(
              margin: EdgeInsets.only(
                left: screenwidth * 0.04,
                right: screenwidth * 0.04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // margin: EdgeInsets.only(
                    //     left: screenwidth * 0.04,right: screenwidth * 0.04, top: screenHeight * 0.7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Please compose your e-mail",
                          style: SET_FONT_STYLE(
                            20,
                            FontWeight.w500,
                            Color.fromARGB(255, 23, 23, 23),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.005,
                        ),
                        Container(
                          height: screenHeight * 0.065,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 32, 32, 34)),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: TextField(
                              // onSubmitted: (value) {
                              //   checkField();
                              // },
                              style: SET_FONT_STYLE(
                                20,
                                FontWeight.w500,
                                Color.fromARGB(255, 23, 23, 23),
                              ),
                              textAlign: TextAlign.left,
                              controller: _username,
                              cursorColor: Color.fromARGB(255, 49, 49, 49),
                              cursorWidth: 1,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  hintStyle: SET_FONT_STYLE(
                                    20,
                                    FontWeight.w500,
                                    Color.fromARGB(255, 96, 96, 96),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 15)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Container(
                          width: screenwidth * 0.95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          height: screenHeight * 0.065,
                          child: ElevatedButton(
                              onPressed: () async {
                                final connectivityResult =
                                    await (Connectivity().checkConnectivity());
                                if (connectivityResult ==
                                    ConnectivityResult.none) {
                                  Get.defaultDialog(
                                    title: "",
                                    content: Column(
                                      children: [
                                        Image(
                                          image:
                                              AssetImage("assets/browser.png"),
                                          height: 100,
                                          width: 100,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Oops, you are not connected with Internet please connect anf try again...",
                                          style: SET_FONT_STYLE(
                                            20,
                                            FontWeight.w500,
                                            Color.fromARGB(255, 23, 23, 23),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  );
                                }else{
                                checkField();

                                }
                              },
                              child: Text(
                                "Submit",
                                style: SET_FONT_STYLE(
                                  40.sp,
                                  FontWeight.w500,
                                  Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(12.0),
                                backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 0, 18, 211),
                                ),
                                side: MaterialStateProperty.all(
                                  BorderSide(
                                      color: Color.fromARGB(255, 37, 37, 37),
                                      width: 0.5),
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
