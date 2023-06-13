import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/memberLogin/pharmacyCities.dart';
import 'package:project1/screens/memberLogin/profile.dart';
import 'package:project1/screens/memberPage.dart';
import 'package:project1/widgets/multi3.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../widgets/smallDBsquare.dart';
import '../widgets/memberPageBars.dart';


class IndividualUtilization extends StatelessWidget {
  String? name;
  double amount;
  String? relation;
  String? pcode;
  String? roomRent;
  double? outPatient;
  String? maternity;
  String? gender;
  double? sum;
  IndividualUtilization({
    super.key,
    required this.name,
    required this.amount,
    required this.gender,
    required this.maternity,
    required this.outPatient,
    required this.pcode,
    required this.relation,
    required this.roomRent,
    required this.sum
    });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2b578e),
          title: Text("Utilizations"),
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
      body: SingleChildScrollView(
        child: Column(children: [
           Padding(
                    padding:EdgeInsets.only(top: 5.h,right: 10.w,left: 10.w),
                    child: Neumorphic(
                    
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.w),
                      child: Container(
                      
                        width: double.infinity,
                        child: Column(
                          children: [
                            SizedBox(height: 5.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                             Multi3(color: Colors.white, subtitle: "$name", weight: FontWeight.bold, size: 16),
                                SizedBox(width: 2.w,),
                               Container()
                              ],
                            ),
                            Divider(color: Colors.white,),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                             Multi3(color: Colors.white, subtitle: "Gender : ", weight: FontWeight.bold, size: 16),
                                SizedBox(width: 2.w,),
                                Multi3(color: Colors.white, subtitle:"${gender}", weight: FontWeight.bold, size: 16),
                              ],
                            ),
                            SizedBox(height: 5.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                 Multi3(color: Colors.white, subtitle: "Controlled Benefits", weight: FontWeight.bold, size: 16),
                                    SizedBox(height: 2.h,),
                                    Multi3(color: Colors.white, subtitle:"Out-Patient Benefits", weight: FontWeight.bold, size: 18),
                                  ],
                                ),
                                Container()
                              ],
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                       style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      // shadowDarkColor: Color.fromARGB(255, 0, 38, 69),
                      color: Color(0xff2b578e),
                      // shadowLightColor: Color.fromARGB(255, 0, 38, 69),
                      lightSource: LightSource.bottomRight,
                      depth: -20,
                      disableDepth: false,
                      border: NeumorphicBorder(
                      color: Color(0x33000000),
                      width: 0.1,
                      
                    )),
          )
          ),
          // SizedBox(height: 10.h,),
          Padding(
                    padding:EdgeInsets.only(top: 5.h,right: 10.w,left: 10.w),
                    child: Neumorphic(
                    
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.w),
                      child: Container(
                      
                        width: double.infinity,
                        child: Column(
                          children: [
                            SizedBox(height: 5.h,),
                           
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                 Multi3(color: Colors.white, subtitle: "Core Benefits", weight: FontWeight.bold, size: 16),
                                    SizedBox(height: 2.h,),
                                    Multi3(color: Colors.white, subtitle:"Basic Hospitalization Care", weight: FontWeight.bold, size: 18),
                                  ],
                                ),
                                Container()
                              ],
                            ),
                            SizedBox(height: 5.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: 8.w),
                                    child: smallDBsquare2(
                                      mainhead: "Limit", 
                                      counts: outPatient!, 
                                      bgColor: Colors.white, 
                                      height: 45.h, 
                                      width: 100.w, countC: Color(0xff2b578e), icolor: Color(0xff2b578e), tcolor: Color(0xff2b578e),
                                      ),
                                  )),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding:  EdgeInsets.all(4),
                                    child: smallDBsquare2(
                                      mainhead: "Utilized", 
                                      counts: amount, 
                                      bgColor: Colors.white, 
                                      height: 45.h, 
                                      width: 100.w,countC: Color(0xff2b578e), icolor: Color(0xff2b578e), tcolor: Color(0xff2b578e),
                                      ),
                                  )),
                                 Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding:  EdgeInsets.only(right: 8.w),
                                    child: smallDBsquare2(
                                      mainhead: "Balance", 
                                      counts: outPatient!-sum!, 
                                      bgColor: Colors.white, 
                                      height: 45.h, 
                                      width: 100.w,countC: Color(0xff2b578e), icolor: Color(0xff2b578e), tcolor: Color(0xff2b578e),
                                      ),
                                  )),
                              ],
                            ),
                            SizedBox(height: 5.h,),
                           
                           
                  
                          ],
                        ),
                      ),
                    ),
                       style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      // shadowDarkColor: Color.fromARGB(255, 0, 38, 69),
                      color: Color(0xff2b578e),
                      // shadowLightColor: Color.fromARGB(255, 0, 38, 69),
                      lightSource: LightSource.bottomRight,
                      depth: -20,
                      disableDepth: false,
                      border: NeumorphicBorder(
                      color: Color(0x33000000),
                      width: 0.1,
                      
                    )),
          )
          ),
           ((gender=='F' && relation=='SELF')||(gender=='F'&&relation=='SPOUSE'))?Padding(
                    padding:EdgeInsets.only(top: 5.h,right: 10.w,left: 10.w),
                    child: Neumorphic(
                    
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.w),
                      child: Container(
                      
                        width: double.infinity,
                        child: Column(
                          children: [
                            SizedBox(height: 5.h,),
                           
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                 Multi3(color: Colors.white, subtitle: "Core Benefits", weight: FontWeight.bold, size: 16),
                                    SizedBox(height: 2.h,),
                                    Multi3(color: Colors.white, subtitle:"Basic Maternity Care", weight: FontWeight.bold, size: 18),
                                  ],
                                ),
                                Container()
                              ],
                            ),
                            SizedBox(height: 5.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: 8.w),
                                    child: smallDBsquare2(
                                      mainhead: "Limit", 
                                      counts: outPatient!, 
                                      bgColor: Colors.white, 
                                      height: 45.h, 
                                      width: 100.w, countC: Color(0xff2b578e), icolor: Color(0xff2b578e), tcolor: Color(0xff2b578e),
                                      ),
                                  )),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding:  EdgeInsets.all(4),
                                    child: smallDBsquare2(
                                      mainhead: "Utilized", 
                                      counts: 0, 
                                      bgColor: Colors.white, 
                                      height: 45.h, 
                                      width: 100.w,countC: Color(0xff2b578e), icolor: Color(0xff2b578e), tcolor: Color(0xff2b578e),
                                      ),
                                  )),
                                 Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding:  EdgeInsets.only(right: 8.w),
                                    child: smallDBsquare2(
                                      mainhead: "Balance", 
                                      counts: outPatient!, 
                                      bgColor: Colors.white, 
                                      height: 45.h, 
                                      width: 100.w,countC: Color(0xff2b578e), icolor: Color(0xff2b578e), tcolor: Color(0xff2b578e),
                                      ),
                                  )),
                              ],
                            ),
                            SizedBox(height: 5.h,),
                           
                           
                  
                          ],
                        ),
                      ),
                    ),
                       style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      // shadowDarkColor: Color.fromARGB(255, 0, 38, 69),
                      color: Color(0xff2b578e),
                      // shadowLightColor: Color.fromARGB(255, 0, 38, 69),
                      lightSource: LightSource.bottomRight,
                      depth: -20,
                      disableDepth: false,
                      border: NeumorphicBorder(
                      color: Color(0x33000000),
                      width: 0.1,
                      
                    )),
          )
          ):Container()
          ],
          ),
      ),
    );
  }
}