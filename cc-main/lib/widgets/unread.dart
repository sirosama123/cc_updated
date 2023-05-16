import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class Read extends StatelessWidget {
  String? head;
  Color? color;
  FontWeight? size;
  double? fontsize;
   Read({super.key,required this.head,required this.color,required this.size,required this.fontsize});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Text("$head",
      style:GoogleFonts.montserrat(
        textStyle: TextStyle(color: color, letterSpacing: .5,fontSize: fontsize!.sp,fontWeight: size),
      ),
      textAlign: TextAlign.start,
    ) );
  }
}