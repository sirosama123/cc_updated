import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class Heading1 extends StatelessWidget {
  String? head;
   Heading1({super.key,required this.head});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$head",
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(color: Color(0xff164584), letterSpacing: 1,fontSize: 28.sp,fontWeight: FontWeight.w700) ),
        textAlign: TextAlign.center,
        ),
    );
  }
}