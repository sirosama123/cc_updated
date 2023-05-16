import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NH extends StatelessWidget {
  String? head;
  Color? color;
   NH({super.key,required this.head,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$head",
      style:GoogleFonts.montserrat(
        textStyle: TextStyle(color: color, letterSpacing: .5,fontSize: 12.sp,fontWeight: FontWeight.w700),
      ),
      textAlign: TextAlign.start,
    ) );
  }
}