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
import '../../widgets/hosdept.dart';
import '../../widgets/hospitalName.dart';
import '../widgets/memberPageBars.dart';
import 'dependents.dart';
import 'doctorDetail.dart';



class DoctorList extends StatelessWidget {
  List<dynamic> doctors;
  String? hsptlName;
  DoctorList({super.key,required this.doctors,required this.hsptlName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
            backgroundColor: Color(0xff2b578e),
            title: Text("Doctors List"),
             leading: GestureDetector(
            child: Icon( Icons.arrow_back_ios, color: Colors.white,  ),
               onTap: () {
                 Navigator.pop(context);
                } ,
        ) ,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search,color: Colors.white,),
            
            onPressed: () {},
          ), ]
          ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => DoctorDetail(
                  day1: doctors[index]['Day1'], 
                  day2: doctors[index]['Day2'], 
                  department: doctors[index]['department'], 
                  name: doctors[index]['ConsultantNames'], 
                  speciality: doctors[index]['Speciality'], 
                  time1: doctors[index]['Timing1'], 
                  time2: doctors[index]['Timing2'], 
                  wing: doctors[index]['Wing'].toString(), day3: doctors[index]['Day3'] , time3:doctors[index]['Timing3'], hsptlName: hsptlName, 
                  )));                
              },
              child: DoctorListView(
                designation: doctors[index]['Speciality'], 
                hospital: doctors[index]['department'], 
                name: doctors[index]['ConsultantNames'],
                ),
            ),
          );
        }),
    );
  }
}