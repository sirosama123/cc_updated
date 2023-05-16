import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleHeading extends StatelessWidget {
  String? head;
   TitleHeading({super.key,required this.head});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$head",
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white
      ),textAlign: TextAlign.center,),
    );
  }
}