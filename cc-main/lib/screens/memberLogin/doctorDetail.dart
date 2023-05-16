import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/memberLogin/profile.dart';
import 'package:project1/screens/profile.dart';
import 'package:project1/screens/subscreens/labOrderDetails.dart';
import 'package:project1/screens/subscreens/medicineOrdersDetail.dart';
import 'package:project1/widgets/dbSquares.dart';
import 'package:project1/widgets/heading3B.dart';
import 'package:project1/widgets/chead2.dart';
import 'package:project1/widgets/smallDBsquare.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../widgets/doctorListView.dart';
import '../../widgets/heading2.dart';
import '../../widgets/heading3.dart';
import '../../widgets/hosdept.dart';
import '../../widgets/hospitalName.dart';
import '../../widgets/multi3.dart';
import '../../widgets/square_head.dart';
import '../widgets/memberPageBars.dart';
import 'dependents.dart';
import 'hsptldependents.dart';


class DoctorDetail extends StatelessWidget {
  String?name;
  String?speciality;
  String?department;
  String?day1;
  String?time1;
  String?day2;
  String?time2;
  String?wing;
  String?day3;
  String?time3;
  String? hsptlName;
  DoctorDetail({
    super.key,
    required this.day1,
    required this.day2,
    required this.department,
    required this.name,
    required this.speciality,
    required this.time1,
    required this.time2,
    required this.wing,
    required this.day3,
    required this.time3,
    required this.hsptlName
    });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(  
        
        body: Container(
        height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5],
          colors: [
            Color(0xff164584),
            Color.fromARGB(255, 64, 119, 187)
          ],
        ),
      ),
          child: Stack(  
            
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                   Padding(
                padding:  EdgeInsets.only(bottom:50.h),
                child: Container(
                  height: 250.h,
                  width: double.infinity,
                  decoration: BoxDecoration(  
                     
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(180),bottomRight: Radius.circular(180))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.h,),
                      Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: new BoxDecoration(
                        image: new DecorationImage(
                        image: new AssetImage("assets/images/logo.png",),
                      
                        
                )
                ),
                          ),
                          Heading3(head: "Crescent Care Pvt Ltd"),
                          SizedBox(height: 30.h,),
                          Container(  
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                         boxShadow: [
            BoxShadow(
                    offset: Offset(-1, -1),
                    color: Colors.black,
                    spreadRadius: 1,
                    blurRadius: 9)
          ],
                        borderRadius: BorderRadius.circular(25.r),
                        image: DecorationImage(
                          image: AssetImage("assets/images/doctor2.jpg"),
                          fit: BoxFit.cover
                          )
                      ),
                    ),
                    ],
                  ),             
                  ),
              ),
                  Container(
                    height: 330.h,
                    width: 300.w,
                   decoration: BoxDecoration(
                       boxShadow: [
            BoxShadow(
                    offset: Offset(-1, -1),
                    color: Colors.black,
                    spreadRadius: 1,
                    blurRadius: 9)
          ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r)
                   ),
                margin:  EdgeInsets.symmetric(horizontal: 20.w),
                child:  Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Multi3(color: Color(0xff164584), subtitle: "Name", weight: FontWeight.bold, size: 12),
                          Multi3(color: Color(0xff164584), subtitle: "$name", weight: FontWeight.bold, size: 12),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Multi3(color: Color(0xff164584), subtitle: "Speciality", weight: FontWeight.bold, size: 12),
                          Multi3(color: Color(0xff164584), subtitle: "$speciality", weight: FontWeight.bold, size: 12),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Multi3(color: Color(0xff164584), subtitle: "Department", weight: FontWeight.bold, size: 12),
                          Multi3(color: Color(0xff164584), subtitle: "$department", weight: FontWeight.bold, size: 12),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Multi3(color: Color(0xff164584), subtitle: "Day 1", weight: FontWeight.bold, size: 12),
                          Multi3(color: Color(0xff164584), subtitle: "$day1", weight: FontWeight.bold, size: 12),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Multi3(color: Color(0xff164584), subtitle: "Timing 1", weight: FontWeight.bold, size: 12),
                          Multi3(color: Color(0xff164584), subtitle: "$time1", weight: FontWeight.bold, size: 12),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Multi3(color: Color(0xff164584), subtitle: "Day 2", weight: FontWeight.bold, size: 12),
                          Multi3(color: Color(0xff164584), subtitle: "$day2", weight: FontWeight.bold, size: 12),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Multi3(color: Color(0xff164584), subtitle: "Timing 2", weight: FontWeight.bold, size: 12),
                          Multi3(color: Color(0xff164584), subtitle: "$time2", weight: FontWeight.bold, size: 12),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Multi3(color: Color(0xff164584), subtitle: "Day 3", weight: FontWeight.bold, size: 12),
                          Multi3(color: Color(0xff164584), subtitle: "$day3", weight: FontWeight.bold, size: 12),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Multi3(color: Color(0xff164584), subtitle: "Timing 3", weight: FontWeight.bold, size: 12),
                          Multi3(color: Color(0xff164584), subtitle: "$time3", weight: FontWeight.bold, size: 12),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Multi3(color: Color(0xff164584), subtitle: "Wing", weight: FontWeight.bold, size: 12),
                          Multi3(color: Color(0xff164584), subtitle: "$wing", weight: FontWeight.bold, size: 12),
                        ],
                      ),
                      SizedBox(height: 10.h,),
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
                                  child:  TitleHeading(head: 'Book An Appointment',),
                                  onPressed: () {
                                    Navigator.push(context,
                                      MaterialPageRoute(builder:
                                        (context) => 
                                        HsptlDependentsData(hsptlName: hsptlName,)
                                        )
                                      );
                                  },
                                )
                            ),
                    ],
                  ),
                ),
              ),
             
                ],
              ),
            )
          ],
      ),
        ),
      )
    );
  }
}