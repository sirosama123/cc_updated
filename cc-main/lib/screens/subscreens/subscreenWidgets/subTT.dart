import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class SubTT extends StatelessWidget {
  String? head;
  Color? color;
   SubTT({super.key,required this.head,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$head",
      style:GoogleFonts.montserrat(
        textStyle: TextStyle(color: color, letterSpacing: .5,fontSize: 13.sp,fontWeight: FontWeight.w800),
      ),
      textAlign: TextAlign.start,
    ) );
  }
}