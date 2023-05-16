import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/landingpage.dart';
import 'package:project1/screens/outPatient.dart';
import 'package:project1/screens/patientServices.dart';
import 'package:project1/screens/subscreens/subscreenWidgets/TT.dart';
import 'package:project1/widgets/NHD.dart';
import 'package:project1/widgets/NotificatioHead.dart';
import 'package:project1/widgets/heading2.dart';
import 'package:project1/widgets/notificationContainer.dart';
import 'package:project1/widgets/slider.dart';
import 'package:project1/widgets/squares.dart';
import 'package:provider/provider.dart';

import '../widgets/square_head.dart';

class Notificationss extends StatefulWidget {
  const Notificationss({super.key});

  @override
  State<Notificationss> createState() => _NotificationssState();
}

class _NotificationssState extends State<Notificationss> {
  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    return Scaffold(
      body: Provider11.notify_med.length==0? 
      Center(child: TT(head: 'No Notifications Yet', color: Color.fromARGB(255, 80, 77, 77),))
      :ListView.builder(
        itemCount: Provider11.notify_med.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: NotificationContainer(
              heading: Provider11.notify_med[index].ordertype, 
              time1:Provider11.notify_med[index].recievedate , 
              type: Provider11.notify_med[index].ordertype, 
              time2: Provider11.notify_med[index].ordertime,
              Odate: Provider11.notify_med[index].orderdate,
              ),
            onTap: (){
               showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title:  Heading2(head: "Information"),
                content: Container(
                  height: 300.h,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NH(head: "Patient Name", color: Colors.black),
                              NHD(head: Provider11.notify_med[index].name, color: Colors.black)
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NH(head: "Patient Age", color: Colors.black),
                              NHD(head: Provider11.notify_med[index].age, color: Colors.black)
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NH(head: "Recieving Date", color: Colors.black),
                              NHD(head: Provider11.notify_med[index].recievedate, color: Colors.black)
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NH(head: "Type", color: Colors.black),
                              NHD(head: Provider11.notify_med[index].ordertype, color: Colors.black)
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Container(
                            height: 200.h,
                            width: 200.w,
                            decoration: BoxDecoration(
                              image: new DecorationImage(
                                  image: new NetworkImage(Provider11.notify_med[index].urll),
                                  fit: BoxFit.fill,
                              ) 
                            ),
                          )
                        ],
                      ),
                    ),
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
          );
          
  },
),
    );
  }
}