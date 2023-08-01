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
import 'hospitals.dart';
import 'labNames.dart';


class HospCities extends StatefulWidget {
 
  HospCities({super.key});

  @override
  State<HospCities> createState() => _HospCitiesState();
}

class _HospCitiesState extends State<HospCities> {
  @override
  bool abc = false;

  Widget build(BuildContext context) {
      var labNames;
    getLabsNamesCitywise(String? link,String? city) async {
      final dio = Dio();
      try {
        setState(() {
          abc=true;
        });
        final response = await dio.get(
            '$link');
        if (response.statusCode == 200) {
          final data = response.data;
          labNames=response.data;
          print(labNames['data']);
          
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LabNames(labNames: labNames['data'], city: city,)));
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
    var hospcities;
    getPanelHospitals(String link,String city) async {
      final dio = Dio();
      try {
          setState(() {
            abc=true;
          });
        final response = await dio.get(
            '$link');
        if (response.statusCode == 200) {
          final data = response.data;
          hospcities=response.data;
          // print('${data['data'][1]}=====');
          print(hospcities['data'].runtimeType);
         Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MemberHospitals(hospitalcities: hospcities['data'], cityName: city,)));
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










    return MaterialApp(
      debugShowCheckedModeBanner: false,
    
      home: Scaffold(
       appBar: AppBar(
            backgroundColor: Color(0xff2b578e),
            title: Text("Hospital Cities"),
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
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                    Expanded(
                      flex: 3,
                      child:  Padding(
                        padding:EdgeInsets.all(4),
                        child: GestureDetector(
                                onTap: (){
                                  getPanelHospitals("https://script.google.com/macros/s/AKfycbzZ2utHnysZGpU5ZYZQn3so8FNFU3ys2mFtbmpEQbYONyXiXzHAapbUWWsQnnpowgunAg/exec","Karachi");
                                 
                                },
                                child:Square3(imgAddress: "https://firebasestorage.googleapis.com/v0/b/crescentcareapp-f58eb.appspot.com/o/quaid.png?alt=media&token=94f1bd85-500f-454d-8b19-0bdd8d0ca960", heading:"Karachi") ),
                      ),),
                  
                   Expanded(
                      flex: 3,
                      child:  Padding(
                         padding:EdgeInsets.all(4),
                        child: GestureDetector(
                                onTap: (){
                                  getPanelHospitals("https://script.google.com/macros/s/AKfycbzZ2utHnysZGpU5ZYZQn3so8FNFU3ys2mFtbmpEQbYONyXiXzHAapbUWWsQnnpowgunAg/exec","Karachi");
                                 
                                },
                                child:Square3(imgAddress: "https://firebasestorage.googleapis.com/v0/b/crescentcareapp-f58eb.appspot.com/o/quaid.png?alt=media&token=94f1bd85-500f-454d-8b19-0bdd8d0ca960", heading:"Karachi") ),
                      ),),
                  Expanded(
                      flex: 3,
                      child:  Padding(
                         padding:EdgeInsets.all(4),
                        child: GestureDetector(
                                onTap: (){
                                  getPanelHospitals("https://script.google.com/macros/s/AKfycbzZ2utHnysZGpU5ZYZQn3so8FNFU3ys2mFtbmpEQbYONyXiXzHAapbUWWsQnnpowgunAg/exec","Karachi");
                                 
                                },
                                child:Square3(imgAddress: "https://firebasestorage.googleapis.com/v0/b/crescentcareapp-f58eb.appspot.com/o/quaid.png?alt=media&token=94f1bd85-500f-454d-8b19-0bdd8d0ca960", heading:"Karachi") ),
                      ),),
                 ],
               ),
               SizedBox(height: 10.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     GestureDetector(
                                onTap: (){
                                  getPanelHospitals("https://script.google.com/macros/s/AKfycbwRS2eLWdWE1EzucSAl_uKaVNwyecyknMGVUpTarx7VUGMcqF84I6dlpaeDVnm7aoz4WA/exec","Islamabad");
                                 
                                },
                                child:Square3(imgAddress: "https://cdn-icons-png.flaticon.com/128/1046/1046183.png", heading:"Islamabad") ),
                     
                   ],
                               ),
                ),
             ],
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
      )
    ),
    );
  }
}