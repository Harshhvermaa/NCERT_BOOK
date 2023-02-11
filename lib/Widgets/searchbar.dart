import 'package:Ncert_Helper/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SCREEN_HEIGHT(context)*0.06,
      width: SCREEN_WIDTH(context),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(5, 6),
            blurRadius: 5,
            spreadRadius: 0.3
          )
        ],
        borderRadius: BorderRadius.circular(20.w)
      ),
      child: Row(
        children: [
          SizedBox(width: 30.w,),
          Image(image: AssetImage("assets/search.png"),height: 40.h,width: 40.w,),
          SizedBox(width: 30.w,),
          Expanded(child: 
          TextFormField(
            cursorColor: Colors.black,
            cursorHeight: 50.sp,
            cursorRadius: Radius.circular(80.w),
            showCursor: true,
            style: SET_FONT_STYLE(40.sp, FontWeight.w400, Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none
              
              ),
          )
          ),
          
        ],
      ),
    );
  
  }
}