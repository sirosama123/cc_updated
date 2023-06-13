import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class smallDBmain extends StatelessWidget {
  String? head;
   smallDBmain({super.key,required this.head});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$head",
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(color:Colors.white , letterSpacing: .5,fontSize: 7.sp,fontWeight: FontWeight.w500) ),
        textAlign: TextAlign.start,
        ),
    );
  }
}

class smallDBmain2 extends StatelessWidget {
  String? head;
  Color? tcolor;
   smallDBmain2({super.key,required this.head,required this.tcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$head",
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(color:tcolor , letterSpacing: .5,fontSize: 10.sp,fontWeight: FontWeight.w700) ),
        textAlign: TextAlign.start,
        ),
    );
  }
}