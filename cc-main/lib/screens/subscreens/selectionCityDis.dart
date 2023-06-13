import 'dart:convert';
import 'dart:core';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/map3.dart';
import 'package:project1/screens/subscreens/map2.dart';
import 'package:project1/widgets/links.dart';
import 'package:project1/widgets/square_head.dart';
import 'package:provider/provider.dart';


class SelectionCityD extends StatefulWidget {
  const SelectionCityD({super.key});

  @override
  State<SelectionCityD> createState() => _SelectionCityDState();
}

class _SelectionCityDState extends State<SelectionCityD> {
  List dropdownItemList = [
  {'label': 'Karachi', 'value': 'Karachi'}, 
  {'label': 'Hyderabad', 'value': 'Hyderabad'},
  {'label': 'Faisalabad', 'value': 'Faisalabad'},
  {'label': 'Islamabad', 'value': 'Islamabad'},
  {'label': 'Peshawar', 'value': 'Peshawar'},
  {'label': 'Rawalpindi', 'value': 'Rawalpindi'},

];

//  void initState() {
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
  @override
  Widget build(BuildContext context) {
     final Provider11 = Provider.of<Provider1>(context);
       criteria(){

      var data = jsonDecode(Provider11.labCity);

      
  if (Provider11.locL == 'Karachi') {
    Provider11.latL = 24.917755;
    Provider11.lonL = 67.0949881;
    Provider11.zoomL=12;
    Provider11.Karachi();
  } else if(Provider11.locL == 'Hyderabad') {
    Provider11.latL = 25.3835019;
    Provider11.lonL = 68.2233734;
    Provider11.zoomL=12;
    Provider11.Hyderabad();
  }
  else if(Provider11.locL == 'Faisalabad') {
    Provider11.latL = 31.4038668;
    Provider11.lonL = 73.0867173;
    Provider11.zoomL=12;
    Provider11.Faisalabad();
  }

   else if(Provider11.locL == 'Islamabad') {
    Provider11.latL = 33.6160373;
       Provider11.lonL = 72.9460221;
       Provider11.zoomL=12;
       Provider11.Islamabad();
  }
  else if(Provider11.locL == 'Rawalpindi') {
       Provider11.latL = 33.5614357;
       Provider11.lonL = 72.8780628;
       Provider11.zoomL=12;
       Provider11.Rawalpindi();
  }
  else{
       Provider11.latL = 33.9772137;
       Provider11.lonL = 71.4253852;
       Provider11.zoomL=12;
       Provider11.Peshawar();
  }
}
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffafc4dd),
        appBar: AppBar(
            backgroundColor: Color(0xff2b578e),
            title:const Text("Lab Locations"),
            leading: GestureDetector(
            child:const Icon( Icons.arrow_back_ios, color: Colors.white,  ),
               onTap: () {
                 Navigator.pop(context);
                } ,
        ) ,
          ),
        body:Container(
          
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage(
              'assets/images/world.jpg'),
          fit: BoxFit.cover,
        ),

      
        ),
     
            child: Stack(
              children: [
                Container(
                   height: 200.h,
                      width: double.infinity,
                      decoration:const BoxDecoration(    
                        color: Colors.white,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50))
                      ),
                      child:  Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Links(head: "Please Select City"),
                  SizedBox(height: 10.h,),
                  Container(
                    padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Color(0xff164584),
                        borderRadius: BorderRadius.circular(10)
                      ),
                    child: CoolDropdown(
                     resultWidth: 320.w,
                      dropdownList: dropdownItemList,
                      onChange: (a) {
                        setState(() {
                          Provider11.locL = a['value'];
                        });           
                      },
                      defaultValue: dropdownItemList[0],
                    ),
                  ),
                  SizedBox(height: 15.h,),
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
                            child:  TitleHeading(head: 'Locate Labs',),
                            onPressed: () async{
                                  await Future.delayed(const Duration(seconds: 1));
                                  criteria();
                                  await Future.delayed(const Duration(seconds: 2));
                                  Navigator.push(context,
                                     MaterialPageRoute(builder: (context) => Map5()));
                            },
                          )
                      ),  
                ],
              ),
            ),
                ),
               
            ],)
          ) ,    
      ),
    );
  }
}