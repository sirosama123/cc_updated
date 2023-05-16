import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Or extends StatelessWidget {
  String? txt;
  Or({super.key,required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "$txt",
      style: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 20.sp,
        fontWeight: FontWeight.w300,
      ),),
    );
  }
}