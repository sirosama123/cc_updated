// notification time


import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class NT extends StatelessWidget {
  String? head;
  Color? color;
   NT({super.key,required this.head,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$head",
      style:GoogleFonts.montserrat(
        textStyle: TextStyle(color: color, letterSpacing: .5,fontSize: 12.sp,fontWeight: FontWeight.w500),
      ),
      textAlign: TextAlign.start,
    ) );
  }
}