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
import 'package:project1/widgets/hsptlName.dart';
import '../../widgets/hospitalName.dart';
import '../memberLogin/depts.dart';
import '../noDoctorDesclaimer.dart';
import '../widgets/memberPageBars.dart';
import 'appointmentHopsDepts.dart';


class MemberHospitalsApointment extends StatefulWidget {
  List<dynamic> hospitalcities;
  MemberHospitalsApointment({super.key,required this.hospitalcities});

  @override
  State<MemberHospitalsApointment> createState() => _MemberHospitalsApointmentState();
}

class _MemberHospitalsApointmentState extends State<MemberHospitalsApointment> {
  @override
  bool abc =false;

  Widget build(BuildContext context) {
    var deptList;
     getDeptHospitals(String? name ,String? link,String? dr_list_api) async {
      final dio = Dio();
      try {
         setState(() {
           abc = true;
         });
        final response = await dio.get(
            '$link');
        if (response.statusCode == 200) {
          final data = response.data;
          deptList=response.data;

         Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HospitalDeptsApointment(hospitaldepts:deptList['data'], name: name, dr_list_api: dr_list_api ,)));
              setState(() {
                abc = false;
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
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
            backgroundColor: Color(0xff2b578e),
            title: Text("Hospitals"),
             leading: GestureDetector(
            child: Icon( Icons.arrow_back_ios, color: Colors.white,  ),
               onTap: () {
                 Navigator.pop(context);
                } ,
        ) ,
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.search,color: Colors.white,),
            
            onPressed: () {},
          ), ]
          ),
      body: Stack(
        children: [
          GridView.count(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            
              children: List.generate(widget.hospitalcities.length, (index) {
                print(widget.hospitalcities);
                return GestureDetector(
                  onTap: (){
                    print(widget.hospitalcities[index]['dr_list'].toString());
                    if (widget.hospitalcities[index]['dr_list'].toString()=='') {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NoDoctorDisclaimer(hsptlName: widget.hospitalcities[index]['name'].toString(),)));
                    } else {
                      getDeptHospitals(widget.hospitalcities[index]['name'].toString(),widget.hospitalcities[index]['depts'].toString(),widget.hospitalcities[index]['dr_list'].toString());
                    }
                //  widget.hospitalcities[index]['dr_list']==null?print("error"):getDeptHospitals(widget.hospitalcities[index]['name'].toString(),widget.hospitalcities[index]['depts'].toString(),widget.hospitalcities[index]['dr_list'].toString());
                  },
                  child: Padding(
                    padding:  EdgeInsets.all(8),
                    child: hsptlName(
                      img: widget.hospitalcities[index]['logo'], 
                      name: widget.hospitalcities[index]['name']),
                  ));
              }),),
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
    ),
    );
  }
}

