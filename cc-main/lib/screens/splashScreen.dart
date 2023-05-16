import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/initialScreen.dart';
import 'package:project1/screens/login.dart';
import 'package:project1/widgets/boldHeading1.dart';
import 'package:project1/widgets/heading1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
          ()=>Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                (context) => 
                InitialScreen()
                )
              )
    );
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(   
        image: DecorationImage(  
          image:  ExactAssetImage('assets/images/o.jpg'),
          fit:BoxFit.cover,
          colorFilter: new ColorFilter.mode(Colors.white.withOpacity(0.2), BlendMode.dstATop),
        ),
        
      ),
      child: 
      
      
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Container(
                  width: 300.00,
                  height: 300.00,
                  decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: ExactAssetImage('assets/images/logo.png'),
                      ),
            )
            ),
          SizedBox(height: 20.h,),
          Heading1(head: "Crescent Care"),
          SizedBox(height: 2.h,),
          BHeading1(head: "SMART APP",color: Color(0xffE13C25),)
        ],
      ),
    ),
    );
  }
}