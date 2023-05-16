import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project1/screens/firstLanding.dart';
import 'package:project1/screens/login.dart';
import 'package:project1/widgets/divide.dart';
import 'package:project1/widgets/forgotLink.dart';
import 'package:project1/widgets/heading2.dart';
import 'package:project1/widgets/or.dart';
import 'package:project1/widgets/square_head.dart';


class ForgotPass extends StatefulWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  late bool _passwordVisible;

   void initState() {
    _passwordVisible = false;
    }
  @override

  bool _showPassword = false;
  Widget build(BuildContext context) {
    
    TextEditingController PasswordController = TextEditingController();
    TextEditingController EmailController = TextEditingController();

    void Reset() async{
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;
      try {
        await auth.sendPasswordResetEmail(email: EmailController.text.trim());
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Alert!!"),
            content: new Text("Check Your Email and Reset Password"),
            actions: <Widget>[
              new ElevatedButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              ),
            ],
          );
        },
      );
      } on FirebaseAuthException  catch (e) {
         Fluttertoast.showToast(
        msg: "$e",
        toastLength: Toast.LENGTH_SHORT,
      );
      }
    }


   var obsText = true;


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
         
        
        child: Scaffold(   
          body: Container(
            decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("assets/images/bg.jpg"),
              fit: BoxFit.cover,
          )
          ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Center(
                
                child: Container(
                 
                  
        child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Container(
                    height: 100.h,
                    width: 100.w,
                   decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("assets/images/logo.png"),
                fit: BoxFit.cover,
            )
            ),
                  ),
                  Heading2(head: "Crescent Care Pvt.ltd"),
                  SizedBox(height: 80.h,),
                  Container(
                    padding: EdgeInsets.fromLTRB(20,2,10,2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                       borderRadius: BorderRadius.circular(30),
                       border: Border.all(color: Color(0xff164584))
                    ),
                    child: TextFormField(
        
                      decoration: InputDecoration(
                        focusColor: Color(0xff164584),
                        border: InputBorder.none,
                        labelText: "Email",
                        hintText: "abc@xyz.com",
                        labelStyle: TextStyle(
                          color: Color(0xff164584)
                        )
                      ),
                      controller:EmailController ,
                      
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Container(
                      height: 50,
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff164584),
                            shape: RoundedRectangleBorder(                       
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        child:  TitleHeading(head: 'Reset',),
                        onPressed: () {
                            Reset();
                        },
                      )
                  ),  
                  SizedBox(height: 50.h,),  
                  ],
                ),
        ),
    ),
              ),
    
            ),
          ),
        ),
      ),
    );
  }
}
