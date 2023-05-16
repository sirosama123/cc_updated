import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WLinks extends StatelessWidget {
  String? head;
  Color color;
   WLinks({super.key,required this.head, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$head",
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: color
      ),textAlign: TextAlign.center,),
    );
  }
}