

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project1/screens/memberLogin/dependents.dart';
import 'package:project1/widgets/DBcounts.dart';
import 'package:project1/widgets/dbmainhead.dart';
import 'package:project1/widgets/heading2.dart';
import 'package:project1/widgets/heading3White.dart';
import 'package:project1/widgets/multi3.dart';
import 'package:project1/widgets/square_head.dart';

import '../screens/memberLogin/showOnMap.dart';


class PharmaName extends StatelessWidget {
  String? city;
  String? address;
  String? name;
  String? aprfor;
  String? subject;
  PharmaName({super.key,required this.address,required this.city,required this.name,required this.aprfor,required this.subject});

  @override
  Widget build(BuildContext context) {
    LatLng? loc;
    Future<LatLng> _getLatLngFromAddress(String address) async {
      List<Location> locations = await locationFromAddress(address);
      Location location = locations.first;
      loc = LatLng(location.latitude, location.longitude);
       Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShowOnMap(loc: loc!, address: address, name: name, city: city,)));
      return LatLng(location.latitude, location.longitude);
  }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: (){
                Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DependentsData(pharmAddress: address, aprFor: aprfor, subject: subject,)));
            },
            child: Container(
              width: double.infinity,
              height: 60.h,
              decoration: BoxDecoration(
                 boxShadow: [
                    BoxShadow(
                      offset: Offset(1, 1),
                      color: Color.fromARGB(255, 54, 124, 211),
                      spreadRadius: 3,
                      blurRadius: 6
                    )
                  ],
                color: Color(0xff2b578e),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r),
                )
              ),
              child: Padding(
                padding:EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Multi3(color: Colors.white, subtitle: address!.length>80?"${address.toString().substring(0,79)+"..."}":address.toString(), weight: FontWeight.bold, size: 12)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            
            left: -10,top: 10,bottom: 10,
            child: Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/plus2.png")),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-1, 0.5),
                    color: Color.fromARGB(255, 54, 124, 211),
                    spreadRadius: 3,
                    blurRadius: 6
                  )
                ],
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            
          ),
           Positioned(
            
            right: -10,bottom: -10,
            child: GestureDetector(
              onTap: (){
                _getLatLngFromAddress(address.toString());
                
              },
              child: Container(
                height: 35.h,
                width: 45.w,
                decoration: BoxDecoration(
                   boxShadow: [
                      BoxShadow(
                        offset: Offset(-1, 0.5),
                        color: Color.fromARGB(255, 54, 124, 211),
                        spreadRadius: 3,
                        blurRadius: 6
                      )
                    ],
                    shape: BoxShape.circle,
                    color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 20.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/map2.jpg"),fit: BoxFit.contain),
                     
                    ),
                  ),
                ),
              ),
            ),
            
          )
        ],
      ),
    );
  }
}