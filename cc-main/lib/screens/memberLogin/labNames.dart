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
import '../../widgets/hsptlName.dart';
import '../../widgets/square3.dart';
import '../noLabsData.dart';
import '../widgets/memberPageBars.dart';
import 'depts.dart';
import 'labList.dart';



class LabNames extends StatefulWidget {
  List<dynamic> labNames;
  String? city;
  LabNames({super.key,required this.labNames,required this.city});

  @override
  State<LabNames> createState() => _LabNamesState();
}

class _LabNamesState extends State<LabNames> {
  @override
  bool abc = false;

  Widget build(BuildContext context) {
    var labList;
    var pharmalist;
     getLabsCitywise(String? link,String labName) async {
      final dio = Dio();
      try {
        setState(() {
          abc=true;
        });
        final response = await dio.get(
            '$link');
        if (response.statusCode == 200) {
          final data = response.data;
          labList=response.data;
          print(labList['data']);
          // print(data1);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LabList(lablist: labList['data'], city: widget.city, LabName: labName,)));
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
    //  getPharmaciesCitywise(String? city,String? img) async {
    //   final dio = Dio();
    //   try {
    //     setState(() {
    //       abc=true;
    //     });
    //     final response = await dio.get(
    //         'https://script.google.com/macros/s/AKfycbzitTttcGRo4h3VXKcLO51Qua_k3pQy5MACnmdq8x3NO-pyMZJ8u8jsmS9JEDUDx2qJ/exec?city=$city');
    //     if (response.statusCode == 200) {
    //       final data = response.data;
    //       pharmalist=response.data;
    //       print(pharmalist['data']);
    //       // print(data1);
    //       Navigator.push(
    //           context, MaterialPageRoute(builder: (context) => PharmaList(pharmalist: pharmalist['data'], img: img, city: city,)));
    //     } else {
    //       print('API request failed with status code ${response.statusCode}');
    //     }
    //     setState(() {
    //       abc=false;
    //     });
    //   } catch (e) {
    //     print('Error retrieving data from API: $e');
    //     print('Data not exist');
    //     setState(() {
    //       abc=false;
    //     });
    //   }
    // }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    
      home: Scaffold(
       appBar: AppBar(
            backgroundColor: Color(0xff2b578e),
            title: Text("${widget.city} Laboratories"),
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
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              
                children: List.generate(widget.labNames.length, (index) {
                  print(widget.labNames);
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: GestureDetector(
                      onTap: (){
                        if (widget.labNames[index]['branches'].toString()=='') {
                          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NoLabDisclaimer()));
                          
                        } else {
                          getLabsCitywise(widget.labNames[index]['branches'],widget.labNames[index]['name']);
                        }
                        
                      },
                      child:hsptlName(
                        img: widget.labNames[index]['logo'], 
                        name:  widget.labNames[index]['name'])
                     ),
                  );
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