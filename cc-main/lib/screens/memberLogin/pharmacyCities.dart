import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/memberLogin/pharmaNamesTypes.dart';
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



class PharmaCities extends StatefulWidget {
  List<dynamic> pharmacities;
  PharmaCities({super.key,required this.pharmacities});

  @override
  State<PharmaCities> createState() => _PharmaCitiesState();
}

class _PharmaCitiesState extends State<PharmaCities> {
  @override
  bool abc = false;

  Widget build(BuildContext context) {
    var pharmalist;
     getPharmaciesCitywise(String? url_pharm_names,String city) async {
      final dio = Dio();
      try {
        setState(() {
          abc=true;
        });
        final response = await dio.get(
            '$url_pharm_names');
        if (response.statusCode == 200) {
          final data = response.data;
          pharmalist=response.data;
          print("${pharmalist['data']} ====>");
          // print(data1);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PharmaNames(pharmaNames:pharmalist['data'], city: '',)));
        } else {
          print('API request failed with status code ${response.statusCode}');
        }
        setState(() {
          abc=false;
        });
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
      body: Stack(
        children: [
          Padding(
            padding:EdgeInsets.only(top: 15.h,right: 10.w,left: 10.w,bottom: 5.h),
            child: GridView.count(
                crossAxisCount: 3, // Number of columns
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              
                children: List.generate(widget.pharmacities.length, (index) {
                  return GestureDetector(
                    onTap: (){
                      getPharmaciesCitywise(widget.pharmacities[index]['pharma_names'],widget.pharmacities[index]['city']);
                    },
                    child: Square3(imgAddress: widget.pharmacities[index]['logo'], heading: widget.pharmacities[index]['city']));
                }),),
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
      )
    ),
    );
  }
}