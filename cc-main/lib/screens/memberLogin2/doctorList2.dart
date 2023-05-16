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
import 'doctorDetail2.dart';




class DoctorList2 extends StatelessWidget {
  var doctors;
  String? hsptlName;
  String? deptName;
  DoctorList2({super.key,required this.doctors,required this.hsptlName,required this.deptName});

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
                print(doctors);
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => DoctorDetail2(
                  day1: doctors[index]['day1'], 
                  day2: doctors[index]['day2'], 
                  name: doctors[index]['name'], 
                  speciality: doctors[index]['speciality'], 
                  time1: doctors[index]['timing1'], 
                  time2: doctors[index]['timing2'], 
                   day3: doctors[index]['day3'] , time3:doctors[index]['timing3'], hsptlName: hsptlName, 
                  )));                
              },
              child: DoctorListView(
                designation: doctors[index]['speciality'], 
                hospital:doctors[index]['speciality'], 
                name:doctors[index]['name'],
                ),
            ),
          );
        }),
    );
  }
}