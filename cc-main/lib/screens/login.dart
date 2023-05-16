import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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


class Login extends StatefulWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late bool _passwordVisible;

  List<Object> _userdata = [];

 List med_dates = [];

 List  uids = [];

  bool statee = true;
      late AndroidNotificationChannel channel;
    late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

    String? mtoken = " ";
    

   void initState() {
    FirebaseMessaging.instance.subscribeToTopic("Animal");
    _passwordVisible = false;
    }
  @override

  bool _showPassword = false;
  String? uuid;
  String? Lname;
  List productName =[];

  TextEditingController PasswordController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 

    getData() async{
  
   FirebaseFirestore.instance
    .collection('medicines')
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          if (uuid == doc["unique_id"].toString()) {
            Provider11.med_dates.add(doc["recieving_date"].toString().substring(0,11));
            Provider11.patient_names.add(doc["patient_name"].toString());
            Provider11.patients_age.add(doc["age"].toString());
            Provider11.prescription_url.add(doc["url"].toString());
            Provider11.status.add(doc["status"].toString());
            Provider11.uid_med.add(doc["uid"].toString());
          } 
          else{
            print("not matched");
          }
          print("date:${doc["recieving_date"].toString()} uuid:${uuid}   id:${doc["unique_id"]}");
        });
    });

    FirebaseFirestore.instance.collection("local_notifications").
    doc("${Provider11.uuid}").collection("data").orderBy("date").
    get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
        Provider11.notify_med.add(NotificationMed(
        doc["patient_name"],
        doc['age'],
        doc['url'],
        doc["order_date_time"].toString().substring(0,11),
        doc["order_date_time"].toString().substring(11,16),
        doc["type"],
        doc["recieving_date"].toString().substring(0,11),
          ));
        });
    });
   
    await Future.delayed(const Duration(seconds: 5));
    print("${Provider11.notify_med.length}==================>length");
  }

   getDataLab() async{
   FirebaseFirestore.instance
    .collection('labs')
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          if (uuid == doc["unique_id"].toString()) {
            Provider11.lab_dates.add(doc["recieving_date"].toString().substring(0,11));
            Provider11.patient_names_lab.add(doc["patient_name"].toString());
            Provider11.patients_age_lab.add(doc["age"].toString());
            Provider11.prescription_url_lab.add(doc["url"].toString());
            Provider11.status_lab.add(doc["status"].toString());
            Provider11.uid_lab.add(doc["uid"].toString());
          } 
          else{
            print("not matched");
          }
        });
    });
    await Future.delayed(const Duration(seconds: 5));
    print("${Provider11.status}statusss");
  }



    void Login() async{
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;

      final Future<FirebaseApp> _initialization = Firebase.initializeApp();
      try {
        EasyLoading.show(
                        status: 'loading...',
                        maskType: EasyLoadingMaskType.black,
                      );
        final UserCredential users = await auth.signInWithEmailAndPassword(
        email: EmailController.text, password: PasswordController.text);

        setState(() {
          uuid = users.user!.uid;
          Provider11.uuid = users.user!.uid;
          // statee = false;
        });

         var data = await FirebaseFirestore.instance.
          collection("users").
          doc(users.user!.uid). 
          get();
   
          setState(() {
            Provider11.first=data['firstname'];
            Provider11.last=data['lastname'];
            Provider11.email=data['email'];
            Provider11.uuid = data['uid'];
            Provider11.number = data['phone'];
            Provider11.gen = data['gender'];
            Provider11.ProfileImagePath = data['profile'];
            Provider11.number = data['phone'];
            Provider11.cnic = data['cnic'];
            Provider11.policy=data['policy'];
          });
          setState(() {
            // statee = true;
          });
          print(data['policy']);
         
          getData();
          getDataLab();
          Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => firstLanding(tab: 0,     
                  )
                  ),
            );
      EasyLoading.dismiss();
      } 
        on FirebaseAuthException catch(e) {
        print(e);
        EasyLoading.dismiss();
        Fluttertoast.showToast(
          msg: "${e.message}",
          toastLength: Toast.LENGTH_SHORT,
      );
      }
    }  
   var obsText = true;
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
                            SizedBox(height: 10.h,),
                            Container(
                              padding: EdgeInsets.fromLTRB(20,2,10,2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                 borderRadius: BorderRadius.circular(30),
                                 border: Border.all(color: Color(0xff164584))
                              ),
                              child: TextField(
                                controller: PasswordController,
                            obscureText: !this._showPassword,
                            decoration: InputDecoration(
                              
                      border: InputBorder.none,
                      labelText: 'Password',
                      labelStyle:const TextStyle(
                                    color: Color(0xff164584)
                                  ),
                      suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: this._showPassword ? Colors.blue : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() => this._showPassword = !this._showPassword);
                          },
                      ),
                            ),
                        )
                            ),
                      // Padding(
                      //   padding:  EdgeInsets.fromLTRB(200.w,5.h,10.w,10.h),
                      //   child: GestureDetector(child: ForgotLink(link: "forgot password?")
                      //   ,onTap: (){
                      //        Navigator.push(
                      //         context,
                      //         MaterialPageRoute(builder: (context) => ForgotPass()),
                      //       );
                      //   },),
                      // ),            
                      SizedBox(height: 20.h,),    
                        statee == true ? Container(
                                height: 50,
                                width: double.infinity,
                                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child:  ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff164584),
                                      shape: RoundedRectangleBorder(                       
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  child:  TitleHeading(head: 'Log In',),
                                  onPressed: () {
                                    Login();
                                    Provider11.HospitalData();
                                    Provider11.LabData();  
                                    EmailController.clear();
                                    PasswordController.clear();
                                  },
                                )
                            ):const CircularProgressIndicator(color: Colors.white,),    
                             SizedBox(height: 20.h,),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                              const  Divide(),
                                Or(txt: "OR",),
                              const  Divide(),
                              ],
                             ),
                            SizedBox(height: 20.h,),
                            Container(
                                height: 50,
                                width: double.infinity,
                                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child:ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff164584),
                                      shape: RoundedRectangleBorder(                       
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  child:  TitleHeading(head: 'Create an Account',),
                                  onPressed: () {
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const SignUp()),);
                                  },
                                )
                            ),  
                            SizedBox(height: 5.h,)
                  ],
                ),
              ),
             
                ],
              ),
            )
          ],
      ),
        ),
      ),
      builder: EasyLoading.init(),
    );
  }
}


  class Medicine {
  DateTime recieving_date;
  String unique_id;

  Medicine({required this.recieving_date, required this.unique_id});
}