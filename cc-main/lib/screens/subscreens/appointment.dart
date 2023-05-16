import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/heading3B.dart';


class ComingSoon extends StatelessWidget {
  String PageName;
    ComingSoon({super.key,required this.PageName});

  @override
  Widget build(BuildContext context) {
    var size,height,width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
         appBar: AppBar(
          backgroundColor: Color(0xff2b578e),
            title: Text("${PageName}"),
              leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ), 
          ),
          body: Stack
          (  
            children: [

              Container(
                width: double.infinity,
                height: 500.h,
                child: Image.asset("assets/images/doctor2.jpg",fit: BoxFit.fill,)),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
        width: double.infinity,
        height: height<481?100.h:180.h,
        decoration:BoxDecoration(
             boxShadow: [
                BoxShadow(
                  color: Color(0xffA4A4A4),
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                  offset: Offset(0.0, 0.0),
                  // Shadow position
                ),
              ],
          color: Color(0xff164584),
           borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 35.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Container(
            height: 60.h,
            width: double.infinity,
            decoration: BoxDecoration(
             color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(25.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                )
              ]
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: BHeading3(head: "Coming Soon...")
              ),
            ),
          ),
             
            ],
          ),
        )
         ),
              )
              
            ],
          ),
      ),
    );
  }
}