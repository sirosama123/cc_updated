import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/adminpanel/adminLogin.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/aboutus.dart';
import 'package:project1/screens/firstLanding.dart';
import 'package:project1/screens/login.dart';
import 'package:project1/screens/send.dart';
import 'package:project1/screens/splashScreen.dart';
import 'package:project1/screens/subscreens/appointment.dart';
import 'package:project1/screens/subscreens/push.dart';
import 'package:provider/provider.dart';

import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/firstLanding.dart';
import 'package:project1/screens/forgot.dart';
import 'package:project1/screens/signup.dart';
import 'package:project1/widgets/divide.dart';
import 'package:project1/widgets/forgotLink.dart';
import 'package:project1/widgets/heading2.dart';
import 'package:project1/widgets/or.dart';
import 'package:project1/widgets/square_head.dart';
import 'package:provider/provider.dart';


class InitialScreen extends StatefulWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  Widget build(BuildContext context) {
  return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(  
        
        body: Container(
        height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5],
          colors: [
            Color(0xff164584),
            Color.fromARGB(255, 64, 119, 187)
          ],
        ),
      ),
          child: Stack(  
            
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                   Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: Container(
                  height: 250.h,
                  width: double.infinity,
                  decoration: BoxDecoration(  
                     
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(180),bottomRight: Radius.circular(180))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150.h,
                        width: 150.w,
                        decoration: new BoxDecoration(
                        image: new DecorationImage(
                        image: new AssetImage("assets/images/logo.png",),
                        
                )
                ),
                          ),
                          Heading2(head: "Crescent Care Pvt Ltd"),
                    ],
                  ),             
                  ),
              ),
                  Container(
                margin:  EdgeInsets.symmetric(horizontal: 20.w),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Container(
                                height: 50,
                                width: double.infinity,
                                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child:  ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    // backgroundColor: Color(0xff164584),
                                    backgroundColor: Color(0xff174584),
                                      shape: RoundedRectangleBorder(                       
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  child:  TitleHeading(head: 'Proceed As User',),
                                  onPressed: () {
                                    Navigator.push(context,
                                      MaterialPageRoute(builder:
                                        (context) => 
                                        Login()
                                        )
                                      );
                                  },
                                )
                            ),
                    SizedBox(height: 20.h,),
                    Container(
                                height: 50,
                                width: double.infinity,
                                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child:  ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    // backgroundColor: Color(0xff164584),
                                    backgroundColor: Color(0xff174584),
                                      shape: RoundedRectangleBorder(                       
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  child:  TitleHeading(head: 'Proceed As Admin',),
                                  onPressed: () {
                                    Navigator.push(context,
                                      MaterialPageRoute(builder:
                                        (context) => 
                                        AdminLogin()
                                        )
                                      );
                                  },
                                )
                            )                
                  ],
                ),
              ),
             
                ],
              ),
            )
          ],
      ),
        ),
      )
    );
  }
}





