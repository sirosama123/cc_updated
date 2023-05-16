import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CHeading2 extends StatelessWidget {
  String? head;
  Color? color;
   CHeading2({super.key,required this.head,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$head",
      style:GoogleFonts.montserrat(
        textStyle: TextStyle(color: color, letterSpacing: .5,fontSize: 16.sp,fontWeight: FontWeight.w700),
        
      ),
      textAlign: TextAlign.start,
    ) );
  }
}