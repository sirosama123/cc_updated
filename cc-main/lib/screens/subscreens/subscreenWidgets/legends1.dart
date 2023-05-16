import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/widgets/square_head.dart';

class Legends1 extends StatelessWidget {
  
  Color? col;
   Legends1({super.key,required this.col});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: col,
        ),
        SizedBox(width: 5.w,),
        // Text(
        //   "${head}",
        //   style: TextStyle(
        //     fontWeight: FontWeight.w300,
        //     color: Color(0xff164584),
        //     fontSize: 16.sp
        //   ),
        //   )
      ],
    );
  }
}