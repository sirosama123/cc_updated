import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/editProfile.dart';
import 'package:project1/screens/landingpage.dart';
import 'package:project1/screens/outPatient.dart';
import 'package:project1/screens/patientServices.dart';
import 'package:project1/widgets/heading3.dart';
import 'package:project1/widgets/heading3B.dart';
import 'package:project1/widgets/labels.dart';
import 'package:project1/widgets/slider.dart';
import 'package:project1/widgets/squares.dart';
import 'package:provider/provider.dart';

import '../widgets/square_head.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color(0xff2b578e),
            title: Text("My Profile"),
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () async{                                 
                  Navigator.of(context).pop();                     
                })
            
          ), 
      body: ListView(
        children: [
          Container(
            height: 200.h,
            width: double.infinity,
             color: Color(0xffafc4dd),
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 75,
                  backgroundColor: Color.fromARGB(255, 150, 1, 115),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Color(0xff164584),
                    backgroundImage:NetworkImage(Provider11.ProfileImagePath.toString()),
                  ),
                ),
                SizedBox(height: 7.h,),
                BHeading3(head: '${Provider11.first}'+  " " + '${Provider11.last}')
              ],
             ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Padding(
                padding:  EdgeInsets.only(top: 5.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Labelss(lab: "Full Name"),
                          SizedBox(height: 5.h,),
                          TextField(
                            enabled: false, 
                            decoration: new InputDecoration(
                                hintText: '${Provider11.first}'+  " " + '${Provider11.last}',
                                hintStyle: TextStyle(fontSize: 15.sp, color: Colors.black,letterSpacing: 0.7),
                                suffixIcon: Icon(Icons.person,color: Color(0xff164584),)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Labelss(lab: "Email address"),
                          SizedBox(height: 5.h,),
                          TextField(
                            enabled: false, 
                            decoration: new InputDecoration(
                                hintText: '${Provider11.email}',
                                hintStyle: TextStyle(fontSize: 15.sp, color: Colors.black,letterSpacing: 0.7),
                                suffixIcon: Icon(Icons.mail_outline,color: Color(0xff164584),)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Labelss(lab: "Mobile No."),
                          SizedBox(height: 5.h,),
                          TextField(
                            enabled: false, 
                            decoration: new InputDecoration(
                                hintText: '${Provider11.number}',
                                hintStyle: TextStyle(fontSize: 15.sp, color: Colors.black,letterSpacing: 0.7),
                                suffixIcon: Icon(Icons.phone,color: Color(0xff164584),)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Labelss(lab: "Gender"),
                          SizedBox(height: 5.h,),
                          TextField(
                            enabled: false, 
                            decoration: new InputDecoration(
                                hintText: '${Provider11.gen}',
                                hintStyle: TextStyle(fontSize: 15.sp, color: Colors.black,letterSpacing: 0.7),
                                suffixIcon: Icon(Icons.male,color: Color(0xff164584),)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h,),
                      Container(
                              
                                height: 50,
                                width: double.infinity,
                                padding: EdgeInsets.fromLTRB(50,2,50,2),
                                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff164584),
                      shape: RoundedRectangleBorder(                       
                        borderRadius: BorderRadius.circular(20), // <-- Radius
                      ),
                    ),
                  child:  TitleHeading(head: 'Edit',),
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfile()),);
                  },
                                )
                            ),       
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


