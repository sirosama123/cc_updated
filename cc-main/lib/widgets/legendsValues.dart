import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LightHeading3 extends StatelessWidget {
  String? head;
   LightHeading3({super.key,required this.head});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$head",
      style:GoogleFonts.montserrat(
        textStyle: TextStyle(color: Color(0xff636363), letterSpacing: .5,fontSize: 14.sp),
      ),
      textAlign: TextAlign.center,
    ) );
  }
}