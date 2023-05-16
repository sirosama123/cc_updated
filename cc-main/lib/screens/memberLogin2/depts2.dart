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
import '../widgets/memberPageBars.dart';
import 'doctorList2.dart';

class HospitalDepts2 extends StatelessWidget {
  String? name;
  var hospitaldepts;
  HospitalDepts2({super.key,required this.name,required this.hospitaldepts});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
    var dr_list;
    
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
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 10.w),
        child:ListView.builder(
          itemCount: hospitaldepts.length,

          itemBuilder: (context,index){
            return Padding(
              padding:EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  // print(hospitaldepts.values.elementAt(index)['doctors'][0]['speciality']);
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                     DoctorList2(doctors: hospitaldepts.values.elementAt(index)['doctors'],hsptlName: name, deptName: hospitaldepts.keys.toList()[index],)
                                     )
                                     );
                },
                child: HosDept(
                  img: hospitaldepts.values.elementAt(index)['img'], 
                  name: hospitaldepts.keys.toList()[index]
                  )
              ),
            );
          })
        
      ),
      
      
    );
  }
}
