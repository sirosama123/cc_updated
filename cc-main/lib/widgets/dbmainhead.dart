import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class DBmain extends StatelessWidget {
  String? head;
   DBmain({super.key,required this.head});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$head",
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(color:Colors.white , letterSpacing: .5,fontSize: 13.sp,fontWeight: FontWeight.w700) ),
        textAlign: TextAlign.start,
        ),
    );
  }
}