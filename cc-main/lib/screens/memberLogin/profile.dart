import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/profile.dart';
import 'package:project1/screens/subscreens/labOrderDetails.dart';
import 'package:project1/screens/subscreens/medicineOrdersDetail.dart';
import 'package:project1/widgets/dbSquares.dart';
import 'package:project1/widgets/heading3B.dart';
import 'package:project1/widgets/chead2.dart';
import 'package:project1/widgets/smallDBsquare.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tap_to_expand/tap_to_expand.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../widgets/multi3.dart';
import '../../widgets/multiText.dart';

class MemberProfile extends StatelessWidget {
  var data1;

  MemberProfile({super.key, required this.data1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              //     Container(

              // width: double.infinity,
              //  decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(10.0),
              //         color: Color(0xffafc4dd),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Color(0xffA4A4A4),
              //             blurRadius: 6.0,
              //             spreadRadius: 1.0,
              //             offset: Offset(0.0, 0.0),
              //             // Shadow position
              //           ),
              //         ],
              //       ),
              // child: Padding(
              //   padding:  EdgeInsets.all(12),
              //   child: Column(children: [
              //      Multi3(color: Colors.white, subtitle: "Head Of Family", weight: FontWeight.bold, size: 17),
              //      SizedBox(height: 10.h,),
              //      Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Multi(color: Colors.white, subtitle: "Name", weight: FontWeight.bold, size: 10),
              //         Multi(color: Colors.white, subtitle: "$name", weight: FontWeight.bold, size: 10),
              //       ],
              //      ),
              //      SizedBox(height: 10.h,),
              //      Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Multi(color: Colors.white, subtitle: "DOB", weight: FontWeight.bold, size: 10),
              //         Multi(color: Colors.white, subtitle: "$dob", weight: FontWeight.bold, size: 10),
              //       ],
              //      ),
              //      SizedBox(height: 10.h,),
              //      Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Multi(color: Colors.white, subtitle: "CNIC", weight: FontWeight.bold, size: 10),
              //         Multi(color: Colors.white, subtitle: "$cnic", weight: FontWeight.bold, size: 10),
              //       ],
              //      ),

              //      SizedBox(height: 10.h,),
              //      Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Multi(color: Colors.white, subtitle: "Plan code", weight: FontWeight.bold, size: 10),
              //         Multi(color: Colors.white, subtitle: "$planeCode", weight: FontWeight.bold, size: 10),
              //       ],
              //      ),
              //      SizedBox(height: 10.h,),
              //      Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Multi(color: Colors.white, subtitle: "Member Code", weight: FontWeight.bold, size: 10),
              //         Multi(color: Colors.white, subtitle: "$memberCode", weight: FontWeight.bold, size: 10),
              //       ],
              //      ),
              //      SizedBox(height: 10.h,),
              //      Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Multi(color: Colors.white, subtitle: "Issue Date", weight: FontWeight.bold, size: 10),
              //         Multi(color: Colors.white, subtitle: "$issueDate", weight: FontWeight.bold, size: 10),
              //       ],
              //      ),
              //      SizedBox(height: 10.h,),
              //      Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Multi(color: Colors.white, subtitle: "Health code", weight: FontWeight.bold, size: 10),
              //         Multi(color: Colors.white, subtitle: "$healthCode", weight: FontWeight.bold, size: 10),
              //       ],
              //      ),
              //      SizedBox(height: 10.h,),
              //      Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Multi(color: Colors.white, subtitle: "Effective Date", weight: FontWeight.bold, size: 10),
              //         Multi(color: Colors.white, subtitle: "$effDate", weight: FontWeight.bold, size: 10),
              //       ],
              //      ),
              //      SizedBox(height: 10.h,),
              //      Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Multi(color: Colors.white, subtitle: "Gender", weight: FontWeight.bold, size: 10),
              //         Multi(color: Colors.white, subtitle: "$gender", weight: FontWeight.bold, size: 10),
              //       ],
              //      ),
              //      SizedBox(height: 10.h,),
              //      Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Multi(color: Colors.white, subtitle: "Age", weight: FontWeight.bold, size: 10),
              //         Multi(color: Colors.white, subtitle: "$age", weight: FontWeight.bold, size: 10),
              //       ],
              //      ),

              //   ],),
              // )
              //   ),
              //   SizedBox(
              //     height: 15.h,
              //   ),
              ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: int.parse(data1['data'].length.toString()),
                  itemBuilder: (BuildContext context, int index) {
                    final item = data1['data'][index];
                    return Container(
                      
                        child: Column(
                          children: [
                            TapToExpand(
                              color: Color(0xff2b578e),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.transparent.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              onTapPadding: 5,
                              closedHeight: 95.h,
                              scrollable: true,
                              borderRadius: 10,
                              openedHeight: 350.h,
                              content: Column(
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "CNIC",
                                          weight: FontWeight.bold,
                                          size: 10),
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "${item['CNIC'].toString()}",
                                          weight: FontWeight.bold,
                                          size: 10),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "Plan code",
                                          weight: FontWeight.bold,
                                          size: 10),
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "${item['PlanCode'].toString()}",
                                          weight: FontWeight.bold,
                                          size: 10),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "Member Code",
                                          weight: FontWeight.bold,
                                          size: 10),
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "${item['memberCode'].toString()}",
                                          weight: FontWeight.bold,
                                          size: 10),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "Issue Date",
                                          weight: FontWeight.bold,
                                          size: 10),
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "${item['IssueDate'].toString()}",
                                          weight: FontWeight.bold,
                                          size: 10),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "Health code",
                                          weight: FontWeight.bold,
                                          size: 10),
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "${item['healthcode'].toString()}",
                                          weight: FontWeight.bold,
                                          size: 10),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "Effective Date",
                                          weight: FontWeight.bold,
                                          size: 10),
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "${item['EffectiveDate'].toString()}",
                                          weight: FontWeight.bold,
                                          size: 10),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "Gender",
                                          weight: FontWeight.bold,
                                          size: 10),
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "${item['Gender'].toString()}",
                                          weight: FontWeight.bold,
                                          size: 10),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "Age",
                                          weight: FontWeight.bold,
                                          size: 10),
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "${item['Age'].toString()}",
                                          weight: FontWeight.bold,
                                          size: 10),
                                    ],
                                  ),
                                   SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Multi(
                                                  color: Colors.white,
                                                  subtitle: "DOB",
                                                  weight: FontWeight.bold,
                                                  size: 10),
                                              Multi(
                                                  color: Colors.white,
                                                  subtitle: "${item['Dob'].toString()}",
                                                  weight: FontWeight.bold,
                                                  size: 10),
                                            ],
                                          ),
                                ],
                              ),
                              title: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Multi3(
                                              color: Colors.white,
                                              subtitle: "${item['Relation'].toString()}",
                                              weight: FontWeight.bold,
                                              size: 17),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Multi(
                                                  color: Colors.white,
                                                  subtitle: "${item['Name'].toString()}",
                                                  weight: FontWeight.bold,
                                                  size: 10),
                                         
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ));
                  }),
              SizedBox(
                height: 15.h,
              ),
              //          ListView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: dependents.length,
              //   itemBuilder: (context, index) {
              //     final dependent = dependents.values.elementAt(index);

              //     return  Padding(
              //       padding:  EdgeInsets.only(bottom: 7.h),
              //       child: Container(
              //           width: double.infinity,
              //         decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10.0),
              //                 color: Color(0xffafc4dd),
              //                 boxShadow: [
              //                   BoxShadow(
              //                     color: Color(0xffA4A4A4),
              //                     blurRadius: 6.0,
              //                     spreadRadius: 1.0,
              //                     offset: Offset(0.0, 0.0),
              //                     // Shadow position
              //                   ),
              //                 ],
              //               ),
              //         child: Padding(
              //           padding: const EdgeInsets.all(15),
              //           child: Column(
              //             children: [
              //                Multi3(color: Colors.white, subtitle: dependent['relation'], weight: FontWeight.bold, size: 17),
              //                SizedBox(height: 10.h,),
              //                 Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Multi(color: Colors.white, subtitle: "Name", weight: FontWeight.bold, size: 10),
              //                   Multi(color: Colors.white, subtitle: dependent['name'], weight: FontWeight.bold, size: 10),
              //                 ],
              //                ),
              //                SizedBox(height: 10.h,),
              //                Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Multi(color: Colors.white, subtitle: "DOB", weight: FontWeight.bold, size: 10),
              //                   Multi(color: Colors.white, subtitle: dependent['dob'], weight: FontWeight.bold, size: 10),
              //                 ],
              //                ),
              //                SizedBox(height: 10.h,),
              //                Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Multi(color: Colors.white, subtitle: "CNIC", weight: FontWeight.bold, size: 10),
              //                   Multi(color: Colors.white, subtitle: dependent['cnic'], weight: FontWeight.bold, size: 10),
              //                 ],
              //                ),

              //                SizedBox(height: 10.h,),
              //                Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Multi(color: Colors.white, subtitle: "Age", weight: FontWeight.bold, size: 10),
              //                   Multi(color: Colors.white, subtitle: dependent['age'], weight: FontWeight.bold, size: 10),
              //                 ],
              //                ),
              //                SizedBox(height: 10.h,),
              //                Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Multi(color: Colors.white, subtitle: "Gender", weight: FontWeight.bold, size: 10),
              //                   Multi(color: Colors.white, subtitle: dependent['gender'], weight: FontWeight.bold, size: 10),
              //                 ],
              //                ),
              //                SizedBox(height: 10.h,),
              //                ElevatedButton(onPressed: (){
              //                 // print(data1['data']);
              //                 for (var i = 0; i < data1['data'].length; i++) {
              //                   print("${data1['data'][i]['Name']} this is $i");
              //                 }
              //                }, child: Text("data"))
              //             ],
              //           ),
              //         ),
              //         ),
              //     );
              //   },
              // ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
