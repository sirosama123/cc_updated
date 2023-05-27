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
import 'package:project1/widgets/multi3.dart';
import 'package:project1/widgets/multiText.dart';
import 'package:project1/widgets/smallDBsquare.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../widgets/hosdept.dart';
import '../../widgets/hospitalName.dart';
import '../widgets/memberPageBars.dart';
import 'multi3S.dart';

class DoctorListView extends StatelessWidget {
  String? name;
  String? designation;
  String? hospital;
  String? hsptlname;
  DoctorListView({
    super.key,
    required this.name,
    required this.designation,
    required this.hospital,
   required this.hsptlname
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Color(0xff2b578e),
        boxShadow: [
          BoxShadow(
              offset: Offset(1, 1),
              color: Color.fromARGB(255, 54, 124, 211),
              spreadRadius: 3,
              blurRadius: 6)
        ],
      ),
      child: Padding(
        padding:EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(  
                      height: 80.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                         boxShadow: [
            BoxShadow(
                    offset: Offset(-1, -1),
                    color: Colors.black,
                    spreadRadius: 1,
                    blurRadius: 9)
          ],
                        borderRadius: BorderRadius.circular(10.r),
                        image: DecorationImage(
                          image: AssetImage("assets/images/doctor2.jpg"),
                          fit: BoxFit.cover
                          )
                      ),
                    ),
                    SizedBox(width: 10.w,),
                     Container(
                  height: 100.h,
                  width: 1.5.w,
                  color: Colors.white,
                )
                  ],
                ),
              )
              ),
              
              Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Multi3S(
                        color: Colors.white, 
                        subtitle: "$name", 
                        weight: FontWeight.bold, 
                        size: 18
                        ),
                       name!.length>23? SizedBox(height: 1.h,):SizedBox(height: 3.h,),
                       Multi3(
                        color: Colors.white, 
                        subtitle: "$designation", 
                        weight: FontWeight.bold, 
                        size: 12
                        ),
                        name!.length>23? SizedBox(height: 1.h,):SizedBox(height: 5.h,),
                        Container(
                          // width: 100.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white,
                                 boxShadow: [
                          BoxShadow(
                  offset: Offset(-1, -1),
                  color: Colors.black,
                  spreadRadius: 1,
                  blurRadius: 12)
                        ],
                          ),
                          child: Center(child: Multi3(color: Color(0xff2b578e), subtitle: "$hospital, $hsptlname", weight: FontWeight.bold, size: 10)),
                        )
                    ],
                  ),
                )
                ),
                
      
          ],
        ),
      ),
    );
  }
}
