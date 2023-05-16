import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/widgets/square_head.dart';

class Squares extends StatelessWidget {
  String? imgAddress;
  String?  heading;
   Squares({super.key,required this.imgAddress,required this.heading});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145.h,
      width: 145.w,
       decoration: BoxDecoration(   
        borderRadius: BorderRadius.circular(10.0),           
             color: Color(0xffafc4dd),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 7.w),
              child: TitleHeading(head: "$heading"),
            ),
            Container(
              height: 70.h,
              width: 70.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("$imgAddress"),
                  fit: BoxFit.fill,
                ),
               
              ),
            )
          ],
        ),
      ) ,
    );
  }
}