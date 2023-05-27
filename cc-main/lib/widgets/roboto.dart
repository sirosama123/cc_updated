import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class Roboto extends StatelessWidget {
  Color color;
  String subtitle;
  FontWeight weight;
  double size;
  TextAlign align;
  Roboto({super.key,required this.color,required this.subtitle,required this.weight,required this.size,required this.align});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
  subtitle,
  style: GoogleFonts.roboto(
    textStyle: TextStyle(color: color, letterSpacing: 0,fontSize: size.sp,fontWeight: weight),
  ),
  textAlign: TextAlign.center,
),

    );
  }
}