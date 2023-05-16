import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/widgets/heading3B.dart';
import 'package:project1/widgets/labels.dart';
import 'package:provider/provider.dart';
import '../widgets/heading2.dart';
import '../widgets/square_head.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override

   Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    final editfirst = TextEditingController(text: Provider11.first);
    final editlast = TextEditingController(text: Provider11.last);
    final editmobile = TextEditingController(text: Provider11.number);


    

    String profimagePath ="";
 
   Future pickProfileImage() async{
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.gallery);
      Provider11.localProfile = image!.path;
      
      final storageRef = FirebaseStorage.instance.ref("${Provider11.email}");
      File file = File(Provider11.localProfile .toString());
       try {
          await  storageRef.putFile(file);
        String downloadURL =  await storageRef.getDownloadURL();
        setState(() {
          Provider11.ProfileImagePath = downloadURL;
        });
       } catch (e) {
         print("${e}erorrrrr");
       }

    }

   Future  pickProfileImageCamera() async{
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.camera);
      Provider11.localProfile = image!.path;
      
      final storageRef = FirebaseStorage.instance.ref("${Provider11.email}");
      File file = File(Provider11.localProfile .toString());
       try {
          await  storageRef.putFile(file);
        String downloadURL =  await storageRef.getDownloadURL();
        setState(() {
          Provider11.ProfileImagePath = downloadURL;
        });
       } catch (e) {
         print("${e}erorrrrr");
       }
     
    }
    void Update() async{
      try {
        FirebaseFirestore db = FirebaseFirestore.instance;
        db.collection("users").doc(Provider11.uuid).update({
          "firstname":editfirst.text,
          "lastname":editlast.text,
          "phone":editmobile.text,
          "profile":Provider11.ProfileImagePath.toString()

        });

         var data = await FirebaseFirestore.instance.
          collection("users").
          doc(Provider11.uuid). 
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
           
          });

          Fluttertoast.showToast(
          msg: "Your Data has been updated",
          toastLength: Toast.LENGTH_SHORT,

          
      );
     
      } on FirebaseAuthException  catch (e) {
         Fluttertoast.showToast(
        msg: "$e",
        toastLength: Toast.LENGTH_SHORT,
      );
      }
    }

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
               Stack(
                children: [
                   GestureDetector(
                    onTap: (){
                        showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title:  Heading2(head: "From Camera or Gallery?"),
                  content: Container(
                    height: 150.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                         Container(
                                  height: 50.h,
                                  width: 120.w,
                                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child:ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff164584),
                                        shape: RoundedRectangleBorder(                       
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                    child:  Row(
                                      children: [
                                        Text("Camera"),
                                        SizedBox(width: 3.w,),
                                        Icon(Icons.camera)
                                      ],
                                    ),
                                    onPressed: () {
                                         pickProfileImageCamera();
                                    },
                                  )
                              ),
                              SizedBox(height: 20.h,), 
                              Container(
                                  height: 50.h,
                                  width: 120.w,
                                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child:ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff164584),
                                        shape: RoundedRectangleBorder(                       
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                    child:  Row(
                                      children: [
                                        Text("Gallery"),
                                        SizedBox(width: 3.w,),
                                        Icon(Icons.image)
                                      ],
                                    ),
                                    onPressed: () {
                                         pickProfileImage();
                                    },
                                  )
                              ), 
                     ],
                    ),
                  ),
                  actions: <Widget>[
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
                                  child:  TitleHeading(head: 'Go Back',),
                                  onPressed: () {
                                       Navigator.of(ctx).pop();
                                  },
                                )
                            ), 
                  ],
                ),
              );
                    },
                     child: CircleAvatar(
                  radius: 75,
                  backgroundColor: Color(0xff2b578e),
                  child:CircleAvatar(  
                    radius: 70,
                    backgroundColor: Colors.white,
                    child:Container(
                      height: 140.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(Provider11.ProfileImagePath.toString()),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              
                 )],
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
                          Labelss(lab: "First Name"),
                          SizedBox(height: 5.h,),
                          TextField(
                            controller: editfirst,
                            decoration: new InputDecoration(
                                hintText: '${Provider11.first}',
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
                          Labelss(lab: "Last Name"),
                          SizedBox(height: 5.h,),
                          TextField(
                            controller: editlast,
                            decoration: new InputDecoration(
                                hintText: '${Provider11.last}',
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
                          Labelss(lab: "Mobile No."),
                          SizedBox(height: 5.h,),
                          TextField(
                            controller: editmobile,
                            decoration: new InputDecoration(
                                hintText: '${Provider11.number}',
                                hintStyle: TextStyle(fontSize: 15.sp, color: Colors.black,letterSpacing: 0.7),
                                suffixIcon: Icon(Icons.phone,color: Color(0xff164584),)
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
                  child:  TitleHeading(head: 'Update',),
                  onPressed: () {
                     Update();
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



