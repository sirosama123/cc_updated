import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/widgets/DBcounts.dart';
import 'package:project1/widgets/dbmainhead.dart';
import 'package:project1/widgets/heading2.dart';
import 'package:project1/widgets/heading3White.dart';
import 'package:project1/widgets/multi3.dart';
import 'package:project1/widgets/square_head.dart';

import 'hospitalName.dart';

class HosDept extends StatelessWidget {
  String? img;
  String? name;

  HosDept({super.key,required this.img,required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff2b578e),
         boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 1),
                    color: Color(0xff2b578e),
                    spreadRadius: 2,
                    blurRadius: 4
                  )
                ],
        borderRadius: BorderRadius.circular(10.r),
        // image: DecorationImage(image: NetworkImage("$img"),fit: BoxFit.cover)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
        child: Center(
                                    child: Multi3(color: Colors.white, subtitle: "$name", weight: FontWeight.bold, size: 16),
                                  ),
        // ClipRRect(
        //                       borderRadius: BorderRadius.circular(25.0),
        //                       child: BackdropFilter(
        //                         filter:
        //                             ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        //                              child: Container(
        //                             height: 100.h,
        //                             width:double.infinity,
        //                           decoration: BoxDecoration(
        //                             borderRadius: BorderRadius.circular(25.0),
        //                             // color: Colors.transparent.withOpacity(0.2),
        //                           ),
        //                           child: Center(
        //                             child: Multi3(color: Colors.white, subtitle: "$name", weight: FontWeight.bold, size: 21),
        //                           ),
        //                           )
        //                             )
        //                             ),
      ),
      );
    
  }
}