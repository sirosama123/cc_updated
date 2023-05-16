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
import '../widgets/memberPageBars.dart';
import 'depts.dart';



class MemberHospitals extends StatelessWidget {
  List<dynamic> hospitalcities;
  MemberHospitals({super.key,required this.hospitalcities});

  @override
  Widget build(BuildContext context) {
    var deptList;
     getDeptHospitals(String? name) async {
      final dio = Dio();
      try {
          EasyLoading.show(
                        status: 'loading...',
                        maskType: EasyLoadingMaskType.black,
                      );
        final response = await dio.get(
            'https://script.google.com/macros/s/AKfycbx1_eSliQQqLeHgo6W11TrGUDP8eFNgsGDkjwKN1W0Qat5gMcgefj_Ec39wpLXAQkwB/exec');
        if (response.statusCode == 200) {
          final data = response.data;
          deptList=response.data;
          print(data['data'][0]);
          print(deptList['data'].runtimeType);
         Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HospitalDepts(hospitaldepts:deptList['data'], name: name ,)));
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
    return MaterialApp(
      builder: EasyLoading.init(),
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
            icon: const Icon(Icons.search,color: Colors.white,),
            
            onPressed: () {},
          ), ]
          ),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 10.w),
        child:ListView.builder(
          itemCount: hospitalcities.length,

          itemBuilder: (context,index){
            return Padding(
              padding:EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  getDeptHospitals(hospitalcities[index]['name'].toString());
                },
                child: hsptlName(
                  img: hospitalcities[index]['logo'], 
                  name: hospitalcities[index]['name']),
              ),
            );
          })
        
      ),
    ),
    );
  }
}

