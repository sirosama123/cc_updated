import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/widgets/DBcounts.dart';
import 'package:project1/widgets/dbmainhead.dart';
import 'package:project1/widgets/heading2.dart';
import 'package:project1/widgets/heading3White.dart';
import 'package:project1/widgets/multi3.dart';
import 'package:project1/widgets/square_head.dart';


class hsptlName extends StatelessWidget {
  String? name;
  String? img;
hsptlName({super.key,required this.img,required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
          boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 1),
                    color: Color.fromARGB(255, 54, 124, 211),
                    spreadRadius: 3,
                    blurRadius: 6
                  )
                ],
      ),
      child: Padding(
        padding:EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(img.toString()),
                  fit: BoxFit.fitWidth
                  )
              ),
            ),
            Multi3(color: Color(0xff2b578e), subtitle: "${name}", weight: FontWeight.bold, size: 16)
          ],
        ),
      ),
    );
  }
}