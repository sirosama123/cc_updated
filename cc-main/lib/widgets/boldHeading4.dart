import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BHeading4 extends StatelessWidget {
  String? head;
   BHeading4({super.key,required this.head});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$head",
      style:GoogleFonts.montserrat(
        textStyle: TextStyle(color: Color(0xff164584), letterSpacing: .5,fontSize: 12.sp,fontWeight: FontWeight.w700),
      ),
      textAlign: TextAlign.center,
    ) );
  }
}