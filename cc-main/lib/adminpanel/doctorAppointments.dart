import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/adminpanel/AdminDashboard.dart';
import 'package:project1/adminpanel/adminFirstLanding.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/subscreens/subscreenWidgets/TTB.dart';
import 'package:project1/widgets/NHD.dart';
import 'package:project1/widgets/heading3B.dart';
import 'package:project1/widgets/chead2.dart';
import 'package:project1/widgets/toosmall.dart';
import 'package:project1/widgets/unread.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../widgets/blueLabels.dart';
import '../../widgets/boldHeading4.dart';
import '../widgets/NotificatioHead.dart';
import '../widgets/multi3.dart';
import 'appointmentViewadmin.dart';















class DoctorAppointmentsAdminPanel extends StatefulWidget {
  const DoctorAppointmentsAdminPanel({super.key});

  @override
  State<DoctorAppointmentsAdminPanel> createState() => _DoctorAppointmentsAdminPanelState();
}

class _DoctorAppointmentsAdminPanelState extends State<DoctorAppointmentsAdminPanel> {
  late TooltipBehavior _tooltipBehavior;
      void initState() {
    _tooltipBehavior = TooltipBehavior(
                enable: true,               
              );
    
     super.initState();
    
    BackButtonInterceptor.add(myInterceptor);
    } 
  @override
   
   

  @override
  void dispose() {
    
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.of(context).pop();
    return true;
  }
  bool load = false;
    @override
  
  @override
 Widget build(BuildContext context) {
    final Stream<QuerySnapshot> admin_appointments = FirebaseFirestore.instance.collection('appointments_admin').snapshots();
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: Scaffold(
            body:StreamBuilder<QuerySnapshot>(
        stream: admin_appointments,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
    
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
    
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return Container(
        // height:180.h,
        child: Padding(
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
                           Multi3(color: Colors.white, subtitle: data['name'], weight: FontWeight.bold, size: 16),
                             
                            ],
                          ),
                          Divider(color: Colors.white,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                           Multi3(color: Colors.white, subtitle: "Hospital Name", weight: FontWeight.bold, size: 12),
                              SizedBox(width: 5.w,),
                              Multi3(color: Colors.white, subtitle:data['hsptlName'], weight: FontWeight.bold, size: 12),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                           Multi3(color: Colors.white, subtitle: "Doctor Name", weight: FontWeight.bold, size: 12),
                              SizedBox(width: 5.w,),
                              Multi3(color: Colors.white, subtitle:data['DoctorName'], weight: FontWeight.bold, size: 12),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                           Multi3(color: Colors.white, subtitle: "Date of appointment", weight: FontWeight.bold, size: 12),
                              SizedBox(width: 5.w,),
                              Multi3(color: Colors.white, subtitle:data['appointment_date'], weight: FontWeight.bold, size: 12),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                           Multi3(color: Colors.white, subtitle: "Status", weight: FontWeight.bold, size: 12),
                              SizedBox(width: 5.w,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: data['status']=="confirmed"?Colors.green:data['status']=="pending"?Colors.orange:Colors.red
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.all(5),
                                  child: Multi3(color: Colors.white, subtitle:data['status']=="cancelled"?"Cancelled":data['status']=="pending"?"Pending":"Confirmed", weight: FontWeight.bold, size: 12),
                                )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            
                    NeumorphicButton(
                
                    margin: EdgeInsets.only(top: 12),
                    onPressed: () {
                     final confirm = FirebaseFirestore.instance.collection('appointments_admin').doc(document.id);
                      confirm.update({
                        "status":"confirmed"
                      });
                       final confirm1 = FirebaseFirestore.instance.collection('appointments').doc(data['user_uid']).collection("data").doc(data['doc_uid']);
                      confirm1.update({
                        "status":"confirmed"
                      });
                    },
                    style: NeumorphicStyle(
                      shadowLightColor: Colors.green,
                      color: Colors.green,
                      shape: NeumorphicShape.flat,
                      boxShape:
                          NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                      //border: NeumorphicBorder()
                    ),
                    padding:  EdgeInsets.all(6.0),
                    child: Multi3(color: Colors.white, subtitle: "Confirm", weight: FontWeight.bold, size: 12)
                    ),
                    SizedBox(width: 5.w,),
                           NeumorphicButton(
                
                    margin: EdgeInsets.only(top: 12),
                    onPressed: () {
                       final cancell = FirebaseFirestore.instance.collection('appointments_admin').doc(document.id);
                      cancell.update({
                        "status":"cancelled"
                      });
                       final cancell1 = FirebaseFirestore.instance.collection('appointments').doc(data['user_uid']).collection("data").doc(data['doc_uid']);
                      cancell1.update({
                        "status":"cancelled"
                      });
                       
                    },
                    style: NeumorphicStyle(
                      shadowLightColor: Colors.red,
                      color: Colors.red,
                      shape: NeumorphicShape.flat,
                      boxShape:
                          NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                      //border: NeumorphicBorder()
                    ),
                    padding:  EdgeInsets.all(6.0),
                    child: Multi3(color: Colors.white, subtitle: "Cancel ", weight: FontWeight.bold, size: 12)
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
                ),
      );
            }).toList(),
          );
        },
      ) ,
      ),
    );
  }

}