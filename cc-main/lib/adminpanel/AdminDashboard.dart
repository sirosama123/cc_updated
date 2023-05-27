import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project1/adminpanel/AdminMedicineOrderDetails.dart';
import 'package:project1/adminpanel/adminLabOrderDetails.dart';
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
import 'package:toggle_switch/toggle_switch.dart';

import 'appointmentViewadmin.dart';
import 'doctorAppointments.dart';

class AdminDashboard extends StatefulWidget {
  late int count;
   AdminDashboard({super.key,required this.count});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  var size,height,width;
  late TooltipBehavior _tooltipBehavior;

    @override
    void initState() {
    _tooltipBehavior = TooltipBehavior(
                enable: true,
                // Templating the tooltip
               
              );
    super.initState();
    } 
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
  final Provider11 = Provider.of<Provider1>(context); 
     final List<ChartData> chartData = [
            ChartData('Medicine\nOnline', Provider11.med_dates.length.toDouble(), Colors.orange),
            ChartData('laboratory\nTest Online', Provider11.lab_dates.length.toDouble(), Colors.red),
            ChartData('Doctor\nAppointment', 6, Colors.blue),
            ChartData('Online \n appointment', 7, Colors.purple)
        ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Color(0xff2b578e),
          body: Stack(
                      fit: StackFit.expand,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      
                      children: <Widget>[
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 15.w),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Color(0xff2b578e),
                            child: SingleChildScrollView(
                              child: Column(
                            
                                children: [
                                 SizedBox(height: 10.h,),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => Profile()));
                                    },
                                    child: Container(
                                      height: 60.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                                          radius: 28.r,
                                                          backgroundColor: Color.fromARGB(255, 150, 1, 115),
                                                          child: CircleAvatar(
                                                            radius: 25.r,
                                                            backgroundColor: Color(0xff164584),
                                                            backgroundImage:NetworkImage(Provider11.ProfileImagePath.toString())
                                                          ),
                                                        ),
                                                        SizedBox(width: 15.w,)  ,
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                           BHeading3(head: '${Provider11.first![0].toUpperCase()}${Provider11.first!.substring(1).toLowerCase()}'" " + '${Provider11.last![0].toUpperCase()}${Provider11.last!.substring(1).toLowerCase()}')
                                                            
                                                          ],
                                                        )  
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.h,),
                                  ToggleSwitch(
                                    minWidth: double.infinity,
                                    minHeight: 35.h,
                                    cornerRadius: 20.0,
                                    activeBgColors: [[Colors.white], [Colors.white]],
                                    activeFgColor: Colors.white,
                                    inactiveBgColor: Colors.grey,
                                    inactiveFgColor: Colors.white,
                                     customTextStyles: [
                                        
                                        TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600),
                                        TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                             fontWeight: FontWeight.w600)
                                      ],
                                    initialLabelIndex: 0,
                                    totalSwitches: 2,
                                    labels: ['Monthly', 'Yearly'],
                                    radiusStyle: true,
                                    onToggle: (index) {
                                      print('switched to: $index');
                                    },
                                  ),
                                  SizedBox(height:height<481?5.h:height<801?15.h:5.h),
                                  SingleChildScrollView(
                                    child:height>800? Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            GestureDetector(
                                              child: DBsquare( height: 100,width: 150,mainhead: "Medicine \nOrders", counts:  Provider11.med_dates.length.toDouble(), bgColor: Colors.orange),
                                              onTap: (){
                                                
                                                
                                                Provider11.med_detail.clear();
                                                Provider11.medicines.clear();
                                                Provider11.medDetail();
                                                Provider11.med();
                                               
                                                 Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => AdminMedicineOrderDetail()
                                                    ),
                                              );
                                              },
                                              ),
                                            GestureDetector(
                                              child: DBsquare(mainhead: "Laboratory\nOrders", counts: Provider11.lab_dates.length.toDouble(), bgColor: Colors.red, height: 100,width: 150,),
                                              onTap: (){
                                                 try {
                                                Provider11.lab_detail.clear();
                                                Provider11.labs.clear();
                                                Provider11.labDetail();
                                                Provider11.lab();
                                                  print(Provider11.lab_detail);
                                              
                                                   Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => AdminLabOrderDetail()
                                                    ),
                                              );
                                                 } catch (e) {
                                                   print("${e}error is here");
                                                 }
                                              },
                                              ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h,),
                                         Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ApointmentSizeWidget(),
                                            DBsquare(mainhead: "Online Doctor\nAppointment", counts: 7, bgColor: Colors.purple, height: 100,width: 150,),
                                          ],
                                        )
                                      ],
                                    ):Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          child: smallDBsquare(  height: 50,width: 75,mainhead: "Medicine \nOrders", counts:  Provider11.med_dates.length.toDouble(), bgColor: Colors.orange),
                                          onTap: (){
                                            
                                            
                                            Provider11.med_detail.clear();
                                            Provider11.medicines.clear();
                                            Provider11.medDetail();
                                            Provider11.med();
                                            if (Provider11.med_dates.length==0) {
                                                 Fluttertoast.showToast(
                                                      msg: "No Records of Online Medicine Orders",
                                                      toastLength: Toast.LENGTH_SHORT,
                                                  );
                                              } else {
                                                Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => AdminMedicineOrderDetail()
                                                ),
                                          );
                                              }
                                          },
                                          ),
                                        GestureDetector(
                                          child: smallDBsquare(mainhead: "Laboratory\nOrders", counts: Provider11.lab_dates.length.toDouble(), bgColor: Colors.red, height: 50,width: 75,),
                                          onTap: (){
                                              Provider11.lab_detail.clear();
                                              Provider11.labs.clear();
                                              Provider11.labDetail();
                                              Provider11.lab();
                                              
                                              
                                              if (Provider11.lab_dates.length==0) {
                                                 Fluttertoast.showToast(
                                                      msg: "No Records of Online Laboratory Orders",
                                                      toastLength: Toast.LENGTH_SHORT,
                                                  );
                                              } else {
                                                Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => AdminLabOrderDetail()
                                                ),
                                          );
                                              }
                                               
                                          },
                                          ),
                                        
                                         ApointmentSizeWidget2(),
                                         smallDBsquare(mainhead: "Online Doctor\nAppointment", counts: 7, bgColor: Colors.purple,  height: 50,width: 75,)
                                      ],
                                    )
                                    
                                  )
                                  
                                ],
                              ),
                            ),
                            
                          ),
                        ), //Container
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: height<481?Container():
                          height<801?Container(
                           
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                              child: Column(
                                children: [
                                  CHeading2(head: "Orders", color: Colors.black),
                                  SizedBox(height: 10.h,),
                                   Container(
                                    height: height/3.5,
                                      child: SfCartesianChart(
                                        
                        primaryXAxis: CategoryAxis(
                        
                        ),
                        tooltipBehavior: _tooltipBehavior,
                       
                        series: <CartesianSeries>[
                          
                            ColumnSeries<ChartData, String>(
                              animationDuration: 2000,
                              enableTooltip: true, 
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                // Map color for each data points from the data source
                                pointColorMapper: (ChartData data, _) => data.color,
                                width: 0.4, 
                                // Spacing between the bars
                                spacing: 0.3 ,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                xAxisName: "Service"
                                
                            )
                        ]
                    )
                                  )
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                               boxShadow: [
                                BoxShadow(
                                  color: Color(0xffA4A4A4),
                                  blurRadius: 6.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0.0, 0.0),
                                  // Shadow position
                                ),
                              ],
                               borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(60),
                                  topLeft: Radius.circular(60),
                                ),
                            ),

                            width: double.infinity,
                            height: height/2.5,
                            
                          ):
                          Container(
                           
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                              child: Column(
                                children: [
                                  CHeading2(head: "Orders", color: Colors.black),
                                  SizedBox(height: 10.h,),
                                   Container(
                                    height: height/4,
                                      child: SfCartesianChart(
                                        
                        primaryXAxis: CategoryAxis(
                        
                        ),
                        tooltipBehavior: _tooltipBehavior,
                       
                        series: <CartesianSeries>[
                          
                            ColumnSeries<ChartData, String>(
                              animationDuration: 2000,
                              enableTooltip: true, 
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                // Map color for each data points from the data source
                                pointColorMapper: (ChartData data, _) => data.color,
                                width: 0.4, 
                                // Spacing between the bars
                                spacing: 0.3 ,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                xAxisName: "Service"
                                
                            )
                        ]
                    )
                                  )
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                               boxShadow: [
                                BoxShadow(
                                  color: Color(0xffA4A4A4),
                                  blurRadius: 6.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0.0, 0.0),
                                  // Shadow position
                                ),
                              ],
                               borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(60),
                                  topLeft: Radius.circular(60),
                                ),
                            ),

                            width: double.infinity,
                            height: height/3,
                            
                          ),
                        ), //Container
                        
                      ], //<Widget>[]
                    ),
      ),
    );
  }
}


class ApointmentSizeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('appointments_admin')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData) {
          return Text('No data available');
        }

        int size = snapshot.data!.size;
        return GestureDetector(
          onTap: (){
            Navigator.push(context,
                       MaterialPageRoute(builder: (context) => DoctorAppointmentsAdminPanel()));
          },
          child: DBsquare(mainhead: "Doctor Appointments", counts: double.parse(size.toString()), bgColor: Colors.blue, height: 100,width: 150,));
      },
    );
  }
}

class ApointmentSizeWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('appointments_admin')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData) {
          return Text('No data available');
        }

        int size = snapshot.data!.size;
        return GestureDetector(
          onTap: (){
         Navigator.push(context,
         MaterialPageRoute(builder: (context) => DoctorAppointmentsAdminPanel()));
          },
          child: smallDBsquare(mainhead: "Doctor Appointments", counts: double.parse(size.toString()), bgColor: Colors.blue, height: 50,width: 70,));
      },
    );
  }
}



  class ChartData {
        ChartData(this.x, this.y, this.color);
            final String x;
            final double? y;
            final Color? color;
    }