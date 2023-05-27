import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/screens/activities.dart';
import 'package:project1/screens/adminpanel.dart';
import 'package:project1/screens/outPatient.dart';
import 'package:project1/screens/patientServices.dart';
import 'package:project1/screens/subscreens/activities.dart';
import 'package:project1/screens/subscreens/appointment.dart';
import 'package:project1/screens/subscreens/push.dart';
import 'package:project1/screens/testing1.dart';
import 'package:project1/widgets/slider.dart';
import 'package:project1/widgets/squares.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'Provider/provider1.dart';
import 'downloadCards/allCards.dart';
import 'downloadCards/landingCard.dart';
import 'downloadCards/pdf1.dart';
import 'memberLogin/memberLoginDisclaimer.dart';
import 'memberLogin2/memberPage2.dart';
import 'memberPage.dart';
import 'package:http/http.dart' as http;

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  bool abc = false;
  Widget build(BuildContext context) {
    
    final Provider11 = Provider.of<Provider1>(context);

    getDataInsured(String? cnic) async {
      final dio = Dio();
      try {
        setState(() {
          abc=true;
        });
        final response = await dio.get(
            'https://script.google.com/macros/s/AKfycbwhf6DqjHQAWYToV7AZVhe-p_T_TgfIoV7sclnN4PJtOR60IA5BEfHNzVXOFkv2R0HOmQ/exec?headcnic=$cnic');
        // EasyLoading.dismiss();
        if (response.statusCode == 200) {
          final data = response.data;
          Provider11.data1 = data;
          data['data'].isEmpty?Navigator.push(
              context, MaterialPageRoute(builder: (context) => MemberDisclaimer())):Navigator.push(
              context, MaterialPageRoute(builder: (context) => MemberPage()));
          
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

    getCardData(String cid) async {
      final dio = Dio();
      try {
        setState(() {
          abc=true;
        });
        EasyLoading.show(
          status: 'loading...',
          maskType: EasyLoadingMaskType.black,

        );
        final response = await dio.get(
            'https://script.google.com/macros/s/AKfycbyBJNKGuO1bUOdaXPGt_i1ZvKkOK3HYl-26QPZdbZ-_M2JBLFKOCjqam_ZPkG6CdWfqnA/exec?cardId=$cid');
        setState(() {
          abc=false;
        });
        if (response.statusCode == 200) {
          final data = response.data;
          Provider11.policyData = data['data'];
          print(data['data'][0]);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LandingCard()));
        } else {
           setState(() {
          abc=false;
        });
          print('API request failed with status code ${response.statusCode}');
        }
        EasyLoading.dismiss();
      } catch (e) {
         setState(() {
          abc=false;
        });
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
           
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Slider23(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: GestureDetector(
                                    child: Squares(
                                        imgAddress: 'assets/images/healthcare.png',
                                        heading: "In-Patient Services"),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Services()));
                                    },
                                  ),
                                  onTap: () {},
                                  splashColor: Color(0xff2b578e),
                                  highlightColor: Color(0xff2b578e),
                                ),
                                InkWell(
                                  child: GestureDetector(
                                    child: Squares(
                                        imgAddress: "assets/images/medicine.png",
                                        heading: "Out-Patient Services"),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => OutPatient()));
                                    },
                                  ),
                                  onTap: () {},
                                  splashColor: Color(0xff2b578e),
                                  highlightColor: Color(0xff2b578e),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: GestureDetector(
                                    child: Squares(
                                        imgAddress: "assets/images/permission.png",
                                        heading: "Member Login"),
                                    onTap: () async {
                                      // print(Provider11.med_dates);
                                      // print(Provider11.lab_dates);
                                      // Provider11.medLab();
                                      // print(Provider11.medlabs);
                                      // print(Provider11.cnic);
                                      if (Provider11.cnic == null) {
                                        getCardData(Provider11.policy.toString());
                                      } else {
                                        // EasyLoading.show(
                                        //   status: 'loading...',
                                        //   maskType: EasyLoadingMaskType.black,
                                        // );
                                        getDataInsured(Provider11.cnic);
                                      }
                                    },
                                  ),
                                  onTap: () {},
                                  splashColor: Color(0xff2b578e),
                                  highlightColor: Color(0xff2b578e),
                                ),
                                InkWell(
                                  child: GestureDetector(
                                    child: Squares(
                                        imgAddress: "assets/images/activities.png",
                                        heading: "Activities"),
                                    onTap: () async {
                                       Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Activities1()));
                                      // DatabaseReference ref = FirebaseDatabase
                                      //     .instance
                                      //     .ref("local_users");
                                      // await ref
                                      //     .child('42201-3260358-9')
                                      //     .onValue
                                      //     .listen((event) {
                                      //   Map<dynamic, dynamic> data = event.snapshot
                                      //       .value as Map<dynamic, dynamic>;
                                      //   Provider11.data2 = data;
                                      //   print(data.keys);
                                      // });

                                      // DatabaseReference ref2 = FirebaseDatabase
                                      //     .instance
                                      //     .ref("hospitals");
                                      // await ref2.onValue.listen((event) {
                                      //   Map<dynamic, dynamic> hsptl = event.snapshot
                                      //       .value as Map<dynamic, dynamic>;
                                      //   Provider11.hsptl_data = hsptl;
                                      //   print("${hsptl}-------->");
                                      // });

                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => MemberPage2()));
                                    },
                                  ),
                                  onTap: () {},
                                  splashColor: Color(0xff2b578e),
                                  highlightColor: Color(0xff2b578e),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
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
        ),
      ),
      
    );
  }
}
