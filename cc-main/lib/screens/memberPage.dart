import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/memberLogin/pharmacyCities.dart';
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

import '../widgets/memberPageBars.dart';
import '../widgets/memberPageBars2.dart';
import 'memberLogin/hospitals.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
    var data1;
    var pharmacities;
    var hospcities;
     getDataInsured(String? cnic) async {
      final dio = Dio();
      try {
          EasyLoading.show(
                        status: 'loading...',
                        maskType: EasyLoadingMaskType.black,
                      );
        final response = await dio.get(
            'https://script.google.com/macros/s/AKfycbwhf6DqjHQAWYToV7AZVhe-p_T_TgfIoV7sclnN4PJtOR60IA5BEfHNzVXOFkv2R0HOmQ/exec?headcnic=$cnic'
            );
        if (response.statusCode == 200) {
          final data = response.data;
          data1=response.data['data'];
          // Provider11.data1= response.data;
          print(data['data'][0]);
          print(data1);
          EasyLoading.dismiss();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MemberPage()));
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

    getPanelCitiesPharmacy() async {
      final dio = Dio();
      try {
          EasyLoading.show(
                        status: 'loading...',
                        maskType: EasyLoadingMaskType.black,
                      );
        final response = await dio.get(
            'https://script.google.com/macros/s/AKfycbxgRv64N6mzxutQeYkgR_NQ8szPC59qu8wtq4JJOEvHtre4WXhv0xKKwt38hxzgezMeIw/exec');
        if (response.statusCode == 200) {
          final data = response.data;
          pharmacities=response.data;
          print(data['data'][0]);
          print(pharmacities['data'].runtimeType);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PharmaCities(pharmacities: pharmacities['data'],)));
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


    getPanelHospitals() async {
      final dio = Dio();
      try {
          EasyLoading.show(
                        status: 'loading...',
                        maskType: EasyLoadingMaskType.black,
                      );
        final response = await dio.get(
            'https://script.google.com/macros/s/AKfycbzOkEXv1sMdatoO4z6mrZUr7Iqv6V71CN_CGKEqyZzZ0SzBOyMbrKNci6mfQOAE18hgIA/exec');
        if (response.statusCode == 200) {
          final data = response.data;
          hospcities=response.data;
          print(data['data'][0]);
          print(hospcities['data'].runtimeType);
         Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MemberHospitals(hospitalcities: hospcities['data'],)));
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff2b578e),
          title: Text("Member's Page"),
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
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: double.infinity,
                height: 150.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    image: DecorationImage(
                        image: AssetImage("assets/images/banner.png"),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: (){
                   getPanelHospitals(); 
                },
                child: MemberPageBar1(
                  heading: 'Panel Hospitals      ',
                  imgAddress: 'assets/images/hospital.png',
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              MemberPageBar1(
                heading: 'Panel Laboratories',
                imgAddress: 'assets/images/laboratory.png',
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: (){
                  print("${Provider11.data1} here is data");
                  getPanelCitiesPharmacy();
                },
                child: MemberPageBar1(
                  heading: 'Panel Pharmacies',
                  imgAddress: 'assets/images/pharmacy.png',
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  MemberPageBar2(
                      imgAddress: "assets/images/claim.png",
                      heading: "My Claims"),
                  SizedBox(
                    width: 10.w,
                  ),
                  GestureDetector(
                    onTap: () async{
                      print(Provider11.data1);
                      print(Provider11.data1.length);
                      await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MemberProfile(
                                      data1: Provider11.data1,
                                        )));
                    },
                    child: MemberPageBar2(
                        imgAddress: "assets/images/user.png",
                        heading: "My Profile"),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  MemberPageBar2(
                      imgAddress: "assets/images/contact.png",
                      heading: "Contact"),
                  SizedBox(
                    width: 10.w,
                  ),
                  MemberPageBar2(
                      imgAddress: "assets/images/logout.png",
                      heading: "Log Out"),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    builder: EasyLoading.init(),
    );
  }
}
