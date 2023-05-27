import 'dart:io';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:project1/main.dart';
import 'package:project1/screens/aboutus.dart';
import 'package:project1/screens/dashboard.dart';
import 'package:project1/screens/dashboardDrawer.dart';
import 'package:project1/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/history.dart';
import 'package:project1/screens/landingpage.dart';
import 'package:project1/screens/notification.dart';
import 'package:project1/screens/profile.dart';
import 'package:project1/screens/subscreens/appointment.dart';
import 'package:project1/screens/subscreens/doctoronline.dart';
import 'package:project1/screens/subscreens/labPrescription.dart';
import 'package:project1/screens/subscreens/prescription.dart';
import 'package:project1/screens/subscreens/selectionCity.dart';
import 'package:project1/widgets/heading3.dart';
import 'package:project1/widgets/links.dart';
import 'package:project1/widgets/square_head.dart';
import 'package:provider/provider.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:url_launcher/url_launcher.dart' ;

import '../../widgets/multi3.dart';
import '../widgets/appointmentView.dart';


class AppointList extends StatelessWidget {
  const AppointList({super.key});

  @override
  Widget build(BuildContext context) {
     final Provider11 = Provider.of<Provider1>(context); 
    final Stream<QuerySnapshot> abc = FirebaseFirestore.instance.collection('appointments').doc(Provider11.uuid).collection("data").snapshots();

    return Scaffold(
       appBar: AppBar(
          backgroundColor: Color(0xff2b578e),
          title: Text("Appointment Lists"),
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
      body:StreamBuilder<QuerySnapshot>(
      stream: abc,
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
      height: data['status']=="confirmed"?180.h:150.h,
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
                                color: data['status']=="confirmed"?Colors.green:data['status']=="pending"?Colors.orange:Colors.green
                              ),
                              child: Padding(
                                padding:  EdgeInsets.all(5),
                                child: Multi3(color: Colors.white, subtitle:data['status'], weight: FontWeight.bold, size: 12),
                              )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                           data['status']=="confirmed"?  NeumorphicButton(
              
                  margin: EdgeInsets.only(top: 12),
                  onPressed: () {
                     
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
                  ):Container(),
                  Container(),
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
            
            
            // AppointmentVeiw(
            //   pname: data['name'], 
            //   hname: data['hsptlName'], 
            //   doa: data['appointment_date'], 
            //   status: data['status'], dname: data['DoctorName'],);
          }).toList(),
        );
      },
    )
      
      
       
    );
  }
}