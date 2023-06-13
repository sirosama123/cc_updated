import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../widgets/heading2.dart';
import '../widgets/heading3.dart';
import '../widgets/heading4.dart';

class Map5 extends StatefulWidget {
  const Map5({super.key});

  @override
  State<Map5> createState() => _Map5State();
}

class _Map5State extends State<Map5> {
   late TooltipBehavior _tooltipBehavior;

  //   @override
  //   void initState() {
  //   _tooltipBehavior = TooltipBehavior(
  //               enable: true,               
  //             );
    
  //    super.initState();
    
  //   BackButtonInterceptor.add(myInterceptor);
  //   } 
  // @override
   
   

  // @override
  // void dispose() {
    
  //   BackButtonInterceptor.remove(myInterceptor);
  //   super.dispose();
  // }

  // bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
  //   final Provider11 = Provider.of<Provider1>(context, listen: false); 
  //   Provider11.markerIdd.clear();
  //   Provider11.latitude.clear();
  //   Provider11.longitude.clear();
  //   Provider11.title.clear();
  //   Provider11.city.clear();
  //   Provider11.name.clear();
  //   Provider11.contact.clear();
  //   Provider11.karachiLabs.clear();
  //   Provider11.hyderabadLabs.clear();
  //   Provider11.islamabadLabs.clear();
  //   Provider11.peshawarLabs.clear();
  //   Provider11.rawalpindiLabs.clear();
  //   Provider11.faisalabadLabs.clear();
  //   print("this is done");
  //   Navigator.pop(context);
  //   return true;
  // }
    String?name;
    String?address;
    String?contact;
    String?city;
  @override
  
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 

    String?namew = Provider11.nameL;
    String?addressw=Provider11.addressL;
    String?contactw= Provider11.contactL;
    String?cityw=Provider11.cityL;  


    return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(0xff2b578e),
      title: const Text("Lab Locations"),
      leading: GestureDetector(
      child: const Icon( Icons.arrow_back_ios, color: Colors.white,  ),
          onTap: () {
            Provider11.markerIdd.clear();
            Provider11.latitude.clear();
            Provider11.longitude.clear();
            Provider11.title.clear();
            Provider11.city.clear();
            Provider11.name.clear();
            Provider11.contact.clear();
            Provider11.karachiLabs.clear();
            Provider11.hyderabadLabs.clear();
            Provider11.islamabadLabs.clear();
            Provider11.peshawarLabs.clear();
            Provider11.rawalpindiLabs.clear();
            Provider11.faisalabadLabs.clear();
            Navigator.pop(context);
          } ,
  ) ,
          ),
     body:Stack(children: [
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 450.h,
          child: GoogleMap(
  markers: Set.from(
    Provider11.locL=='Karachi'?Provider11.karachiLabs.map(
      (marker) => Marker(
        markerId: MarkerId(marker.title),
        position: LatLng(marker.latitude, marker.longitude),
        infoWindow: InfoWindow(
          title: marker.title,
        ),
        icon: BitmapDescriptor.defaultMarker,
        onTap: (){
          setState(() {
            name=marker.names;
            address = marker.title;
            contact = marker.contact.toString().substring(0,14);
            city = marker.city;
          });
        }
      ),
    ): Provider11.locL=='Hyderabad'?Provider11.hyderabadLabs.map(
      (marker) => Marker(
        markerId: MarkerId(marker.title),
        position: LatLng(marker.latitude, marker.longitude),
        infoWindow: InfoWindow(
          title: marker.title,
        ),
        icon: BitmapDescriptor.defaultMarker,
         onTap: (){
          setState(() {
            name=marker.names;
            address = marker.title;
            contact = marker.contact;
            city = marker.city;
          });
        }
      ),
    ):Provider11.locL=='Islamabad'?Provider11.islamabadLabs.map(
      (marker) => Marker(
        markerId: MarkerId(marker.title),
        position: LatLng(marker.latitude, marker.longitude),
        infoWindow: InfoWindow(
          title: marker.title,
        ),
        icon: BitmapDescriptor.defaultMarker,
         onTap: (){
          setState(() {
            name=marker.names;
            address = marker.title;
            contact = marker.contact;
            city = marker.city;
          });
        }
      ),
    ):Provider11.locL=='Rawalpindi'?Provider11.rawalpindiLabs.map(
      (marker) => Marker(
        markerId: MarkerId(marker.title),
        position: LatLng(marker.latitude, marker.longitude),
        infoWindow: InfoWindow(
          title: marker.title,
        ),
        icon: BitmapDescriptor.defaultMarker,
         onTap: (){
          setState(() {
            name=marker.names;
            address = marker.title;
            contact = marker.contact;
            city = marker.city;
          });
        }
      ),
    ):Provider11.locL=='Faisalabad'?Provider11.faisalabadLabs.map(
      (marker) => Marker(
        markerId: MarkerId(marker.title),
        position: LatLng(marker.latitude, marker.longitude),
        infoWindow: InfoWindow(
          title: marker.title,
        ),
        icon: BitmapDescriptor.defaultMarker,
         onTap: (){
          setState(() {
            name=marker.names;
            address = marker.title;
            contact = marker.contact;
            city = marker.city;
          });
        }
      ),
    ):Provider11.peshawarLabs.map(
      (marker) => Marker(
        markerId: MarkerId(marker.title),
        position: LatLng(marker.latitude, marker.longitude),
        infoWindow: InfoWindow(
          title: marker.title,
        ),
        icon: BitmapDescriptor.defaultMarker,
         onTap: (){
          setState(() {
            name=marker.names;
            address = marker.title;
            contact = marker.contact;
            city = marker.city;
            print(marker.names);
          });
        }
      ),
    ),
  ), initialCameraPosition:  CameraPosition(
      target: LatLng(Provider11.latL,Provider11.lonL),
      zoom: 12,
),
),
        ),
      ),
       Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 180.h,
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
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 20.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           name==null?Heading2(head: "${namew}"):Heading2(head: "${name}"),
                           address==null?Heading4(head: "${addressw}"):Heading4(head: "${address}"),
                              Container(
                                height: 30.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 6.h),
                                  child: Text("On Panel",style: TextStyle(color: Colors.white,fontSize: 14.sp,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
                                ),
                              ),      
                            Padding(
                              padding:  EdgeInsets.only(left: 15.w,right: 15.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  contact==null?Heading3(head: "${contactw}"):Heading3(head: "${contact}"),
                                  city==null?Heading3(head: "${cityw}"):Heading3(head: "${city}"),
                                ],
                              ),
                            ),
                              ],
                        ),
                      ),
                    ),
                  ),
     ]) ,
    );
  }
}