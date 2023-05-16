import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WHeading3 extends StatelessWidget {
  String? head;
   WHeading3({super.key,required this.head});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$head",
      style:GoogleFonts.montserrat(
        textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 11.sp,fontWeight: FontWeight.w700),
      ),
      textAlign: TextAlign.center,
    ) );
  }
}