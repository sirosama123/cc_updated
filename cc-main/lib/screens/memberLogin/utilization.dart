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
import 'indvUtilization.dart';


class Utilization extends StatelessWidget {
  var utilizedHistory;
  String? pcode;
  double? totalAmount;
  double? totalUtilized;
  var planData;
  Utilization({super.key,required this.pcode,required this.totalAmount,required this.planData,required this.totalUtilized,required this.utilizedHistory});

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: Multi3(color: Color(0xff2b578e), subtitle: "Family Statistics", weight: FontWeight.bold, size: 14),
                ),
                SizedBox(height: 5.h,),
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
                           Multi3(color: Colors.white, subtitle: "Plan Code", weight: FontWeight.bold, size: 16),
                              SizedBox(width: 2.w,),
                              Multi3(color: Colors.white, subtitle:"${pcode}", weight: FontWeight.bold, size: 16),
                            ],
                          ),
                          Divider(color: Colors.white,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding:  EdgeInsets.only(left: 8.w),
                                  child: smallDBsquare2(
                                    mainhead: "Limit", 
                                    counts: double.parse(planData[0]['outPatient'].toString()), 
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
                                    counts: totalUtilized!, 
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
                                    counts: double.parse(planData[0]['outPatient'].toString())-totalUtilized!, 
                                    bgColor: Colors.white, 
                                    height: 45.h, 
                                    width: 100.w,countC: Color(0xff2b578e), icolor: Color(0xff2b578e), tcolor: Color(0xff2b578e),
                                    ),
                                )),
                            ],
                          ),
          
          
          
                  
          
          
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Container(),
                    //            NeumorphicButton(
                
                    // margin: EdgeInsets.only(top: 12),
                    // onPressed: () {
                      
                    //     Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => ClaimDetails(
                    //                     claim_no: claimdata[index]['claim_no'].toString(), 
                    //                     claim_status: claimdata[index]['claim_status'].toString(), 
                    //                     deduction: claimdata[index]['remarks'].toString(), 
                    //                     diagnosis: claimdata[index]['diagnosis'].toString(),
                    //                      outPatient: claimdata[index]['patient_name'].toString(), 
                    //                      patient_name: claimdata[index]['patient_name'].toString(), 
                    //                      provider_detail: claimdata[index]['provider'].toString(), 
                    //                      relation: claimdata[index]['relation'].toString(), 
                    //                     service_code: claimdata[index]['service_code'].toString(), 
                    //                     amount_paid:  claimdata[index]['amount_paid'].toString(), 
                    //                     claim_amount:  claimdata[index]['claim_amount'].toString(), 
                    //                     claim_recieved_date: claimdata[index]['claim_recieved_date'].toString(), 
                    //                     date_of_claim_paid:  claimdata[index]['date_claim_paid'].toString(), 
                    //                     date_of_treatment:  claimdata[index]['date_treatment'].toString(), 
                    //                     payable_amount:  claimdata[index]['payable_amount'].toString(),
                    //                     )));
                    // },
                    // style: NeumorphicStyle(
                    //   shadowLightColor: Colors.blue,
                    //   shape: NeumorphicShape.flat,
                    //   boxShape:
                    //       NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                    //   //border: NeumorphicBorder()
                    // ),
                    // padding:  EdgeInsets.all(6.0),
                    // child: Multi3(color: Color(0xff2b578e), subtitle: "Details", weight: FontWeight.bold, size: 12)
                    // ),
                    //         ],
                    //       ),
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
                ),
                SizedBox(height: 10.h,),
                  Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: Multi3(color: Color(0xff2b578e), subtitle: "Individual Statistics", weight: FontWeight.bold, size: 14),
                ),
                SizedBox(height: 8.h,),
                ListView.builder(
                  shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: int.parse(utilizedHistory.length.toString()),
                  itemBuilder: (BuildContext context, int index){
                      final item = utilizedHistory[index];
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                           Multi3(color: Colors.white, subtitle: "Name", weight: FontWeight.bold, size: 16),
                              SizedBox(width: 2.w,),
                              Multi3(color: Colors.white, subtitle:item.name, weight: FontWeight.bold, size: 16),
                            ],
                          ),
                          Divider(color: Colors.white,),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Expanded(
                          //       flex: 3,
                          //       child: Padding(
                          //         padding:  EdgeInsets.only(left: 8.w),
                          //         child: smallDBsquare2(
                          //           mainhead: "Limit", 
                          //           counts: double.parse(planData[0]['outPatient'].toString()), 
                          //           bgColor: Colors.white, 
                          //           height: 45.h, 
                          //           width: 100.w, countC: Color(0xff2b578e), icolor: Color(0xff2b578e), tcolor: Color(0xff2b578e),
                          //           ),
                          //       )),
                          //     Expanded(
                          //       flex: 3,
                          //       child: Padding(
                          //         padding:  EdgeInsets.all(4),
                          //         child: smallDBsquare2(
                          //           mainhead: "Utilized", 
                          //           counts: double.parse(item.amount.toString()), 
                          //           bgColor: Colors.white, 
                          //           height: 45.h, 
                          //           width: 100.w,countC: Color(0xff2b578e), icolor: Color(0xff2b578e), tcolor: Color(0xff2b578e),
                          //           ),
                          //       )),
                          //      Expanded(
                          //       flex: 3,
                          //       child: Padding(
                          //         padding:  EdgeInsets.only(right: 8.w),
                          //         child: smallDBsquare2(
                          //           mainhead: "Balance", 
                          //           counts: double.parse(planData[0]['outPatient'].toString())-totalUtilized!, 
                          //           bgColor: Colors.white, 
                          //           height: 45.h, 
                          //           width: 100.w,countC: Color(0xff2b578e), icolor: Color(0xff2b578e), tcolor: Color(0xff2b578e),
                          //           ),
                          //       )),
                          //   ],
                          // ),
          
          
                          
            
                    SizedBox(height: 10.h,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                           Multi3(color: Colors.white, subtitle: "Relation", weight: FontWeight.bold, size: 16),
                              SizedBox(width: 2.w,),
                              Multi3(color: Colors.white, subtitle:item.relation, weight: FontWeight.bold, size: 16),
                            ],
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                           Multi3(color: Colors.white, subtitle: "Gender", weight: FontWeight.bold, size: 16),
                              SizedBox(width: 2.w,),
                              Multi3(color: Colors.white, subtitle:item.gender, weight: FontWeight.bold, size: 16),
                            ],
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                           Multi3(color: Colors.white, subtitle: "Utilized Amount", weight: FontWeight.bold, size: 16),
                              SizedBox(width: 2.w,),
                              Multi3(color: Colors.white, subtitle:item.amount.toString(), weight: FontWeight.bold, size: 16),
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
                                      builder: (context) => IndividualUtilization(
                                        name: item.name, 
                                        amount: item.amount, 
                                        gender: item.gender, 
                                        maternity: "covered", 
                                        outPatient: double.parse(planData[0]['outPatient'].toString()),
                                        pcode: pcode,
                                        relation:item.relation, 
                                        roomRent: "roomRent", sum: totalAmount,
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
                    child: Multi3(color: Color(0xff2b578e), subtitle: "Details", weight: FontWeight.bold, size: 12)
                    ),
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
                            ),
                );
                  }),
                SizedBox(height: 10.h,),
                 Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: Multi3(color: Color(0xff2b578e), subtitle: "Visual View", weight: FontWeight.bold, size: 14),
                ),
                  Padding(
                    padding:EdgeInsets.all(8.0),
                    child: Container(
                        child: SfCartesianChart(
                                            
                            primaryXAxis: CategoryAxis(
                            
                            ),
                            // tooltipBehavior: _tooltipBehavior,
                           
                            series: <CartesianSeries>[
                              
                                ColumnSeries<info3, String>(
                                  animationDuration: 2000,
                                  enableTooltip: true, 
                                    dataSource: utilizedHistory,
                                    xValueMapper: (info3 data, _) => data.name,
                                    yValueMapper: (info3 data, _) => data.amount,
                                    width: 0.2, 
                                    spacing: 0.1 ,
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    xAxisName: "Service",
                                    color: Color(0xff2b578e),
                                    
                                )
                            ]
                        )
                    ),
                  )   ,
          
               
                     SizedBox(height: 5.h,),
              ],
            ),
          ),
    );
  }
}
