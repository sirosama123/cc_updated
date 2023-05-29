

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/login.dart';
import 'package:project1/widgets/square_head.dart';
import 'package:provider/provider.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:uuid/uuid.dart';

import '../widgets/multiText.dart';





class SignUp extends StatefulWidget  {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>  {
   @override
  bool statee = true;
  List<bool> _isSelected = [true, false];
  late bool _passwordVisible;
    TextEditingController firstnameController = TextEditingController();
    TextEditingController lastnameController = TextEditingController();
    TextEditingController PasswordController = TextEditingController();
    TextEditingController EmailController = TextEditingController();
    TextEditingController number = TextEditingController();
    TextEditingController policy = TextEditingController();
    TextEditingController cnic = TextEditingController();

   void initState() {
    _passwordVisible = false;
    super.initState();
    }
  @override

  bool _showPassword = false;
   bool state2 = true;
  bool? state3;
  bool? state4=false;
  String? usage;
  Widget build(BuildContext context) {

    
      final Provider11 = Provider.of<Provider1>(context,listen: true); 

    


  
   var obsText = true;

   int ind=0;
   fn(int index){
      if (index==0) {
      setState(() {
        state2=false;
        ind=0;
      });
    } else {
      setState(() {
        state2=true;
        ind=1;
      });
    }
   }
   void Signup () async{
          
      try {
        EasyLoading.show(status: 'loading...',maskType: EasyLoadingMaskType.black,);
        FirebaseAuth auth = FirebaseAuth.instance;
          FirebaseFirestore db = FirebaseFirestore.instance;
          final UserCredential user = await auth.createUserWithEmailAndPassword(
          email: EmailController.text, password: PasswordController.text);
      

       
       
      db.collection("users").doc(user.user!.uid).set(
          {
            "firstname": firstnameController.text, 
            "email": EmailController.text,
            "lastname": lastnameController.text ,
            "uid":user.user!.uid,
            "phone": number.text,
            "gender": Provider11.gender,
            "status": "Admin",
            "profile": "https://cdn-icons-png.flaticon.com/512/1077/1077012.png",
            "cnic":cnic.text,
            "policy":policy.text,
            "usage":usage,
            });
    
     
      print("Registered");
      EasyLoading.dismiss();
       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
      }  on FirebaseAuthException  catch (e) {
        EasyLoading.dismiss();
         Fluttertoast.showToast(
        msg: "${e.message}",
        toastLength: Toast.LENGTH_SHORT,
      );
      }
   }
   final _formKey = GlobalKey<FormState>();
   

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(   

          appBar: AppBar(
     leading: GestureDetector(
            child: Icon( Icons.arrow_back_ios, color: Colors.white,  ),
               onTap: () {
                 Navigator.pop(context);
                } ,
        ) ,
    backgroundColor: Color(0xff164584),
   
    title: Text(
      'Sign Up',
      style: GoogleFonts.montserrat(
          fontSize: 20.sp,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          color: Colors.white),
    ),
  ),
        body: Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff164584),
                  Color.fromARGB(255, 71, 135, 212)
                ],
              )),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
          child: Center(
            child: Container(
      child: SingleChildScrollView(
            child: Form(
               key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      labelText: "First Name",
                      labelStyle: TextStyle(
                        color: Color(0xff164584)
                      )
                    ),
                    controller:firstnameController ,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Field is empty';
                      }
                      return null;
                    },
                  ),
                ),
            
                SizedBox(height: 10.h,),
            
            
            
                Container(
                  padding: EdgeInsets.fromLTRB(20,2,10,2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                     borderRadius: BorderRadius.circular(30.r),
                     border: Border.all(color: Color(0xff164584))
                  ),
                  child: TextFormField(
                  
                    decoration: InputDecoration(
                      focusColor: Color(0xff164584),
                      border: InputBorder.none,
                      labelText: "Last Name",
                      labelStyle: TextStyle(
                        color: Color(0xff164584)
                      )
                    ),
                    controller:lastnameController ,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Field is empty';
                      }
                      return null;
                    },
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
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Field is empty';
                      }
                      return null;
                    },
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
                      labelText: 'password',
                      labelStyle: TextStyle(
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
                SizedBox(height: 10.h,),
                
            
                

                 Container(
                   padding: EdgeInsets.fromLTRB(20,5,10,5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                     borderRadius: BorderRadius.circular(30),
                     border: Border.all(color: Color(0xff164584))
                  ),
                   child: IntlPhoneField(
                    // disableLengthCheck: true,
                    controller: number,
                    countries: ['PK','SA','AE'],
                   decoration: InputDecoration(
                        focusColor: Color(0xff164584),
                        border: InputBorder.none,
                       
                        hintText: "xxxxxxxxxxx",
                        labelStyle: TextStyle(
                          color: Color(0xff164584)
                        )
                      ),
                    onSaved: (b){
print("objec112y");
                    },
                    onTap: (){
                      print("object");
                    },
                    onSubmitted: (a){print("working");},
                    onCountryChanged: (country) {
                      print('Country changed to: ' + country.name);
                      if (country=='Pakistan') {
                        setState(() {
                          state3=true;
                        });
                      } else {
                          state3=true;
                      }
                    },
                                 ),
                 ),
   


// Container(
//   height:30.h ,
//   width: 90.w,
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(20.r)
//   ),
//   child: Padding(
//     padding:EdgeInsets.all(4),
//     child: Row(
//       children: [
//         ElevatedButton(
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//           primary: Colors.transparent,
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
//           child: Text(
//             'Cnic',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//         ),
       
//       ),
//       ],
//     ),
//   ),
// ),


SizedBox(height: 10.h,),

Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    GestureDetector(
      onTap: (){
        setState(() {
          state3=true;
          usage='cooperative';
          print(usage);

        });
        policy.clear();
        print(state3);

      },
      child: Container(
      height: 40.h,
      width:100.w,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.r),
      border: Border.all(color: Colors.grey,width: 1),
      color: state3==true?Colors.white:Colors.transparent,
      ),
      child:Center(child: Multi(color:  state3==false?Colors.white:Color(0xff164584), subtitle: "ADD CNIC NO.", weight: FontWeight.bold, size: 10))
    ),
    ),
SizedBox(width: 10.w,),
Multi(color: Colors.white, subtitle: "OR", weight: FontWeight.bold, size: 10),
SizedBox(width: 10.w,),
GestureDetector(
  onTap: (){
        setState(() {
          state3=false;
          usage='international';
          print(usage);
        });
        print(state3);
        cnic.clear();
      },
  child:   Container(
    height: 40.h,
    width:100.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.r),
      border: Border.all(color: Colors.grey,width: 1),
      color: state3==false?Colors.white:Colors.transparent,
    ),
    child: Center(child: Multi(color: state3==true?Colors.white:Color(0xff164584), subtitle: "ADD CARD ID", weight: FontWeight.bold, size: 10)),
  ),
),
  ],
),


SizedBox(height: 10.h,),
                state3==true? Container(
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
                      labelText: "Cnic Number",
                      hintText: "xxxxx-xxxxxxx-x",
                      labelStyle: TextStyle(
                        color: Color(0xff164584)
                      )
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(13),
                      CNICNumberFormatter(),
                    ],
                    controller:cnic ,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Field is empty';
                      }
                      return null;
                    },
                    
                  ),
                ):state3==false?Container(
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
                      labelText: "Card ID",
                      hintText: "xxxx-xxxx-xxxx-xxxx",
                      labelStyle: TextStyle(
                        color: Color(0xff164584)
                      )
                    ),
                    inputFormatters: <TextInputFormatter>[
                      
                        LengthLimitingTextInputFormatter(19),
                        CARDNumberFormatter(),
                    ],
                    
                    controller:policy ,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Field is empty';
                      }
                      return null;
                    },
                  ),
                ):Container(),
                
            
                
                SizedBox(height: 10.h,),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white,width: 1.w),
                               boxShadow: [
                                BoxShadow(
                                  color: Color(0xffA4A4A4),
                                  blurRadius: 6.0.r,
                                  spreadRadius: 1.0.r,
                                  offset: Offset(0.0, 0.0),
                                  // Shadow position
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Provider11.gender="male";
                                setState(() {
                                  state4=false;
                                });
                              },
                              child: CircleAvatar(
                                radius: 35.r,
                                backgroundImage:AssetImage("assets/images/mstudent.png"),
                                backgroundColor: state4==false?Color(0xff2b578e):Colors.white
                              ),
                            ),
                          ),
                         SizedBox(height: 12.h,),
                         Multi(color: Colors.white, subtitle: "Male", weight: FontWeight.bold, size: 12)
                        ],
                      ),
            
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white,width: 1.w),
                              shape: BoxShape.circle,
                               boxShadow: [
                                BoxShadow(
                                  color: Color(0xffA4A4A4),
                                  blurRadius: 6.0.r,
                                  spreadRadius: 1.0.r,
                                  offset: Offset(0.0, 0.0),
                                  // Shadow position
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Provider11.gender="female";
                                setState(() {

                                  state4=true;
                                });
                              },
                              child: CircleAvatar(
                                radius: 35.r,
                                backgroundImage:AssetImage("assets/images/fstudent.png"),
                                backgroundColor: state4==true?Color(0xff2b578e):Colors.white
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h,),
                          Multi(color: Colors.white, subtitle: "Female", weight: FontWeight.bold, size: 12)
                        ],
                      ),
                    ],
                  ),
                
                SizedBox(height: 10.h,),
                statee == true ? Container(
                  
                    height: 50,
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(20,2,10,2),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff164584),
                          shape: RoundedRectangleBorder(                       
                            borderRadius: BorderRadius.circular(20), 
                          ),
                        ),
                      child:  TitleHeading(head: 'Sign Up',),
                      onPressed: () {
                        if (_formKey.currentState!.validate()&&usage!=null) {
                            
                            Signup();
                          
                           
                        
                }
                else{
                   print("please select");
                }
                          
                      },
                    )
                ):const CircularProgressIndicator(color: Colors.white,) ,       
                ],
              ),
            ),
      ),
    ),
          ),
    
        ),
        ),
      ),
      builder: EasyLoading.init(),
    );
  }
  

}





class CNICNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;

    if (text.length > 1) {
      // Remove any non-numeric characters
      text = text.replaceAll(RegExp('[^0-9]'), '');

      if (text.length > 5) {
        // Add a dash after the 5th digit
        text = text.substring(0, 5) + '-' + text.substring(5);
      }

      if (text.length > 13) {
        // Add a dash after the 13th digit
        text = text.substring(0, 13) + '-' + text.substring(13);
      }
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}


class CARDNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;

    if (text.length > 0) {
      // Remove any non-numeric characters
      text = text.replaceAll(RegExp('[^0-9A-z]'), '');

      // Add a dash after every 4th character
      text = text.replaceAllMapped(
        RegExp(r".{4}"),
        (match) => "${match.group(0)}-",
      );

      // Limit the total number of characters to 19
      if (text.length > 19) {
        text = text.substring(0, 19);
      } else if (text.length == 19) {
        // Replace the last 4 characters with "9837"
        text = text.substring(0, 15) + "9837";
      }
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

}








