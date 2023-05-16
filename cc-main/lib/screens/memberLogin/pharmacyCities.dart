import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/memberLogin/pharmacyList.dart';
import 'package:project1/screens/memberLogin/profile.dart';
import 'package:project1/screens/profile.dart';
import 'package:project1/screens/subscreens/labOrderDetails.dart';
import 'package:project1/screens/subscreens/medicineOrdersDetail.dart';
import 'package:project1/widgets/dbSquares.dart';
import 'package:project1/widgets/heading3B.dart';
import 'package:project1/widgets/chead2.dart';
import 'package:project1/widgets/smallDBsquare.dart';
import 'package:project1/widgets/square2.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../widgets/hospitalName.dart';
import '../../widgets/square3.dart';
import '../widgets/memberPageBars.dart';
import 'depts.dart';



class PharmaCities extends StatelessWidget {
  List<dynamic> pharmacities;
  PharmaCities({super.key,required this.pharmacities});

  @override
  Widget build(BuildContext context) {
    var pharmalist;
     getPharmaciesCitywise(String? city,String? img) async {
      final dio = Dio();
      try {
         EasyLoading.show(
                        status: 'loading...',
                        maskType: EasyLoadingMaskType.black,
                      );
        final response = await dio.get(
            'https://script.google.com/macros/s/AKfycbzitTttcGRo4h3VXKcLO51Qua_k3pQy5MACnmdq8x3NO-pyMZJ8u8jsmS9JEDUDx2qJ/exec?city=$city');
        if (response.statusCode == 200) {
          final data = response.data;
          pharmalist=response.data;
          print(pharmalist['data']);
          // print(data1);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PharmaList(pharmalist: pharmalist['data'], img: img, city: city,)));
        } else {
          print('API request failed with status code ${response.statusCode}');
        }
        EasyLoading.dismiss();
      } catch (e) {
        print('Error retrieving data from API: $e');
        print('Data not exist');
        EasyLoading.dismiss();
      }
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: Scaffold(
       appBar: AppBar(
            backgroundColor: Color(0xff2b578e),
            title: Text("Pharmacy Cities"),
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
      body: Padding(
        padding:EdgeInsets.only(top: 15.h,right: 10.w,left: 10.w,bottom: 5.h),
        child: GridView.count(
            crossAxisCount: 3, // Number of columns
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          
            children: List.generate(pharmacities.length, (index) {
              print(pharmacities);
              return GestureDetector(
                onTap: (){
                  getPharmaciesCitywise(pharmacities[index]['city'],pharmacities[index]['img2']);
                },
                child: Square3(imgAddress: pharmacities[index]['img'], heading: pharmacities[index]['city']));
            }),),
      )
    ),
    );
  }
}