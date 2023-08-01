import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:project1/screens/dashboard.dart';
import 'package:project1/screens/notification.dart';
import 'package:project1/screens/subscreens/appointment.dart';
import 'package:project1/screens/subscreens/labPrescription.dart';
import 'package:project1/screens/subscreens/prescription.dart';
import 'package:project1/widgets/slider.dart';
import 'package:project1/widgets/squares.dart';
import 'package:hellodoc_service_pkg/main.dart';
import 'package:hellodoc_service_pkg/screens/HomeScreen.dart';
import 'package:provider/provider.dart';

import '../../widgets/roboto.dart';
import '../../widgets/square_head.dart';

class NoLabDisclaimer extends StatelessWidget {
   NoLabDisclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.contain
              )
          ),
          child: Container() ,
          
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white.withOpacity(0.9),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding:EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/info.png",height: 80.h,width: 80.w,),
                          Container()
                        ],
                      ),
                      SizedBox(height: 15.h,),
                      Roboto(
                        color: Color(0xff2b578e), 
                        subtitle: "This Service is Currently Not Offered to You", 
                        weight: FontWeight.w700, 
                        size: 18, 
                        align: TextAlign.start
                        ),
                      
                    SizedBox(height: 30.h,),
                    
                     Container(
                                        height: 50,
                                        width: double.infinity,
                                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child:  ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            // backgroundColor: Color(0xff164584),
                                            backgroundColor: Color(0xff174584),
                                              shape: RoundedRectangleBorder(                       
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                            ),
                                          child:  TitleHeading(head: 'Go Back',),
                                          onPressed: () {
                                           Navigator.of(context).pop();
                                          },
                                        )
                                    ),
                    ]
                  ),
                ),
              ),
            )
          ),
          
        )
      ],
    ),
    );
  }
}