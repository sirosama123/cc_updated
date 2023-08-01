import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class BlueLabelss extends StatelessWidget {
  String? lab;
   BlueLabelss({super.key,required this.lab});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$lab",
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(color: Color(0xff164584), letterSpacing: 0.5,fontSize: 14.sp,fontWeight: FontWeight.w300) ),
        textAlign: TextAlign.start,
        ),
    );
  }
}