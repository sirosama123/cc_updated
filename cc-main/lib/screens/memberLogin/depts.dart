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
import 'dependents.dart';
import 'doctorList.dart';

class HospitalDepts extends StatelessWidget {
  List<dynamic> hospitaldepts;
  String? name;
  HospitalDepts({super.key,required this.hospitaldepts,required this.name});

  @override
  Widget build(BuildContext context) {
    var dr_list;
    getDrList(String dept) async {
      final dio = Dio();
      try {
          EasyLoading.show(
                        status: 'loading...',
                        maskType: EasyLoadingMaskType.black,
                      );
        final response = await dio.get(
            'https://script.google.com/macros/s/AKfycbwxRIL2aFRA-WL9_A994KDZ795i0eW0cBjHX8kDpGcxzCdWyK5lrBGg0QS4DdoB-Esq/exec?department=$dept');
        if (response.statusCode == 200) {
          final data = response.data;
          dr_list=response.data;
          print(data['data'][0]);
          print(dr_list['data'].runtimeType);
         Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorList(doctors: dr_list['data'], hsptlName: name,)));
              EasyLoading.dismiss();
        } else {
          print('API request failed with status code ${response.statusCode}');
          EasyLoading.dismiss();
        }
      } catch (e) {
        print('Error retrieving data from API: $e');
        print('Data not exist');
        EasyLoading.dismiss();
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
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 10.w),
        child:ListView.builder(
          itemCount: hospitaldepts.length,

          itemBuilder: (context,index){
            return Padding(
              padding:EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  getDrList(hospitaldepts[index]['dept']);
                },
                child: HosDept(
                  img: hospitaldepts[index]['img'], 
                  name: hospitaldepts[index]['dept'])
              ),
            );
          })
        
      ),
      
      //  Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 10.w),
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         SizedBox(
      //           height: 10.h,
      //         ),
      //         GestureDetector(
      //             onTap: () {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => DependentsData()));
      //             },
      //             child: HosDept(
      //               img: 'assets/images/plasticSurgery.jpg',
      //               name: 'Plastic Surgery',
      //             )),
      //         SizedBox(
      //           height: 20.h,
      //         ),
      //         HosDept(
      //           img: 'assets/images/emergency.jpg',
      //           name: 'Accident and Emergency.',
      //         ),
      //         SizedBox(
      //           height: 20.h,
      //         ),
      //         HosDept(
      //           img: 'assets/images/diabetes.jpg',
      //           name: 'Diabetes',
      //         ),
      //         SizedBox(
      //           height: 20.h,
      //         ),
      //         HosDept(
      //           img: 'assets/images/pediatrics.jpg',
      //           name: 'Pediatrics.',
      //         ),
      //         SizedBox(
      //           height: 20.h,
      //         ),
      //         HosDept(
      //           img: 'assets/images/ent.jpg',
      //           name: 'ENT',
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
