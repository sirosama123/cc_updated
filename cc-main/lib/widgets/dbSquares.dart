import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/widgets/DBcounts.dart';
import 'package:project1/widgets/dbmainhead.dart';
import 'package:project1/widgets/square_head.dart';

class DBsquare extends StatelessWidget {
   String? mainhead;
   double counts;
   Color bgColor;
   double height;
   double width;

   DBsquare({super.key,required this.mainhead,required this.counts,required this.bgColor,required this.height,required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(       
        borderRadius: BorderRadius.circular(10.r),           
        color: bgColor,    
      ),
      child:  Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.h,vertical: 5.w),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DBmain(head: "${mainhead}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DBcounts(head: counts),
                  Icon(Icons.arrow_forward,size:30.sp ,color: Colors.white)
                ],
              )
            ],
          ),
      ),
      );
  }
}