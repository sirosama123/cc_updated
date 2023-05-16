import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/screens/subscreens/subscreenWidgets/TD.dart';
import 'package:project1/screens/subscreens/subscreenWidgets/TT.dart';
import 'package:project1/widgets/heading2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../../widgets/square_head.dart';

final Uri _url = Uri.parse('https://flutter.dev');

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  final List<Map<String, dynamic>> clityList = const [
    {
      "address": "Karachi Pakistan",
      "id": "Karachi",
      "lat": 24.8453629,
      "lng": 67.0218373,
      "name": "Crescent Care",
      "phone": "",
      "region": "Karachi"
    },
   
  ];

  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _markers.clear();
    setState(() {
      for (int i = 0; i < clityList.length; i++) {
        final marker = Marker(
          markerId: MarkerId(clityList[i]['name']),
          position: LatLng(clityList[i]['lat'], clityList[i]['lng']),
          infoWindow: InfoWindow(
              title: clityList[i]['name'],
              snippet: clityList[i]['address'],
              onTap: () {
              }),
          onTap: () {
          },
        );
        _markers[clityList[i]['name']] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition:  CameraPosition(
        target: LatLng(clityList[0]['lat'], clityList[0]['lng']),
        zoom: 15,
      ),
      markers: _markers.values.toSet(),
    )
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TT(
                      head: "Contact Us", 
                      color: Color(0xff2b578e)
                    ),
                    SizedBox(height: 20.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:30.w,vertical: 5.h ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                             onTap: (){
                              
                            },
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child:Image.asset("assets/images/facebook.png")
                            ),
                          ),
                          GestureDetector(
                             onTap: (){
                              
                            },
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child:Image.asset("assets/images/linkedin.png")
                            ),
                          ),
                          GestureDetector(
                             onTap: (){
                               showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title:  Heading2(head: "Address"),
                    content: Container(
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child:Image.asset("assets/images/map.png")
                            ),
                          TD(head: " Progressive Plaza, Unit #705,\n 7th Floor, Beaumont Rd, Civil\n Lines, Karachi.", color: Color(0xff164584))
                        ],
                      ),
                    ),
                    actions: <Widget>[
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
                              radius: 20,
                              backgroundColor: Colors.white,
                              child:Image.asset("assets/images/map.png")
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                               showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title:  Heading2(head: "Phone Number"),
                    content: Container(
                      
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child:Image.asset("assets/images/call.png")
                            ),
                          TD(head: "  + 92 21 3822-CARE", color: Color(0xff164584))
                        ],
                      ),
                    ),
                    actions: <Widget>[
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
                              radius: 20,
                              backgroundColor: Colors.white,
                              child:Image.asset("assets/images/call.png")
                            ),
                          ),
                        ],
                      ),
                      
                    ),
                    SizedBox(height: 10.h,),
                  ],
                ),
              ),
            )
            )
      ],
    );
  }
}