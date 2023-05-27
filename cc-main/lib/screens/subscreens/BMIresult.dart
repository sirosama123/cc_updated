import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/firstLanding.dart';
import 'package:project1/screens/subscreens/subscreenWidgets/legends1.dart';
import 'package:project1/widgets/Wlinks.dart';
import 'package:project1/widgets/heading1.dart';
import 'package:project1/widgets/heading3White.dart';
import 'package:project1/widgets/lightHeading.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../widgets/WextraHeading1.dart';
import '../../widgets/heading2.dart';

class BMIresult extends StatefulWidget {
  const BMIresult({super.key});

  @override
  State<BMIresult> createState() => _BMIresultState();
}

class _BMIresultState extends State<BMIresult> {
  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
            home: Scaffold(
                appBar: AppBar(
              backgroundColor: const Color(0xff2b578e),
              title: const Text("BMI Result"),
                leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop()
            ), 
          ),
                body: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 15.w),
                        child: Column(
                          children: [
                            SizedBox(height: 20.h,),
                            Container(
                                child: Container(
                                  width: double.infinity,
                                  height: 200.h,
                                  decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                 boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffA4A4A4),
                                    blurRadius: 6.0.r,
                                    spreadRadius: 1.0.r,
                                    offset: Offset(0.0, 0.0),
                                    // Shadow position
                                  ),
                                ],
                              ),
                                  child: SfRadialGauge(
                                      axes: <RadialAxis>[
                                          RadialAxis(minimum: 0,maximum: 50,
                                          ranges: <GaugeRange>[
                                              GaugeRange(startValue: 0,endValue: 18.5,color: Colors.lightBlue,startWidth: 10,endWidth: 10),
                                              GaugeRange(startValue: 18.5,endValue: 24.9,color: Colors.green,startWidth: 10,endWidth: 10),
                                              GaugeRange(startValue: 25,endValue: 29.9,color: Colors.amber,startWidth: 10,endWidth: 10),
                                              GaugeRange(startValue: 30,endValue: 40,color: Colors.red,startWidth: 10,endWidth: 10),
                                              GaugeRange(startValue: 40,endValue: 50,color: Colors.purple,startWidth: 10,endWidth: 10),],
                                              pointers: <GaugePointer>[NeedlePointer(value:Provider11.bmi!.toDouble())],
                                        
                                          )]
                                      ),
                                )
                                ),
                             SizedBox(height: 20.h,),   
                             Padding(
                               padding:  EdgeInsets.symmetric(horizontal: 20.w),
                               child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                           Row(
                                            children: [                                                                      
                                            Legends1(col: Colors.lightBlue),                                           
                                            LightHeading3(head: "underweight"),                                                                                                                          
                                            ],
                                           ),                                 
                                           Row(
                                            children: [
                                            Legends1(col: Colors.green),                                         
                                            LightHeading3(head: "healthy"),                                                                                 
                                            ],
                                           )                                  
                                      ],
                                    ),
                                    SizedBox(height: 10.h,),
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                          Row(
                                            children: [
                                          Legends1(col: Colors.yellow),                    
                                          LightHeading3(head: "overweight"),                                      
                                            ],
                                          ),
                                          Row(
                                            children: [                                       
                                          Legends1(col: Colors.red),                    
                                          LightHeading3(head: "obese"),
                                          SizedBox(width: 9.w,),                                     
                                            ],
                                          )
                                         ],
                                       ),
                        
                                    SizedBox(height: 10.h,),
                                      Row(
                                        children: [
                                          Row(children: [
                                          Legends1(col: Colors.purple),                                    
                                          LightHeading3(head: "extreme obesity"),                  
                                          ],)
                                        ],
                                      )                               
                                  ],
                                ),
                               ),
                             )  ,
                        SizedBox(height: 20.h,),     
                        Container(
                              width: double.infinity,
                              height: 90.h,
                              decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xffA4A4A4),
                                  blurRadius: 6.0.r,
                                  spreadRadius: 1.0.r,
                                  offset: const Offset(0.0, 0.0),
                                  // Shadow position
                                ),
                              ],
                                  ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Heading1(head: "YOUR BMI"),
                                    SizedBox(height: 5.h,),
                                    Text(Provider11.bmi!.toStringAsFixed(3).toString(),
                                                          style: TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:FontWeight.bold,
                                                            color: Provider11.bmi!>0 && Provider11.bmi!<=18.5?Colors.lightBlue:(Provider11.bmi!>18.5 && Provider11.bmi!<=24.9)?Colors.green:(Provider11.bmi!>24.9 && Provider11.bmi!<=29.9)?Colors.amber:(Provider11.bmi!>29.9 && Provider11.bmi!<=40)?Colors.red:(Provider11.bmi!>40)?Colors.purple:Colors.deepOrange
                                                            ))
                                  ],
                                          ),
                             ) ,
                          SizedBox(height: 20.h,),       
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Container(
                              height: 100.h,
                              width:100.w ,
                              decoration: BoxDecoration(
                                color: Color(0xff2b578e),
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffA4A4A4),
                                    blurRadius: 6.0.r,
                                    spreadRadius: 1.0.r,
                                    offset: const Offset(0.0, 0.0),
                                  ),
                                ],         
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  WHeading3(head: "Age"),
                                  SizedBox(height: 3.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      WEHeading1(head: "${Provider11.bmiAge}",color: Colors.white,),
                                      WLinks(head: "yrs", color: Colors.white)
                                    ],
                                  )
                                ],
                              ),
                             ),
                             Container(
                              height: 100.h,
                              width:100.w ,
                              decoration: BoxDecoration(
                                color: Color(0xff2b578e),
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffA4A4A4),
                                    blurRadius: 6.0.r,
                                    spreadRadius: 1.0.r,
                                    offset: const Offset(0.0, 0.0),
                                    // Shadow position
                                  ),
                                ],         
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  WHeading3(head: "Height"),
                                  SizedBox(height: 3.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      WEHeading1(head: "${Provider11.hei_ft!.toStringAsFixed(2).toString()}",color: Colors.white,),
                                      WLinks(head: "ft", color: Colors.white)
                                    ],
                                  )
                                ],
                              ),
                             ),
                             Container(
                              height: 100.h,
                              width:100.w ,
                              decoration: BoxDecoration(
                                color: Color(0xff2b578e),
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffA4A4A4),
                                    blurRadius: 6.0.r,
                                    spreadRadius: 1.0.r,
                                    offset: const Offset(0.0, 0.0),
                                    // Shadow position
                                  ),
                                ],         
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  WHeading3(head: "Weight"),
                                  SizedBox(height: 3.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      WEHeading1(head: "${Provider11.finalWeight_kg}",color: Colors.white,),
                                      WLinks(head: "Kg", color: Colors.white)
                                    ],
                                  )
                                ],
                              ),
                             )
                              ],
                             ),
                             SizedBox(height: 20.h,),     
                        Container(
                              width: double.infinity,
                              height: 90.h,
                             decoration: BoxDecoration(
                                color: Color(0xff2b578e),
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffA4A4A4),
                                    blurRadius: 6.0.r,
                                    spreadRadius: 1.0.r,
                                    offset: const Offset(0.0, 0.0),
                                    // Shadow position
                                  ),
                                ],         
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    WHeading3(head: "ESTIMATED WEIGHT SHOULD BE"),
                                    SizedBox(height: 5.h,),
                                    WEHeading1(head:"${Provider11.estWeight!.toStringAsFixed(3).toString()} Kg",color: Colors.white,
                                                         )
                                  ],
                                          ),
                             ) ,
                             SizedBox(height: 20.h,),
                          ],
                        ),
                      ),
                    )
                    )
                )
            );
  }
}