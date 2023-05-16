import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/widgets/DBcounts.dart';
import 'package:project1/widgets/dbmainhead.dart';
import 'package:project1/widgets/heading2.dart';
import 'package:project1/widgets/heading3White.dart';
import 'package:project1/widgets/multi3.dart';
import 'package:project1/widgets/square_head.dart';


class NameHospital extends StatelessWidget {
  String? name;
  NameHospital({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            height: 60.h,
            decoration: BoxDecoration(
               boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 1),
                    color: Color.fromARGB(255, 54, 124, 211),
                    spreadRadius: 3,
                    blurRadius: 6
                  )
                ],
              color: Color(0xff2b578e),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                bottomLeft: Radius.circular(30.r),
                topRight: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              )
            ),
            child: Padding(
              padding:EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
              child: Center(
                child: Column(
                  children: [
                    WHeading3(head: "Quaid e Azam International Hospital"),
                    Multi3(color: Colors.white, subtitle: "Main Peshawar Road, Near Gola Morr, H-13 - Islamabad, Rawalpindi", weight: FontWeight.bold, size: 12)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            
            left: -10,top: 10,bottom: 10,
            child: Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/plus2.png")),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-1, 0.5),
                    color: Color.fromARGB(255, 54, 124, 211),
                    spreadRadius: 3,
                    blurRadius: 6
                  )
                ],
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}