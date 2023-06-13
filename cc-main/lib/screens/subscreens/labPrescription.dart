// import 'dart:io';
// import 'package:back_button_interceptor/back_button_interceptor.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:project1/screens/Provider/provider1.dart';
// import 'package:project1/widgets/blueLabels.dart';
// import 'package:project1/widgets/extraBold.dart';
// import 'package:project1/widgets/heading3White.dart';
// import 'package:project1/widgets/links.dart';
// import 'package:project1/widgets/square2.dart';
// import 'package:project1/widgets/square_head.dart';
// import 'package:project1/widgets/whiteLabels.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:uuid/uuid.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_functions/cloud_functions.dart';

// class LabPrescription extends StatefulWidget {
//   const LabPrescription({super.key});

//   @override
//   State<LabPrescription> createState() => _LabPrescriptionState();
// }

// class _LabPrescriptionState extends State<LabPrescription> {
//     String? imagePath;
//     bool load = false;
//     var uuid = Uuid();

//     TextEditingController patientname = TextEditingController();
//     TextEditingController age = TextEditingController();
//     DateTime? RecievingDate = DateTime(2023,1,7);
//     String? timee = " " ;
//     List dropdownItemList = [
//       {'label': '9:00AM - 9:30AM', 'value': '1'}, // label is required and unique
//       {'label': '9:30AM - 10:00AM', 'value': '2'},
//       {'label': '10:00AM - 10:30AM', 'value': '3'},
//       {'label': '10:30AM - 11:00AM', 'value': '4'}, // label is required and unique
//       {'label': '11:30AM - 12:00PM', 'value': '5'},
//       {'label': '12:00AM - 12:30AM', 'value': '6'},
//       {'label': '12:30PM - 01:00PM', 'value': '7'}, // label is required and unique
//       {'label': '01:00PM - 01:30PM', 'value': '8'},
//       {'label': '01:30PM - 02:00PM', 'value': '9'},
//       {'label': '02:00PM - 02:30PM', 'value': '10'}, // label is required and unique
//       {'label': '03:00PM - 03:30PM', 'value': '11'},
//       {'label': '03:30PM - 04:00PM', 'value': '12'},
//     ];

//   @override
//     void initState() {
//     super.initState();
//     BackButtonInterceptor.add(myInterceptor);
//   }

//   @override
//   void dispose() {
//     BackButtonInterceptor.remove(myInterceptor);
//     super.dispose();
//   }

//   bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
//     Navigator.pop(context); // Do some stuff.
//     return true;
//   }

//   Widget build(BuildContext context) {
//     final Provider11 = Provider.of<Provider1>(context); 

//    sendmail(String type, String patientname ,String patientage,String orderpersonemail,String orderpersoncontact,String url) async{
//     final HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('sendEmail');
//     final response = await callable.call(
//      <String, dynamic>{
//       'email': 'abdulsamiarain82@gmail.com',
//       'cc':"samirehman17102000@gmail.com",
//       'subject': 'Crescentcare ${type} Order',
//       'body': '''
//         Patient Name : ${Provider11.PatientName}
//         Patient Age : ${Provider11.PatientAge}
//         Order Placer name : ${Provider11.first} ${Provider11.last}
//         Order Placer Email : ${Provider11.email}
//         Order Placer Number : ${Provider11.number}
//         Order Recieving Date: ${RecievingDate}
//         Order Recieving Time: ${timee}
//               ''',
//       'attachment':'${url}'
//      },
//    );
   
//    }
//      void pickImageCamera() async{
      
//       final ImagePicker _picker = ImagePicker();
//       final image = await _picker.pickImage(source: ImageSource.camera);
//         Provider11.imagePath = image!.path;
//        setState(() {
//         imagePath = image.path;
//       });
//        showDialog(
//                 context: context,
//                 builder: (ctx) => AlertDialog(
//                   title:  const Text("Do you want to upload this Precsription?"),
//                   actions: <Widget>[
//                     TextButton(
//                      onPressed: () {
//                         setState(() {
//                           Provider11.imagePath = image.path;
//                         });
//                         Navigator.of(ctx).pop();},
//                       child: Container(
//                         color: Color(0xff2b578e),
//                         padding: const EdgeInsets.all(14),
//                         child: const Text("Yes",style: TextStyle(color: Colors.white),),
//                       ),
//                     ),
//                     TextButton(
//                        onPressed: (){
//                   setState(() {
//                           imagePath = null;
//                           Provider11.imagePath = null;
//                         });
//                         Navigator.of(ctx).pop();
//                 },
//                       child: Container(
//                         color: Color(0xff2b578e),
//                         padding: const EdgeInsets.all(14),
//                         child: const Text("No",style: TextStyle(color: Colors.white),),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//     }
//      void pickImageGallery() async{
      
//       final ImagePicker _picker = ImagePicker();
//       final image = await _picker.pickImage(source: ImageSource.gallery);
//       Provider11.imagePath = image!.path;
//       setState(() {
//         imagePath = image.path;
//       });
//         showDialog(
//                 context: context,
//                 builder: (ctx) => AlertDialog(
//                   title:  const Text("Do you want to upload this Precsription?"),
//                   actions: <Widget>[
//                       Container(
//                                   height: 50.h,
//                                   width: 120.w,
//                                   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child:ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Color(0xff164584),
//                                         shape: RoundedRectangleBorder(                       
//                                           borderRadius: BorderRadius.circular(20.r),
//                                         ),
//                                       ),
//                                     child: const Text("Yes",style: TextStyle(color: Colors.white),),
//                                     onPressed: () {
//                                          setState(() {
//                                           Provider11.imagePath = image.path;
//                                         });
//                                         Navigator.of(ctx).pop();
//                                     },
//                                   )
//                               ),
//                       Container(
//                                   height: 50.h,
//                                   width: 120.w,
//                                   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   child:ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Color(0xff164584),
//                                         shape: RoundedRectangleBorder(                       
//                                           borderRadius: BorderRadius.circular(20.r),
//                                         ),
//                                       ),
//                                     child: const Text("No",style: TextStyle(color: Colors.white),),
//                                     onPressed: () {
//                                          setState(() {
//                                             imagePath = null;
//                                             Provider11.imagePath = null;
//                                           });
//                                           Navigator.of(ctx).pop();
//                                     },
//                                   )
//                               ),              
//                   ],
//                 ),
//               );

        
      
//     }

  
      
//    getDataLab() async{
//    FirebaseFirestore.instance
//     .collection('labs')
//     .get()
//     .then((QuerySnapshot querySnapshot) {
//         querySnapshot.docs.forEach((doc) {
//           if (Provider11.uuid == doc["unique_id"].toString()) {
//             Provider11.lab_dates.add(doc["recieving_date"].toString().substring(0,11));
//           } 
//           else{
//             print("not matched");
//           }
//         });
//     });
//   }
     
//   Future uploadImageToFirestore() async{
//     try {
//        setState(() {
//         load=false;
//       });
//         FirebaseFirestore db = FirebaseFirestore.instance;
//         final storageRef = FirebaseStorage.instance.ref("${Provider11.PatientName}"+"${Provider11.uniqueID}"+".jpg");
//         File file = File(Provider11.imagePath.toString());
//         await  storageRef.putFile(file);
//         print("File Uploaded Successfully");
//         String downloadURL =  await storageRef.getDownloadURL();
//         Provider11.PrescriptionUrl = downloadURL;

//           db.collection("labs").doc("${Provider11.uniqueID}").set(
//           {
//             "patient_name": Provider11.PatientName, 
//             "age": Provider11.PatientAge,
//             "unique_id": Provider11.uuid,
//             "url":Provider11.PrescriptionUrl,
//             "recieving_date":Provider11.Recieving.toString(),
//             "recieving_time": Provider11.time
//             });
//           db.collection("users").doc("${Provider11.uuid}").update(
//           {
//             "unique_id": Provider11.uniqueID,
//             });  
//           DateTime now = new DateTime.now();
//           db.collection("local_notifications").doc("${Provider11.uuid}").collection("data").doc().set(
//             {
//             "patient_name": Provider11.PatientName, 
//             "age": Provider11.PatientAge,
//             "url":Provider11.PrescriptionUrl,
//             "recieving_date":Provider11.Recieving.toString(),
//             "recieving_time": Provider11.time,
//             "order_date_time":DateTime(now.year, now.month, now.day, now.hour ,now.minute).toString(),
//             "type":"lab",
//             "date": DateTime.now()

//             }
//           );
//       getDataLab();
//       FirebaseFirestore.instance.collection("local_notifications").
//       doc("${Provider11.uuid}").collection("data").orderBy("date").
//       get().then((QuerySnapshot querySnapshot) {
//           querySnapshot.docs.forEach((doc) {
//           Provider11.notify_med.add(NotificationMed(
//         doc["patient_name"],
//         doc['age'],
//         doc['url'],
//         doc["order_date_time"].toString().substring(0,11),
//         doc["order_date_time"].toString().substring(11,16),
//         doc["type"],
//         doc["recieving_date"].toString().substring(0,11),
//             ));
//           });
//       });
//        await sendmail("Lab",patientname.text,age.text,Provider11.email.toString(),"${Provider11.number}","${Provider11.PrescriptionUrl}");
//         setState(() {
//         Provider11.Recieving=null;
//         Provider11.uniqueID=null;
//         Provider11.PatientName=null;
//         Provider11.PatientAge=null;
//         Provider11.time=null;
//         Provider11.imagePath =null;
//         });
               
//       await Future.delayed(const Duration(seconds: 3));
//        Fluttertoast.showToast(
//           msg: "Your Response has been delievered",
//           toastLength: Toast.LENGTH_SHORT,
//       );
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//             builder: (BuildContext context) => super.widget));
        
//       setState(() {
//         load=false;
//       });
          
//       } catch (e) {
//         print("error");
//       }
    
//     }

   

  
    
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//      leading: GestureDetector(
//             child: const Icon( Icons.arrow_back_ios, color: Color(0xff164584),  ),
//                onTap: () {
//                  Navigator.pop(context);
//                 } ,
//         ) ,
//     backgroundColor: Colors.transparent,
//     elevation: 0,
//     title: Text(
//       'Online Laboratory Test',
//       style: GoogleFonts.montserrat(
//           fontSize: 20,
//           fontStyle: FontStyle.normal,
//           fontWeight: FontWeight.bold,
//           color: Color(0xff164584)),
//     ),
//   ),
//         body: Container(
//             height: double.infinity,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topRight,
//           end: Alignment.bottomLeft,
//           stops: [0.1, 0.5],
//           colors: [
//             Color(0xff164584),
//             Color.fromARGB(255, 64, 119, 187)
//           ],
//         ),
//       ),
//           child:Stack(  
//             children: [
//               SingleChildScrollView(
//                 child: Column(
//                   children: [
//                           Container(
//                       height: 150.h,
//                       width: double.infinity,
//                       decoration: const BoxDecoration(  
                          
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(180),bottomRight: Radius.circular(180))
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [

//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Column(
//                                 children: [
//                                   GestureDetector(
//                                     child: Container(
//                                       child:const CircleAvatar(
//                                         radius: 37,
//                                         backgroundColor: Color(0xff636363),
//                                         child: CircleAvatar(
//                                           radius: 35,
//                                            backgroundColor: Colors.white,
//                                           child: CircleAvatar(
//                                             backgroundColor: Colors.white,
//                                             radius: 20,
//                                             backgroundImage:AssetImage("assets/images/camera.png")
//                                           ),
//                                         ),
//                                       ) ,
//                                     ),
//                                     onTap: pickImageCamera,
//                                   ),
//                                   SizedBox(height: 3.h,),
//                                   Links(head: "Camera")
//                                 ],
//                               ),
//                               SizedBox(
//                                 width: 20.w,
//                               ),
//                               Column(
//                                 children:[
                                  
//                                   GestureDetector(
//                                     child: Container(
//                                       child:const CircleAvatar(
//                                         radius: 37,
//                                         backgroundColor: Color(0xff636363),
//                                         child: CircleAvatar(
//                                           radius: 35,
//                                            backgroundColor: Colors.white,
//                                           child: CircleAvatar(
//                                             backgroundColor: Colors.white,
//                                             radius: 20,
//                                             backgroundImage:AssetImage("assets/images/gallery.png")
//                                           ),
//                                         ),
//                                       ) ,
//                                     ),
//                                     onTap: pickImageGallery,
//                                   ),
//                                   SizedBox(height: 3.h,),
//                                   Links(head: "Gallery")
//                                 ] ,
//                               ),
//                             ],
//                               ),

//                             SizedBox(height: 7.h,),
                            
//                             Provider11.imagePath==null?Links(head: "Upload Prescription"):GestureDetector(
//                               child: Links(head: "prescrition uploaded"),
//                               onTap: (){
                                
                             
//                               },
//                             )
                              
//                         ],
//                       ),             
//                       ),
//                       Padding(
//                         padding:  EdgeInsets.symmetric(horizontal: 10.w),
//                         child: Container(
//                           child: Column(
//                             children: [
//                                SizedBox(height: 10.h,),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 WhiteLabelss(lab: 'Patient Name'),
//                                 SizedBox(height: 5.h,),
//                                 TextField(
//                                 controller: patientname,
//                                 style: TextStyle(color: Colors.white),
//                                   decoration: new InputDecoration(
//                                     enabledBorder: UnderlineInputBorder(      
//                                             borderSide: BorderSide(color: Colors.white),   
//                                             ),  
//                                     focusedBorder: UnderlineInputBorder(
//                                             borderSide: BorderSide(color: Colors.white),
//                                         ),  
                                
//                                       suffixIcon: Icon(Icons.person,color: Colors.white,)

//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 10.h,),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 WhiteLabelss(lab: 'Patient Age'),
//                                 SizedBox(height: 5.h,),
//                                 TextField(
//                                 controller: age,
//                                 style: TextStyle(color: Colors.white),
//                                   keyboardType: TextInputType.numberWithOptions(decimal: true),
//                             inputFormatters: <TextInputFormatter>[
//                                 FilteringTextInputFormatter.digitsOnly,
//                                 LengthLimitingTextInputFormatter(4),
//                             ],
//                                   decoration: new InputDecoration(
//                                       enabledBorder: UnderlineInputBorder(      
//                                               borderSide: BorderSide(color: Colors.white),   
//                                               ),  
//                                       focusedBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(color: Colors.white),
//                                           ),  
//                                       suffixIcon: Icon(Icons.person,color: Colors.white,)
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 20.h,),
//                             Container(
//                               width: double.infinity,
//                               height:110.h ,
//                                decoration: BoxDecoration(       
//                                 borderRadius: BorderRadius.circular(10.0),           
//                                     color: Colors.white,
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Color(0xffA4A4A4),
//                                           blurRadius: 6.0,
//                                           spreadRadius: 1.0,
//                                           offset: Offset(0.0, 0.0),
//                                           // Shadow position
//                                         ),
//                                       ],
//                                     ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     BlueLabelss(lab: "Select Date"),
//                                     GestureDetector(
//                                       child: Square2(imgAddress: "assets/images/calendar.png",),
//                                       onTap:  ()async {
//                                                  DateTime? newDate = await showDatePicker (
//                                                     context: context, 
//                                                     initialDate:DateTime(2023) , 
//                                                     firstDate: DateTime(2023), 
//                                                     lastDate: DateTime(2024)
//                                                     );
//                                                     if (newDate == null) {
//                                                       return;
//                                                     } else {
//                                                       setState(() {
//                                                         RecievingDate = newDate;
//                                                       },);
                                                      
//                                                     }

//                                                 },
//                                       ),
                                      
//                                   ],
//                                 ),
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     BlueLabelss(lab: "Select Time"),
//                                     // SizedBox(height: 10.h,),
//                                     GestureDetector(
//                                       child: Square2(imgAddress: "assets/images/clock.png",),
//                                       onTap:()  {
//         showDialog(
//                 context: context,
//                 builder: (ctx) => AlertDialog(
//                   title:  Links(head: "Please Select the time"),
//                     content: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//                const Divider(),
//                GestureDetector(child: Links(head: "9:00AM - 9:30AM"),onTap: (){setState(() {
//                  timee = "9:00AM - 9:30AM";
//                });  Navigator.of(ctx).pop();
//                                     },),
//               const Divider(),
//                GestureDetector(child: Links(head: "9:30AM - 10:00AM"),onTap: (){setState(() {
//                  timee = "9:30AM - 10:00AM";
//                });Navigator.of(ctx).pop();},),
//               const Divider(),
//                GestureDetector(child: Links(head: "10:00AM - 10:30AM"),onTap: (){setState(() {
//                  timee = "10:00AM - 10:30AM";
//                }); Navigator.of(ctx).pop();},),
//               const Divider(),
//                GestureDetector(child: Links(head: "10:30AM - 11:00AM"),onTap: (){setState(() {
//                  timee = "10:30AM - 11:00AM";
//                }); Navigator.of(ctx).pop();},),
//               const Divider(),
//                GestureDetector(child: Links(head: "11:00AM - 11:30AM"),onTap: (){setState(() {
//                  timee = "11:00AM - 11:30AM";
//                });Navigator.of(ctx).pop();},),
//               const Divider(),
//                GestureDetector(child: Links(head: "11:30AM - 12:00PM"),onTap: (){setState(() {
//                  timee = "11:30AM - 12:00PM";
//                }); Navigator.of(ctx).pop();},),
//               const Divider(),
//                GestureDetector(child: Links(head: "12:00PM - 12:30PM"),onTap: (){setState(() {
//                  timee = "12:00PM - 12:30PM";
//                });Navigator.of(ctx).pop();},),
//               const Divider(),
//             ],
//           ),
//         ),
//                   actions: <Widget>[
//                     TextButton(
//                      onPressed: () {
//                         Navigator.of(ctx).pop();},
//                       child: Container(
//                         color: Color(0xff2b578e),
//                         padding: const EdgeInsets.all(14),
//                         child: const Text("Yes",style: TextStyle(color: Colors.white),),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//                                                 },
//                                       ),
                                      
//                                   ],
//                                 ),
            
//                                 ],
//                               ),
//                             ),
                      

//                               SizedBox(height: 10.h,),
//                               Container(
//                                 height: 70.h,
//                                 width: double.infinity,
//                                  decoration: BoxDecoration(   
        
//                                   borderRadius: BorderRadius.circular(10.r),           
//                                       color: Colors.white,
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: Color(0xffA4A4A4),
//                                             blurRadius: 6.0,
//                                             spreadRadius: 1.0,
//                                             offset: Offset(0.0, 0.0),
//                                             // Shadow position
//                                           ),
//                                         ],
//                                       ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     EHeading1(head: "${RecievingDate!.day}"+ ","+" ${RecievingDate!.month}"+  ","+" ${RecievingDate!.year}",),
//                                     Container(
//                                       height: 30.h,
//                                       width: 170.w,
//                                       decoration: BoxDecoration(   
                                        
//                                               borderRadius: BorderRadius.circular(10.r),           
//                                                   color: Color(0xff164584),
//                                                     boxShadow: [
//                                                       BoxShadow(
//                                                         color: Color(0xffA4A4A4),
//                                                         blurRadius: 6.0,
//                                                         spreadRadius: 1.0,
//                                                         offset: Offset(0.0, 0.0),
                                             
//                                                       ),
//                                                     ],
//                                                   ),
//                                       child: Padding(
//                                         padding:  EdgeInsets.symmetric(vertical: 6.h),
//                                         child: WHeading3(head: "${timee}"),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
                              
//                                 SizedBox(height: 10.h,),
//                                 load==false? Container(
                      
//                         height: 50,
//                         width: double.infinity,
//                         padding: EdgeInsets.fromLTRB(20,2,10,2),
//                         child:ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Color(0xff164584),
//                               shape: RoundedRectangleBorder(                       
//                                 borderRadius: BorderRadius.circular(20.r), 
//                               ),
//                             ),
//                           child:  TitleHeading(head: 'Request Sent',),
//                           onPressed: () async{
//                             Provider11.Recieving= RecievingDate;
//                             Provider11.uniqueID = uuid.v4();
//                             Provider11.PatientName = patientname.text;
//                             Provider11.PatientAge = age.text;
//                             Provider11.time = timee;      
//                            if (
//                             Provider11.Recieving!=null &&
//                             Provider11.uniqueID!=null &&
//                             Provider11.PatientName!=null &&
//                             Provider11.PatientAge!=null &&
//                             Provider11.time!=null &&
//                             Provider11.imagePath != null
//                             ) {
                            
//                             Provider11.lab_dates.clear(); 
//                             Provider11.labs.clear();
                            
//                             Provider11.lab(); 
//                             // Provider11.labDetail();
//                             Provider11.notify_med.clear();

//                             await uploadImageToFirestore();
                                                                                                       
//                            } else {
                             
//                                Alert(
//                                 context: context,      
//                                 type: AlertType.info,
//                                 title: "CrescentCare Alert",
//                                 desc: "Please Give the valid Information.",
//                                 buttons: [
//                                   DialogButton(
//                                     child: Text(
//                                       "Go Back",
//                                       style: TextStyle(color: Colors.white, fontSize: 20),
//                                     ),
//                                     onPressed: () => Navigator.pop(context),
//                                     color: Color(0xff164584),
//                                     radius: BorderRadius.circular(0.0),
//                                   ),
//                                 ],
//                               ).show();
//                            }                                                                                             
//                           },
//                         )
//                     ):const CircularProgressIndicator(color: Colors.white,),       
//                     SizedBox(height: 20.h,)
//                             ],
//                           ),
//                         ),
//                       )
//                   ],
//                 ),
//               )
//             ],
//           )
//         ),
//         ),
//     );
//   }
// }











import 'dart:async';
import 'dart:io';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/widgets/blueLabels.dart';
import 'package:project1/widgets/extraBold.dart';
import 'package:project1/widgets/heading3White.dart';
import 'package:project1/widgets/links.dart';
import 'package:project1/widgets/square2.dart';
import 'package:project1/widgets/square_head.dart';
import 'package:project1/widgets/whiteLabels.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';


class LabPrescription extends StatefulWidget {
  const LabPrescription({super.key});

  @override
  State<LabPrescription> createState() => _LabPrescriptionState();
}

class _LabPrescriptionState extends State<LabPrescription> {
  final _formKey = GlobalKey<FormState>();
    String? imagePath;
    bool load = false;
    var uuid = Uuid();
   
    TextEditingController patientname = TextEditingController();
    TextEditingController age = TextEditingController();
    DateTime? RecievingDate = DateTime(2023,1,7);
    String? timee  = " ";
    List dropdownItemList = [
      {'label': '9:00AM - 9:30AM', 'value': '1'}, // label is required and unique
      {'label': '9:30AM - 10:00AM', 'value': '2'},
      {'label': '10:00AM - 10:30AM', 'value': '3'},
      {'label': '10:30AM - 11:00AM', 'value': '4'}, // label is required and unique
      {'label': '11:30AM - 12:00PM', 'value': '5'},
      {'label': '12:00AM - 12:30AM', 'value': '6'},
      {'label': '12:30PM - 01:00PM', 'value': '7'}, // label is required and unique
      {'label': '01:00PM - 01:30PM', 'value': '8'},
      {'label': '01:30PM - 02:00PM', 'value': '9'},
      {'label': '02:00PM - 02:30PM', 'value': '10'}, // label is required and unique
      {'label': '03:00PM - 03:30PM', 'value': '11'},
      {'label': '03:30PM - 04:00PM', 'value': '12'},
    ];

  // @override
  //   void initState() {
  //   super.initState();
  //   BackButtonInterceptor.add(myInterceptor);
  // }

  // @override
  // void dispose() {
  //   BackButtonInterceptor.remove(myInterceptor);
  //   super.dispose();
  // }

  // bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
  //   Navigator.pop(context); // Do some stuff.
  //   return true;
  // }

  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
   
     sendmail(String type, String patientname ,String patientage,String orderpersonemail,String orderpersoncontact,String url) async{
    final HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('sendEmail');
    final response = await callable.call(
     <String, dynamic>{
      'email': 'osama.zellesolutions@gmail.com',
      'cc':"crescentcareapp@gmail.com",
      'subject': 'Crescentcare ${type} Order',
      'body': '''
        Patient Name : ${Provider11.PatientName}
        Patient Age : ${Provider11.PatientAge}
        Order Placer name : ${Provider11.first} ${Provider11.last}
        Order Placer Email : ${Provider11.email}
        Order Placer Number : ${Provider11.number}
        Order Recieving Date: ${RecievingDate}
        Order Recieving Time: ${timee}
              ''',
      'attachment':'${url}'
     },
   );}
     void pickImageCamera() async{
      
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.camera);
      Provider11.imagePath = image!.path;
       setState(() {
        imagePath = image.path;
      });
      showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Do you want to upload this Precsription?"),
                  actions: <Widget>[
                    TextButton(
                     onPressed: () {
                        setState(() {
                          Provider11.imagePath = image.path;
                        });
                        Navigator.of(ctx).pop();},
                      child: Container(
                        color: Color(0xff2b578e),
                        padding: const EdgeInsets.all(14),
                        child: const Text("Yes",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    TextButton(
                       onPressed: (){
                  setState(() {
                          imagePath = null;
                          Provider11.imagePath = null;
                        });
                        Navigator.of(ctx).pop();
                },
                      child: Container(
                        color: Color(0xff2b578e),
                        padding: const EdgeInsets.all(14),
                        child: const Text("No",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              );

    }
     void pickImageGallery() async{
      
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.gallery);  
      Provider11.imagePath = image!.path;  
      setState(() {
        imagePath = image.path;
      });
      showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Do you want to upload this Precsription?"),
                  actions: <Widget>[
                    TextButton(
                     onPressed: () {
                        setState(() {
                          Provider11.imagePath = image.path;
                        });
                        Navigator.of(ctx).pop();},
                      child: Container(
                        color: Color(0xff2b578e),
                        padding: const EdgeInsets.all(14),
                        child: const Text("Yes",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    TextButton(
                       onPressed: (){
                  setState(() {
                          imagePath = null;
                          Provider11.imagePath = null;
                        });
                        Navigator.of(ctx).pop();
                },
                      child: Container(
                        color: Color(0xff2b578e),
                        padding: const EdgeInsets.all(14),
                        child: const Text("No",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              );
            
       }
      getData() async{
   FirebaseFirestore.instance
    .collection('labs')
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          if (Provider11.uuid == doc["unique_id"].toString()) {
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

    print(Provider11.lab_dates);
    
  }
    
     Future uploadImageToFirestore() async{
    try {
        setState(() {
        load=true;
      });
        FirebaseFirestore db = FirebaseFirestore.instance;
        final storageRef = FirebaseStorage.instance.ref("${Provider11.PatientName}"+"${Provider11.uniqueID}"+".jpg");
        File file = File(Provider11.imagePath.toString());
        await  storageRef.putFile(file);
        print("File Uploaded Successfully");
        String downloadURL =  await storageRef.getDownloadURL();
        Provider11.PrescriptionUrl = downloadURL;

          db.collection("labs").doc("${Provider11.uniqueID}").set(
          {
            "patient_name": Provider11.PatientName, 
            "age": Provider11.PatientAge,
            "unique_id": Provider11.uuid,
            "url":Provider11.PrescriptionUrl,
            "recieving_date":Provider11.Recieving.toString(),
            "recieving_time": Provider11.time,
            "uid":Provider11.uniqueID,
            "status":"pending",
            
            });
          db.collection("users").doc("${Provider11.uuid}").update(
          {
            "unique_id": Provider11.uniqueID,
            });  
          DateTime now = new DateTime.now();
          db.collection("local_notifications").doc("${Provider11.uuid}").collection("data").doc().set(
            {
            "patient_name": Provider11.PatientName, 
            "age": Provider11.PatientAge,
            "url":Provider11.PrescriptionUrl,
            "recieving_date":Provider11.Recieving.toString(),
            "recieving_time": Provider11.time,
            "order_date_time":DateTime(now.year, now.month, now.day, now.hour ,now.minute).toString(),
            "type":"lab",
            "date": DateTime.now()
            }
          );
       try {
        DateTime now = new DateTime.now();
        DatabaseReference ref = FirebaseDatabase.instance.ref("notifications");

            await ref.child(Provider11.uniqueID.toString()).set({
               "patient_name": Provider11.PatientName, 
              "order_by":"${Provider11.first} ${Provider11.last}",
              "email":"${Provider11.email}",
              "Number":Provider11.number,
              "age": Provider11.PatientAge,
              "url":Provider11.PrescriptionUrl,
              "recieving_date":Provider11.Recieving.toString(),
              "recieving_time": Provider11.time,
              "place_date":DateTime(now.year, now.month, now.day, now.hour ,now.minute).toString().substring(0,11),
              "place_time":DateTime(now.year, now.month, now.day, now.hour ,now.minute).toString().substring(11,16),
              "noti_status":"unseen",
              "type":"L",
              "order_id":Provider11.uniqueID

            });
      } catch (e) {
        print("${e}errorr is here");
      }
      getData();
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
       await sendmail("lab",patientname.text,age.text,Provider11.email.toString(),"${Provider11.number}","${Provider11.PrescriptionUrl}");
        setState(() {
        Provider11.Recieving=null;
        Provider11.uniqueID=null;
        Provider11.PatientName=null;
        Provider11.PatientAge=null;
        Provider11.time=null;
        Provider11.imagePath =null;
        });
                            
      await Future.delayed(const Duration(seconds: 3));

      setState(() {
        load=false;
      });
      Fluttertoast.showToast(
          msg: "Your Response has been delievered",
          toastLength: Toast.LENGTH_SHORT,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => super.widget));          
      } catch (e) {
        print("error");
      }
    
    }
return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
         appBar: AppBar(
     leading: GestureDetector(
            child: const Icon( Icons.arrow_back_ios, color: Color(0xff164584),  ),
               onTap: () {
                 Navigator.pop(context);
                } ,
        ) ,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      'Online Lab',
      style: GoogleFonts.montserrat(
          fontSize: 20,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          color: Color(0xff164584)),
    ),
  ),
      
        body: Container(
            height: double.infinity,
      decoration:const BoxDecoration(
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
          child:Stack(  
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                          Container(
                      height: 150.h,
                      width: double.infinity,
                      decoration:const BoxDecoration(  
                          
                        color: Colors.white,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(180),bottomRight: Radius.circular(180))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      child:CircleAvatar(
                                        radius: 37,
                                        backgroundColor: Color(0xff636363),
                                        child: CircleAvatar(
                                          radius: 35,
                                           backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 20,
                                            backgroundImage:AssetImage("assets/images/camera.png")
                                          ),
                                        ),
                                      ) ,
                                    ),
                                    onTap: pickImageCamera,
                                  ),
                                  SizedBox(height: 3.h,),
                                  Links(head: "Camera")
                                ],
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Column(
                                children:[
                                  
                                  GestureDetector(
                                    child: Container(
                                      child:CircleAvatar(
                                        radius: 37,
                                        backgroundColor: Color(0xff636363),
                                        child: CircleAvatar(
                                          radius: 35,
                                           backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 20,
                                            backgroundImage:AssetImage("assets/images/gallery.png")
                                          ),
                                        ),
                                      ) ,
                                    ),
                                    onTap: pickImageGallery,
                                  ),
                                  SizedBox(height: 3.h,),
                                  Links(head: "Gallery")
                                ] ,
                              ),
                            ],
                              ),
                            SizedBox(height: 7.h,),
                            Provider11.imagePath==null?Links(head: "Upload prescrition"):GestureDetector(
                              child: Links(head: "prescrition uploaded"),
                              onTap: (){       
                              },
                            )        
                        ],
                      ),             
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.w),
                        child: Container(
                          child: Form(
                             key: _formKey,
                            child: Column(
                              children: [
                                 SizedBox(height: 10.h,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  WhiteLabelss(lab: 'Patient Name'),
                                  SizedBox(height: 5.h,),
                                  TextFormField(
                                     validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
                                  controller: patientname,
                                  style: TextStyle(color: Colors.white),
                                    decoration: new InputDecoration(
                                      enabledBorder: UnderlineInputBorder(      
                                              borderSide: BorderSide(color: Colors.white),   
                                              ),  
                                      focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white),
                                          ),
                                        suffixIcon: Icon(Icons.person,color: Colors.white,)
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  WhiteLabelss(lab: 'Patient Age'),
                                  SizedBox(height: 5.h,),
                                  TextFormField(
                                       validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
                                  controller: age,
                                  style:const TextStyle(color: Colors.white),
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4),
                              ],
                                    decoration: const InputDecoration(
                                        enabledBorder: UnderlineInputBorder(      
                                                borderSide: BorderSide(color: Colors.white),   
                                                ),  
                                        focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white),
                                            ),  
                                        suffixIcon: Icon(Icons.person,color: Colors.white,)
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h,),
                              Container(
                                width: double.infinity,
                                height:110.h ,
                                 decoration: BoxDecoration(       
                                  borderRadius: BorderRadius.circular(10.0),           
                                      color: Colors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color(0xffA4A4A4),
                                            blurRadius: 6.0,
                                            spreadRadius: 1.0,
                                            offset: Offset(0.0, 0.0),
                                            // Shadow position
                                          ),
                                        ],
                                      ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                   
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // SizedBox(height: 5.h,),
                                      BlueLabelss(lab: "Select Date"),
                                      
                                      GestureDetector(
                                        child: Square2(imgAddress: "assets/images/calendar.png",),
                                        onTap:  ()async {
                                                   DateTime? newDate = await showDatePicker (
                                                      context: context, 
                                                      initialDate:DateTime(2023) , 
                                                      firstDate: DateTime(2023), 
                                                      lastDate: DateTime(2024)
                                                      );
                                                      if (newDate == null) {
                                                        return;
                                                      } else {
                                                        setState(() {
                                                          RecievingDate = newDate;
                                                        },);
                                                        
                                                      }
                          
                                                  },
                                        ),
                                        
                                    ],
                                  ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BlueLabelss(lab: "Select Time"),
                                      // SizedBox(height: 10.h,),
                                      GestureDetector(
                                        child: Square2(imgAddress: "assets/images/clock.png",),
                                        onTap:()  {
                                                  showDialog(
                                                    context: context,
                                                    builder: (ctx) => AlertDialog(
                                                      title:  Links(head: "Please Select the time"),
                                                        content: SingleChildScrollView(
                                              child: Column(
                                                children: <Widget>[
                                                const  Divider(),
                                                  GestureDetector(child: Links(head: "9:00AM - 9:30AM"),onTap: (){setState(() {
                                                    timee = "9:00AM - 9:30AM";
                                                  });  Navigator.of(ctx).pop();
                                                                        },),
                                                const  Divider(),
                                                  GestureDetector(child: Links(head: "9:30AM - 10:00AM"),onTap: (){setState(() {
                                                    timee = "9:30AM - 10:00AM";
                                                  });Navigator.of(ctx).pop();},),
                                                const  Divider(),
                                                  GestureDetector(child: Links(head: "10:00AM - 10:30AM"),onTap: (){setState(() {
                                                    timee = "10:00AM - 10:30AM";
                                                  }); Navigator.of(ctx).pop();},),
                                                const  Divider(),
                                                  GestureDetector(child: Links(head: "10:30AM - 11:00AM"),onTap: (){setState(() {
                                                    timee = "10:30AM - 11:00AM";
                                                  }); Navigator.of(ctx).pop();},),
                                                const  Divider(),
                                                  GestureDetector(child: Links(head: "11:00AM - 11:30AM"),onTap: (){setState(() {
                                                    timee = "11:00AM - 11:30AM";
                                                  });Navigator.of(ctx).pop();},),
                                                const  Divider(),
                                                  GestureDetector(child: Links(head: "11:30AM - 12:00PM"),onTap: (){setState(() {
                                                    timee = "11:30AM - 12:00PM";
                                                  }); Navigator.of(ctx).pop();},),
                                                const  Divider(),
                                                  GestureDetector(child: Links(head: "12:00PM - 12:30PM"),onTap: (){setState(() {
                                                    timee = "12:00PM - 12:30PM";
                                                  });Navigator.of(ctx).pop();},),
                                                const  Divider(),
                                                ],
                                              ),
                                            ),
                                                      actions: <Widget>[
                                                        TextButton(
                                                        onPressed: () {
                                                            Navigator.of(ctx).pop();},
                                                          child: Container(
                                                            color: const Color(0xff2b578e),
                                                            padding: const EdgeInsets.all(14),
                                                            child: const Text("Yes",style: TextStyle(color: Colors.white),),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                        );
                                          },
                                        ),
                                        
                                    ],
                                  ),
                                  ],
                                ),
                              ),
                                                
                          
                                SizedBox(height: 10.h,),
                                Container(
                                  height: 70.h,
                                  width: double.infinity,
                                   decoration: BoxDecoration(   
                                  
                                    borderRadius: BorderRadius.circular(10.0),           
                                        color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0xffA4A4A4),
                                              blurRadius: 6.0,
                                              spreadRadius: 1.0,
                                              offset: Offset(0.0, 0.0),
                                              // Shadow position
                                            ),
                                          ],
                                        ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      EHeading1(head: "${RecievingDate!.day}"+ ","+" ${RecievingDate!.month}"+  ","+" ${RecievingDate!.year}",),
                                      Container(
                                        height: 30.h,
                                        width: 170.w,
                                        decoration: BoxDecoration(   
                                          
                                                borderRadius: BorderRadius.circular(10.0),           
                                                    color: Color(0xff164584),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color: Color(0xffA4A4A4),
                                                          blurRadius: 6.0,
                                                          spreadRadius: 1.0,
                                                          offset: Offset(0.0, 0.0),
                                                          // Shadow position
                                                        ),
                                                      ],
                                                    ),
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(vertical: 6.h),
                                          child: WHeading3(head: "${timee}"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                
                                  SizedBox(height: 10.h,),
                                   load == false?Container(
                                                
                                                  height: 50,
                                                  width: double.infinity,
                                                  padding: const EdgeInsets.fromLTRB(20,2,10,2),
                                                  child:ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff164584),
                                shape: RoundedRectangleBorder(                       
                                  borderRadius: BorderRadius.circular(20), 
                                ),
                              ),
                            child:  TitleHeading(head: 'Request Sent',),
                            onPressed: () async{
                              Provider11.Recieving= RecievingDate;
                              Provider11.uniqueID = uuid.v4();
                              Provider11.PatientName = patientname.text;
                              Provider11.PatientAge = age.text;
                              Provider11.time = timee;                         
                             
                             if (
                              Provider11.Recieving!=null &&
                              Provider11.uniqueID!=null &&
                              Provider11.PatientName!=null &&
                              Provider11.PatientAge!=null &&
                              Provider11.time!=null &&
                              Provider11.imagePath !=null &&
                              age.text!=null &&patientname.text!=null

                              ) {
                                  Provider11.lab_dates.clear();
                                  Provider11.patient_names_lab.clear();
                                  Provider11.patients_age_lab.clear();
                                  Provider11.prescription_url_lab.clear();
                                  Provider11.status_lab.clear();
                                  Provider11.uid_lab.clear();
                                  Provider11.labs.clear();
                                  Provider11.serialNo_lab.clear();
                                  Provider11.notify_med.clear();
                           if (_formKey.currentState!.validate()) {
                   await uploadImageToFirestore();    
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => super.widget));
                }
                                
                             } else {
                               Alert(
                                  context: context,                
                                  type: AlertType.info,
                                  title: "CrescentCare Alert",
                                  desc: "Please Give the valid Information.",
                                  buttons: [
                                    DialogButton(
                                      child: const Text(
                                        "Go Back",
                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      color: Color(0xff164584),
                                      radius: BorderRadius.circular(0.0),
                                    ),
                                  ],
                                ).show();
                             }  
                            },
                                                  )
                                              ): Container(child: const CircularProgressIndicator(color: Colors.white,)),       
                                              SizedBox(height: 20.h,)
                                  
                              ],
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              )
            ],
          )
        ),
        ),
    );
  }
}

