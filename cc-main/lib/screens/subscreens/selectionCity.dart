import 'dart:convert';
import 'dart:core';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/subscreens/map1.dart';
import 'package:project1/widgets/links.dart';
import 'package:project1/widgets/square_head.dart';
import 'package:provider/provider.dart';

class SelectionCity extends StatefulWidget {
  const SelectionCity({super.key});

  @override
  State<SelectionCity> createState() => _SelectionCityState();
}

class _SelectionCityState extends State<SelectionCity> {
  List dropdownItemList = [
  {'label': 'Abbottabad', 'value': 'Abbottabad'},
  {'label': 'Attock', 'value': 'Attock'},
  {'label': 'Bahawalnagar', 'value': 'Bahawalnagar'},
  {'label': 'Bhakkar', 'value': 'Bhakkar'}, 
  {'label': 'Burewala', 'value': 'Burewala'},
  {'label': 'Chakwal', 'value': 'Chakwal'},
  {'label': 'Chiniot', 'value': 'Chiniot'},
  {'label': 'Chitral', 'value': 'Chitral'},
  {'label': 'Dera Ghazi Khan', 'value': 'Dera Ghazi Khan'},
  {'label': 'Dera Ismail Khan', 'value': 'Dera Ismail Khan'},
  {'label': 'Faisalabad', 'value': 'Faisalabad'}, 
  {'label': 'Gilgit', 'value': 'Gilgit'},
  {'label': 'Gujranwala', 'value': 'Gujranwala'},
  {'label': 'Gujrat', 'value': 'Gujrat'},
  {'label': 'Hafizabad', 'value': 'Hafizabad'}, 
  {'label': 'Harappa', 'value': 'Harappa'},
  {'label': 'Haripur', 'value': 'Haripur'},
  {'label': 'Hyderabad', 'value': 'Hyderabad'},
  {'label': 'Islamabad', 'value': 'Islamabad'},
  {'label': 'Jehlum', 'value': 'Jehlum'},
  {'label': 'Jhelum', 'value': 'Jhelum'},
  {'label': 'Karachi', 'value': 'Karachi'}, 
  {'label': 'Kashmore', 'value': 'Kashmore'},
  {'label': 'Khairpur', 'value': 'Khairpur'},
  {'label': 'Kot Addo', 'value': 'Kot Addo'},
  {'label': 'Lahore', 'value': 'Lahore'}, 
  {'label': 'Larkana', 'value': 'Larkana'},
  {'label': 'Layyah', 'value': 'Layyah'},
  {'label': 'Mian Channu', 'value': 'Mian Channu'},
  {'label': 'Mianwali', 'value': 'Mianwali'}, 
  {'label': 'Mirpur ', 'value': 'Mirpur '},
  {'label': 'Mithi', 'value': 'Mithi'},
  {'label': 'Multan', 'value': 'Multan'},
  {'label': 'Muzaffarabad', 'value': 'Muzaffarabad'},
  {'label': 'Nankana Sahib', 'value': 'Nankana Sahib'},
  {'label': 'Nawabshah', 'value': 'Nawabshah'},
  {'label': 'Okara', 'value': 'Okara'}, 
  {'label': 'Pattoki', 'value': 'Pattoki'},
  {'label': 'Peshawar', 'value': 'Peshawar'},
  {'label': 'Pind Dadan Khan', 'value': 'Pind Dadan Khan'},
  {'label': 'Quetta', 'value': 'Quetta'}, 
  {'label': 'Rahim Yar Khan', 'value': 'Rahim Yar Khan'},
  {'label': 'Rawalpindi', 'value': 'Rawalpindi'},
  {'label': 'Sahiwal', 'value': 'Sahiwal'},
  {'label': 'Sanghar', 'value': 'Sanghar'}, 
  {'label': 'Sargodha ', 'value': 'Sargodha '},
  {'label': 'Sehwan', 'value': 'Sehwan'},
  {'label': 'Sheikhupura', 'value': 'Sheikhupura'},
  {'label': 'Sialkot', 'value': 'Sialkot'},
  {'label': 'Sukkur', 'value': 'Sukkur'},
  {'label': 'Swat', 'value': 'Swat'},
  {'label': 'Tando Adam', 'value': 'Tando Adam'}, 
  {'label': 'Tando Muhammad Khan', 'value': 'Tando Muhammad Khan'},
  {'label': 'Taxila', 'value': 'Taxila'},
  {'label': 'Vehari', 'value': 'Vehari'},
  {'label': 'Wah Cantt', 'value': 'Wah Cantt'}, 
  {'label': 'Zafarwal ', 'value': 'Zafarwal '},
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
//     Navigator.pop(context); 
//     return true;
//   }
  @override
  Widget build(BuildContext context) {
    
     final Provider11 = Provider.of<Provider1>(context);
     criteria(){

      var data = jsonDecode(Provider11.cityList);

      
  if (Provider11.loc == 'Karachi') {
       Provider11.lat = 24.9092165;
       Provider11.lon = 67.0824091;
       Provider11.zoom=12;
  } else if(Provider11.loc == 'Hyderabad') {
    Provider11.lat = 25.3835019;
    Provider11.lon = 68.2233734;
    Provider11.zoom=12;
  }
   else if(Provider11.loc == 'Lahore') {
    Provider11.lat = 31.48598;
       Provider11.lon = 74.3028964;
       Provider11.zoom=12;
  }
   else if(Provider11.loc == 'Islamabad') {
    Provider11.lat = 33.6160373;
       Provider11.lon = 72.9460221;
       Provider11.zoom=12;
  }
  else{
    final abc = []; 
    for (var items in data) {
     
        if (Provider11.loc==items['City']) {
          Provider11.lat = double.parse(items['lat'].toString());
          Provider11.lon = double.parse(items['lng'].toString());
          abc.add(Provider11.lat);
        }
      }
      if (abc.length==1) {
        Provider11.zoom=14;
      }
      else{
        Provider11.zoom=10.5;
      }
    
  }
}
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          
          appBar: AppBar(
              backgroundColor: Color(0xff2b578e),
              title:const Text("Hospital Locations"),
              leading: GestureDetector(
              child:const Icon( Icons.arrow_back_ios, color: Colors.white,  ),
                 onTap: () {
                   Navigator.pop(context);
                  } ,
          ) ,
            ),
          body: Container(
          
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
                          Provider11.loc = a['value'];
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
                            child:  TitleHeading(head: 'Locate Hospitals',),
                            onPressed: () async{
                                 await Future.delayed(const Duration(seconds: 1));
                                  criteria();
                                  Navigator.push(context,
                                     MaterialPageRoute(builder: (context) => MapMultiMarker()));
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