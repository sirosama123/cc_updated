import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/firstLanding.dart';
import 'package:project1/screens/send.dart';
import 'package:project1/widgets/NHD.dart';
import 'package:project1/widgets/NHT.dart';
import 'package:project1/widgets/NotificatioHead.dart';
import 'package:provider/provider.dart';


class NotificationContainer extends StatelessWidget {
  String heading;
  String time1;
  String time2;
  String type;
  String Odate;
  NotificationContainer({
    super.key, 
    required this.heading,
    required this.time1,
    required this.type,
    required this.time2,
    required this.Odate
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 3.h),
      child: Container(
        height: 100.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: type=='medicine'?Colors.pink:type=='lab'?Colors.amber:type=='appointment'?Colors.blue:Colors.green,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffA4A4A4),
                    blurRadius: 6.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 0.0),
                    // Shadow position
                  ),
                ],
              
        ),

        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              NH(head: heading, color: Colors.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   NT(head: time1, color: Colors.white),
                   Column(
                     children: [
                       NT(head: time2, color: Colors.white),
                       NT(head: Odate, color: Colors.white)
                     ],
                   ),
                   
                ],
              ),
              NHD(head: "you applied for online ${type} we will response back to you soon...", color: Colors.white),            
            ],
          ),
        ),
      ),
    );
  }
}