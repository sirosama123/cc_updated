import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/adminpanel/AdminDashboard.dart';
import 'package:project1/adminpanel/adminFirstLanding.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/subscreens/subscreenWidgets/TTB.dart';
import 'package:project1/widgets/NHD.dart';
import 'package:project1/widgets/heading3B.dart';
import 'package:project1/widgets/chead2.dart';
import 'package:project1/widgets/toosmall.dart';
import 'package:project1/widgets/unread.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../widgets/blueLabels.dart';
import '../../widgets/boldHeading4.dart';
import '../widgets/NotificatioHead.dart';

class AdminNotifications extends StatefulWidget {
  const AdminNotifications({super.key});

  @override
  State<AdminNotifications> createState() => _AdminNotificationsState();
}

class _AdminNotificationsState extends State<AdminNotifications> {
  final ref = FirebaseDatabase.instance.ref("notifications");
 
  @override
  Widget build(BuildContext context) {

    final databaseReference = FirebaseDatabase.instance.ref();

    final dataRef = databaseReference.child('notifications');
    final dataStream = dataRef.onValue;
    int count = 0;

    return Scaffold(
      body: StreamBuilder(  
        stream: ref.onValue,
        builder: ((context,AsyncSnapshot<DatabaseEvent> snapshot) {
          
          if (snapshot.hasData) {
             Map<dynamic,dynamic> map = snapshot.data!.snapshot.value as dynamic;
            List<dynamic> list = [];
            list.clear();
            list = map.values.toList();
             return ListView.builder(
            
            itemCount: snapshot.data!.snapshot.children.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: (){
                  FirebaseDatabase.instance.ref("notifications").child(list[index]['order_id']).update({
                    "noti_status":"seen"
                  });
                  print("${list[index]['order_id']}idddd");
                  final databaseReference = FirebaseDatabase.instance.ref();
                   dataRef.onValue.listen((dynamic event) {
                  count = 0;
                  Map<dynamic, dynamic> values = event.snapshot.value;
                  if(values!=null){
                    values.forEach((key, value) {
                      if (value['noti_status'] == 'unseen') {
                        count++;
                      }
                    });
                  }
                });
                print("${count}total no of counts are here");
                                },
                child: Column(
                  children: [
                    Divider(),
                    SizedBox(height: 1.h,),
                    ListTile(
                      title: Read(
                        head: "${list[index]['order_by']} order for online ", 
                        color: Colors.black, 
                        size: list[index]['noti_status']=="unseen"?FontWeight.w700:FontWeight.w300,
                        fontsize: 12,
                        ),
                      subtitle:Read(
                        head: "${list[index]['email']} ", 
                        color: Colors.black, 
                        size: list[index]['noti_status']=="unseen"?FontWeight.w700:FontWeight.w300,
                        fontsize: 8,
                        ), 
                      leading: CircleAvatar(  
                        radius: 25.r,
                        backgroundColor:list[index]['type']=='L'?Colors.red:Colors.amber,
                        child: Text(list[index]['type'],style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                        ),),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Read(
                            head: "${list[index]['place_time']}",
                            color: Colors.black, 
                            size: list[index]['noti_status']=="unseen"?FontWeight.w700:FontWeight.w300, 
                            fontsize: 6
                            ),
                          SizedBox(height: 2.h,),
                          Read(
                            head: "${list[index]['place_date']}",
                            color: Colors.black, 
                            size: list[index]['noti_status']=="unseen"?FontWeight.w700:FontWeight.w300, 
                            fontsize: 6
                            ),
                          
                        ],
                      ),
      
                    ),
                    SizedBox(height: 1.h,),
                    Divider(),
                  ],
                ),
              );
            })
            );
            
          } else {
           return CircularProgressIndicator();
          }
         
        }),
      ),
    );

  }
}