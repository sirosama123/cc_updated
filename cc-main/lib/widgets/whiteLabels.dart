import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class WhiteLabelss extends StatelessWidget {
  String? lab;
   WhiteLabelss({super.key,required this.lab});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$lab",
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(color: Colors.white, letterSpacing: 0.5,fontSize: 16.sp,fontWeight: FontWeight.w300) ),
        textAlign: TextAlign.start,
        ),
    );
  }
}