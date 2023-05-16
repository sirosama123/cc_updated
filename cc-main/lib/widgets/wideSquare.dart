import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/widgets/square_head.dart';

class WideSquares extends StatelessWidget {
  String? imgAddress;
  String?  heading;
   WideSquares({super.key,required this.imgAddress,required this.heading});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: double.infinity,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Container(
              height: 70.h,
              width: 70.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("$imgAddress"),
                  fit: BoxFit.fill,
                ),
                // shape: BoxShape.circle,
              ),
            ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 7.w),
              child: TitleHeading(head: "$heading"),
            ),
            
          ],
        ),
      ) ,
    );
  }
}