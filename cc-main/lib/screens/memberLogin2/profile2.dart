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

class MemberProfile2 extends StatelessWidget {
  var data2;

  MemberProfile2({super.key, required this.data2});

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
              ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: int.parse(data2.length.toString()),
                  itemBuilder: (BuildContext context, int index) {
                    final item = data2;
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
                                          subtitle: "${item.values.elementAt(index)['cnic']}",
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
                                          subtitle: "${item.values.elementAt(index)['planCode']}",
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
                                          subtitle: "${item.values.elementAt(index)['MemberCode']}",
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
                                          subtitle: "${item.values.elementAt(index)['issue_date']}",
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
                                          subtitle: "${item.values.elementAt(index)['healthcode']}",
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
                                          subtitle: "${item.values.elementAt(index)['effective_date']}",
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
                                          subtitle: "${item.values.elementAt(index)['gender']}",
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
                                          subtitle: "${item.values.elementAt(index)['age']}",
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
                                                  subtitle: "${item.values.elementAt(index)['dob']}",
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
                                              subtitle: "${item.values.elementAt(index)['relation']}",
                                              weight: FontWeight.bold,
                                              size: 17),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Multi(
                                                  color: Colors.white,
                                                  subtitle: "${item.values.elementAt(index)['name']}",
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
