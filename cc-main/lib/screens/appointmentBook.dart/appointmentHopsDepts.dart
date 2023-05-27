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

import '../../widgets/hosdept.dart';
import '../../widgets/hospitalName.dart';
import '../memberLogin/doctorList.dart';
import '../widgets/memberPageBars.dart';
import 'appointmentDrList.dart';


class HospitalDeptsApointment extends StatefulWidget {
  List<dynamic> hospitaldepts;
  String? name;
  String? dr_list_api;
  HospitalDeptsApointment({super.key,required this.hospitaldepts,required this.name,required this.dr_list_api});

  @override
  State<HospitalDeptsApointment> createState() => _HospitalDeptsApointmentState();
}

class _HospitalDeptsApointmentState extends State<HospitalDeptsApointment> {
  @override
 bool abc=false;
  Widget build(BuildContext context) {
    var dr_list;
    getDrList(String dept) async {
      final dio = Dio();
      
      try {
          setState(() {
            abc=true;
          });
        final response = await dio.get(
            '${widget.dr_list_api}?department=$dept');
        if (response.statusCode == 200) {
          final data = response.data;
          dr_list=response.data;
          
          print("here is doctor ${dr_list} here is doctor");
         Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorListAppointment(doctors: dr_list['data'], hsptlName: widget.name,)));
              setState(() {
                abc=false;
              });
        } else {
          print('API request failed with status code ${response.statusCode}');
          setState(() {
            abc=false;
          });
        }
      } catch (e) {
        print('Error retrieving data from API: $e');
        print('Data not exist');
        setState(() {
          abc=false;
        });
      }
    }
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff2b578e),
          title: Text("Departments"),
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ]),
      body: Stack(
        children: [
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 10.w),
            child:
             Padding(
               padding:  EdgeInsets.only(top: 5.h),
               child: GridView.count(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                
                  children: List.generate(widget.hospitaldepts.length, (index) {
                    print(widget.hospitaldepts);
                    return GestureDetector(
                      onTap: (){
                       getDrList(widget.hospitaldepts[index]['dept']);
                      },
                      child:  HosDept(
                        img: widget.hospitaldepts[index]['img'], 
                        name: widget.hospitaldepts[index]['dept']));
                  }),),
             ),            
          ),
           abc==true? Align(
              alignment: Alignment.center,
              child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.4),
                  
                  child: Center(
                    child: Container(
                      height: 80.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white,width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.transparent
                      ),
                      child: Center(
                        child: CircularProgressIndicator(color: Colors.white,),
                      ),
                    ),
                  ),
                ),
            ):Container(),
        ],
        
      ),
    );
  }
}
