import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class Multi3S extends StatelessWidget {
  Color color;
  String subtitle;
  FontWeight weight;
  double size;
  Multi3S({super.key,required this.color,required this.subtitle,required this.weight,required this.size});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
  subtitle,
  style: GoogleFonts.balooBhai2(
    textStyle: TextStyle(color: color, letterSpacing: 0,fontSize: size.sp,fontWeight: weight,height: 1.h),
  ),
  textAlign: TextAlign.start,
),

    );
  }
}