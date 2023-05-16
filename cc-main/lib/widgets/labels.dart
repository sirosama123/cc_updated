import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class Labelss extends StatelessWidget {
  String? lab;
   Labelss({super.key,required this.lab});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$lab",
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(color: Color(0xff636363), letterSpacing: 0.5,fontSize: 16.sp,fontWeight: FontWeight.w300) ),
        textAlign: TextAlign.start,
        ),
    );
  }
}