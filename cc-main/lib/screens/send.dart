import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/aboutus.dart';
import 'package:project1/screens/dashboard.dart';
import 'package:project1/screens/firstLanding.dart';
import 'package:project1/screens/splashScreen.dart';
import 'package:project1/screens/subscreens/selectionCity.dart';
import 'package:project1/screens/testing1.dart';
import 'package:project1/widgets/notificationContainer.dart';
import 'package:provider/provider.dart';



class Send extends StatefulWidget {
  const Send({super.key});

  @override
  State<Send> createState() => _SendState();
}

class _SendState extends State<Send> {

  @override
  Widget build(BuildContext context) {
   
     return MaterialApp(
      home:Scaffold(appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
            
            ],
          ),
        ),
      ))
    );
  }
}