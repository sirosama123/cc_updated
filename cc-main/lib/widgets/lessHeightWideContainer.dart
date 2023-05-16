import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/widgets/square_head.dart';

class LessWideSquares extends StatelessWidget {
  String?  heading;
   LessWideSquares({super.key,required this.heading});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: double.infinity,
       decoration: BoxDecoration(   
        borderRadius: BorderRadius.circular(10.0),           
              color: Color(0xff1FAAFF),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffA4A4A4),
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                  offset: Offset(0.0, 0.0),
                  // Shadow position
                ),
              ],
            ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

           
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 7.w),
              child:Text("${heading}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500
              ),
              ),
            ),
            
          ],
        ),
      ) ,
    );
  }
}