import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/widgets/square_head.dart';

class Square2 extends StatelessWidget {
  String? imgAddress;
 
   Square2({super.key,required this.imgAddress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
       decoration: BoxDecoration(   
        
        borderRadius: BorderRadius.circular(10.0),           
             color: Colors.white,
           
            ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("$imgAddress",),
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