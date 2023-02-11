// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:Ncert_Helper/Constants/constants.dart';
import 'package:Ncert_Helper/Function/firebaseFunction.dart';
import 'package:Ncert_Helper/Widgets/bookList.dart';
import 'package:Ncert_Helper/Widgets/searchbar.dart';
import 'package:Ncert_Helper/Widgets/somethingInteresting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Widgets/handpicked4you.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: SCREEN_HEIGHT(context),
        width: SCREEN_WIDTH(context),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/bg.png"),
        )),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.0.w, right: 25.0.w, top: 90.h),
              child: const SearchBar(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0.w, top: 30.h),
              child: BookList(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0.w, top: 30.h),
              child: HandPicked4You(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0.w, top: 30.h),
              child: SomethingInteresting(),
            ),
            
          ],
        ),
      ),
    );
  }
}
