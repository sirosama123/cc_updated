import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
import '../../widgets/multi3.dart';
import '../widgets/memberPageBars.dart';
import 'approval.dart';
import 'hsptlApproval.dart';


class HsptlDependentsData extends StatelessWidget {
  String? hsptlName;
  String? city;
  String? for1;
  HsptlDependentsData({super.key,required this.hsptlName,required this.city,required this.for1});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff2b578e),
          title: Text("Dependents"),
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
          body: ListView.builder(
            itemCount: Provider11.data1['data'].length,
            itemBuilder: (context,index){
              return Padding(
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          Provider11.data1['data'][index]['Relation'].toString()=='SELF'?Image.asset("assets/images/self.png",height: 20.h,width: 20.w,):Provider11.data1['data'][index]['Relation'].toString()=='SPOUSE'?Image.asset("assets/images/spouse.png",height: 20.h,width: 20.w,):Provider11.data1['data'][index]['Relation'].toString()=='SON'?Image.asset("assets/images/son.png",height: 20.h,width: 20.w,):Image.asset("assets/images/daughter.png",height: 20.h,width: 20.w,),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle: Provider11.data1['data'][index]['Relation'].toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                        Divider(color: Colors.white,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "Name", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle: Provider11.data1['data'][index]['Name'].toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "CNIC", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle: Provider11.data1['data'][index]['CNIC'].toString()==''?"-------------":Provider11.data1['data'][index]['CNIC'].toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                             NeumorphicButton(
              
                  margin: EdgeInsets.only(top: 12),
                  onPressed: () {
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HsptlApproval(
                                      age: Provider11.data1['data'][index]['Age'].toString(), 
                                      cnic: Provider11.data1['data'][index]['CNIC'].toString(), 
                                      dn: Provider11.data1['data'][index]['DocumentNo'].toString(), 
                                      dob: Provider11.data1['data'][index]['Dob'].toString(),
                                      ed: Provider11.data1['data'][index]['EffectiveDate'].toString(), 
                                      gen: Provider11.data1['data'][index]['Gender'].toString(),
                                      hc: Provider11.data1['data'][index]['healthcode'].toString(), 
                                      idate: Provider11.data1['data'][index]['IssueDate'].toString(), 
                                      name: Provider11.data1['data'][index]['Name'].toString(),
                                      pc: Provider11.data1['data'][index]['PlanCode'].toString(),
                                      relation: Provider11.data1['data'][index]['Relation'].toString(), hsptlName: hsptlName, city: city, approvalFor: 'hospital', for1: for1,
                                      )));
                  },
                  style: NeumorphicStyle(
                    shadowLightColor: Colors.blue,
                    shape: NeumorphicShape.flat,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                    //border: NeumorphicBorder()
                  ),
                  padding:  EdgeInsets.all(6.0),
                  child: Multi3(color: Color(0xff2b578e), subtitle: "Proceed", weight: FontWeight.bold, size: 12)
                  ),
                          ],
                        ),
                        SizedBox(height: 5.h,)
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
                          ),
              );
            }
            )




          //  Column(
          //   children: [
          //     SizedBox(height: 10.h,),
              
          //   SizedBox(height: 10.h,),
          //     Neumorphic(
              
          //     child: Padding(
          //       padding:  EdgeInsets.symmetric(horizontal: 10.w),
          //       child: Container(
                  
          //         width: double.infinity,
          //         child: Column(
          //           children: [
          //             SizedBox(height: 5.h,),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               children: [
          //                 Image.asset("assets/images/spouse.png",height: 20.h,width: 20.w,),
          //                 SizedBox(width: 5.w,),
          //                 Multi3(color: Colors.white, subtitle: "Spouse", weight: FontWeight.bold, size: 16),
          //               ],
          //             ),
          //             Divider(color: Colors.white,),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Multi3(color: Colors.white, subtitle: "Name", weight: FontWeight.bold, size: 16),
          //                 SizedBox(width: 5.w,),
          //                 Multi3(color: Colors.white, subtitle: "snsdnk", weight: FontWeight.bold, size: 16),
          //               ],
          //             ),
          //              Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Multi3(color: Colors.white, subtitle: "CNIC", weight: FontWeight.bold, size: 16),
          //                 SizedBox(width: 5.w,),
          //                 Multi3(color: Colors.white, subtitle: "737672375745272", weight: FontWeight.bold, size: 16),
          //               ],
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Container(),
          //                  NeumorphicButton(

          //       margin: EdgeInsets.only(top: 12),
          //       onPressed: () {
                  
          //       },
          //       style: NeumorphicStyle(
          //         shadowLightColor: Colors.blue,
          //         shape: NeumorphicShape.flat,
          //         boxShape:
          //             NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
          //         //border: NeumorphicBorder()
          //       ),
          //       padding:  EdgeInsets.all(6.0),
          //       child: Multi3(color: Colors.blue, subtitle: "Issue", weight: FontWeight.bold, size: 12),
          //       ),
          //               ],
          //             ),
          //             SizedBox(height: 5.h,)
          //           ],
          //         ),
          //       ),
          //     ),

              
          //     style: NeumorphicStyle(
          //       shape: NeumorphicShape.flat,
          //       // shadowDarkColor: Color.fromARGB(255, 0, 38, 69),
          //       color: Color(0xff2b578e),
          //       // shadowLightColor: Color.fromARGB(255, 0, 38, 69),
          //       lightSource: LightSource.bottomRight,
          //       depth: -20,
          //       disableDepth: false,
          //       border: NeumorphicBorder(
          //       color: Color(0x33000000),
          //       width: 0.1,
                
          //     )),
          //   ),
          //   SizedBox(height: 10.h,),
          //     Neumorphic(
              
          //     child: Padding(
          //       padding:  EdgeInsets.symmetric(horizontal: 10.w),
          //       child: Container(
                  
          //         width: double.infinity,
          //         child: Column(
          //           children: [
          //             SizedBox(height: 5.h,),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               children: [
          //                 Image.asset("assets/images/son.png",height: 20.h,width: 20.w,),
          //                 SizedBox(width: 5.w,),
          //                 Multi3(color: Colors.white, subtitle: "Son", weight: FontWeight.bold, size: 16),
          //               ],
          //             ),
          //             Divider(color: Colors.white,),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Multi3(color: Colors.white, subtitle: "Name", weight: FontWeight.bold, size: 16),
          //                 SizedBox(width: 5.w,),
          //                 Multi3(color: Colors.white, subtitle: "snsdnk", weight: FontWeight.bold, size: 16),
          //               ],
          //             ),
          //              Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Multi3(color: Colors.white, subtitle: "CNIC", weight: FontWeight.bold, size: 16),
          //                 SizedBox(width: 5.w,),
          //                 Multi3(color: Colors.white, subtitle: "737672375745272", weight: FontWeight.bold, size: 16),
          //               ],
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Container(),
          //                  NeumorphicButton(

          //       margin: EdgeInsets.only(top: 12),
          //       onPressed: () {
                  
          //       },
          //       style: NeumorphicStyle(
          //         shadowLightColor: Colors.blue,
          //         shape: NeumorphicShape.flat,
          //         boxShape:
          //             NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
          //         //border: NeumorphicBorder()
          //       ),
          //       padding:  EdgeInsets.all(6.0),
          //       child: Text(
          //         "Go to full sample",
                 
          //       )),
          //               ],
          //             ),
          //             SizedBox(height: 5.h,)
          //           ],
          //         ),
          //       ),
          //     ),

              
          //     style: NeumorphicStyle(
          //       shape: NeumorphicShape.flat,
          //       // shadowDarkColor: Color.fromARGB(255, 0, 38, 69),
          //       color: Color(0xff2b578e),
          //       // shadowLightColor: Color.fromARGB(255, 0, 38, 69),
          //       lightSource: LightSource.bottomRight,
          //       depth: -20,
          //       disableDepth: false,
          //       border: NeumorphicBorder(
          //       color: Color(0x33000000),
          //       width: 0.1,
                
          //     )),
          //   ),
          //   ],
          // ),
    );
  }
}