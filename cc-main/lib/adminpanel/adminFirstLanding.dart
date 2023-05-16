import 'dart:io';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:project1/adminpanel/AdminDashboard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project1/adminpanel/adminNotifications.dart';
import 'package:project1/adminpanel/drawerAdminDashboard.dart';
import 'package:project1/main.dart';
import 'package:project1/screens/aboutus.dart';
import 'package:project1/screens/dashboard.dart';
import 'package:project1/screens/dashboardDrawer.dart';
import 'package:project1/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/history.dart';
import 'package:project1/screens/landingpage.dart';
import 'package:project1/screens/notification.dart';
import 'package:project1/screens/profile.dart';
import 'package:project1/screens/subscreens/appointment.dart';
import 'package:project1/screens/subscreens/doctoronline.dart';
import 'package:project1/screens/subscreens/labPrescription.dart';
import 'package:project1/screens/subscreens/prescription.dart';
import 'package:project1/screens/subscreens/selectionCity.dart';
import 'package:project1/widgets/heading3.dart';
import 'package:project1/widgets/links.dart';
import 'package:project1/widgets/square_head.dart';
import 'package:provider/provider.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:url_launcher/url_launcher.dart' ;

import '../widgets/unread.dart';



class AdminfirstLanding extends StatefulWidget {
  int? tab;
   AdminfirstLanding({Key? key, this.title,required this.tab}) : super(key: key);
  
  final String? title;

  @override
  _AdminfirstLandingState createState() => _AdminfirstLandingState();
}

class _AdminfirstLandingState extends State<AdminfirstLanding> with TickerProviderStateMixin {
  TabController? _tabController;
   
  @override
  void initState() {
    
    BackButtonInterceptor.add(myInterceptor);
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

 




  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
    _tabController!.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    final Provider11 = Provider.of<Provider1>(context); 
    Provider11.ClearAll();
    Navigator.pop(context); // Do some stuff.
    return true;
  }

   File? _image;
   late int _selectedTab = widget.tab!.toInt() ;
    _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }
   _signOut() async {
    await FirebaseAuth.instance.signOut();
    
 
    }

 
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 


        final databaseReference = FirebaseDatabase.instance.ref();

    final dataRef = databaseReference.child('notifications');
    final dataStream = dataRef.onValue;
    int count = 0;
   
     Future getImage() async{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
        setState(() {
            if (image != null) {
          _image = File(image.path);
          }
          else{
            
          }
        });
    }

    void setImage() async{
      if (_image!=null) {
        FirebaseFirestore db = FirebaseFirestore.instance;
        final ref = FirebaseStorage.instance.ref().child("userImages").child("${Provider11.last}"".jpg");
        await ref.putFile(_image!);
        String? url = await ref.getDownloadURL();
        print(url);
        db.collection("users").doc(Provider11.uuid).set(
          {
            "url":url
          } );
      }
      else{
        print("error");
      }
    }

    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color(0xff2b578e),
            title: Text("Crescent Care"),
             actions: <Widget>[
              Stack(
                
                children: [
                
                  IconButton(
            icon: FaIcon(FontAwesomeIcons.filePrescription),  
            onPressed: () {},
          ),
           Positioned(
                  top: 3.h,
                  right: 10.w,
                  child: StreamBuilder(
                    stream: dataStream,
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        count = 0;
                        Map<dynamic, dynamic> values = snapshot.data.snapshot.value;
                        if(values!=null){
                          values.forEach((key, value) {
                            if (value['noti_status'] == 'unseen') {
                              count++;
                            }
                          
                          });
                        }
          }
          return count==0?Container(): MotionBadgeWidget(
              text: "${count}",
              textColor: Colors.white, // optional, default to Colors.white
              color: Colors.red, // optional, default to Colors.red
              size: 18, // optional, default to 18
            );
        },
      ),),
                ],
              )
           ]
          ),
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Dashboard",
        useSafeArea: true, // default: true, apply safe area wrapper
        labels: const [ "Dashboard", "Notification",],
        icons: const [Icons.dashboard,Icons.notifications],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: Colors.white,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: Colors.white,
        tabIconSelectedColor: Color(0xff2b578e),
        tabBarColor: Color(0xff2b578e),
        onTabItemSelected: (int value) {
          setState(() {
            _tabController!.index = value;
          });
        },
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        controller: _tabController,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          AdminDashboard(count: Provider11.counter),
          AdminNotifications() 
        ],
      ),
       drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 223, 223, 223),
      child: 
           SingleChildScrollView(
             child: Column(
               children: [
                Container(
                  height: 120.h,
                  child: GestureDetector(
                    onTap: (){
                       Navigator.push(context,
                       MaterialPageRoute(builder: (context) => Profile()));
                    },
                    child: DrawerHeader(
                      
                      child: Row(
                      children: [
                         CircleAvatar(
                          radius: 26,
                          backgroundColor: Color.fromARGB(255, 150, 1, 115),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xff164584),
                            backgroundImage:NetworkImage(Provider11.ProfileImagePath.toString())
                          ),
                        ),
                        SizedBox(width: 15.w,)  ,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${Provider11.first![0].toUpperCase()}${Provider11.first!.substring(1).toLowerCase()}'" " + '${Provider11.last![0].toUpperCase()}${Provider11.last!.substring(1).toLowerCase()}',style: TextStyle(
                              color: Color(0xff164584),
                              fontSize: 16.sp
                            ),),
                            
                          ],
                        )  
                      ],
                    )
                    ),
                  ),
                  color: Color(0xffA4A4A4),
                ),
                SizedBox(height: 25.h,),
                InkWell(
                  child: GestureDetector(
                    child: Row(children: [
                      SizedBox(width: 20.w,),
                      Container(child: Image.asset('assets/images/menu.png'),height: 25.h,width: 25.w,),
                      SizedBox(width: 35.w,),
                      Heading3(head: "Dashboard")
                    ],),
                    onTap: (){
                      Provider11.medDetail();
                      Provider11.labDetail();
                      Provider11.labs.clear();
                      Provider11.medicines.clear();
                      Provider11.med();
                      Provider11.lab();
                      print(Provider11.med_detail);
                      print(Provider11.lab_detail);
                        Navigator.push(context,
                       MaterialPageRoute(builder: (context) => AdminDashboardDrawer()));
                    },
                  ),
                   onTap: () {
                    // Your code here
                  },
                  splashColor: Color(0xff7893B7),
                  highlightColor: Color(0xff7893B7),
                ),
           
                  SizedBox(height: 25.h,),
                InkWell(
                  child: GestureDetector(
                    child: Row(children: [
                      SizedBox(width: 20.w,),
                      Container(child: Image.asset('assets/images/appointment.png'),height: 25.h,width: 25.w,),
                      SizedBox(width: 35.w,),
                      Heading3(head: "Offline Appointment")
                    ],),
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ComingSoon(PageName: "Offline Appointment")));
                    },
                  ),
                  onTap: (){},
                  splashColor: Color(0xff7893B7),
                  highlightColor: Color(0xff7893B7),
                ),
                   SizedBox(height: 25.h,),
            
                InkWell(
                  child: GestureDetector(
                    child: Row(children: [
                      SizedBox(width: 20.w,),
                      Container(child: Image.asset('assets/images/call.png'),height: 25.h,width: 25.w,),
                      SizedBox(width: 35.w,),
                      Heading3(head: "Dial Helpline")
                    ],),
                    onTap: () async{
                      final Uri url = Uri(  
                        scheme: 'tel',
                        path: '(021) 38222273'
                      );
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                      else{
                        print("can't launch this url");
                      }
                    },
                    
                  ),
                   onTap: (){
                      
                    },
                  splashColor: Color(0xff7893B7),
                  highlightColor: Color(0xff7893B7),
                ),
               SizedBox(height: 25.h,),
                Container(
                  height: 30.h,
                  width: double.infinity,
                  color: Color(0xff164584),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 7.h),
                    child: TitleHeading(head: "ADMIN TABS"),
                  ),
                ),
                SizedBox(height: 25.h,),
                InkWell(
                  child: GestureDetector(
                    child: Row(children: [
                      SizedBox(width: 20.w,),
                      Container(child: SvgPicture.asset('assets/svgs/doctor.svg'),height: 25.h,width: 25.w,),
                      SizedBox(width: 35.w,),
                      Heading3(head: "Doctor Online")
                    ],),
                    onTap: (){
                       Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ComingSoon(PageName: "Doctor Online")));
                    },
                  ),
                  onTap: (){},
                  splashColor: Color(0xff7893B7),
                  highlightColor: Color(0xff7893B7),
                ),
                SizedBox(height: 25.h,),
                InkWell(
                  child: GestureDetector(
                    child: Row(children: [
                      SizedBox(width: 20.w,),
                      Container(child: SvgPicture.asset('assets/svgs/pharm.svg'),height: 25.h,width: 25.w,),
                      SizedBox(width: 35.w,),
                      Heading3(head: "Pharmacy Records")
                    ],),
                    onTap: (){
                       Navigator.push(context,
                       MaterialPageRoute(builder: (context) => Prescription()));
                    },
                  ),
                  onTap: (){},
                  splashColor: Color(0xff7893B7),
                  highlightColor: Color(0xff7893B7),
                ),
             SizedBox(height: 25.h,),
                InkWell(
                  child: GestureDetector(
                    child: Row(children: [
                      SizedBox(width: 20.w,),
                      Container(child: SvgPicture.asset('assets/svgs/lab.svg'),height: 25.h,width: 25.w,),
                      SizedBox(width: 35.w,),
                      Heading3(head: "Lab Test Records")
                    ],),
                    onTap: (){
                       Navigator.push(context,
                       MaterialPageRoute(builder: (context) => LabPrescription()));
                    },
                  ),
                  onTap: (){},
                  splashColor: Color(0xff7893B7),
                  highlightColor: Color(0xff7893B7),
                ),
                SizedBox(height: 10.h,),
                 Container(
                    
                      height: 50,
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(20,2,10,2),
                      child: ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Text('Sign Out'), // <-- Text
                          SizedBox(
                            width: 20.w,
                          ),
                          Icon( // <-- Icon
                            Icons.logout,
                            size: 24.0,
                          ),
                            ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff164584),
                            shape: RoundedRectangleBorder(                       
                              borderRadius: BorderRadius.circular(20), // <-- Radius
                            ),
                          ),
                       
                        onPressed: () {
                          _signOut();
                          Provider11.ClearAll();
                          Navigator.pushReplacementNamed(context, '/');    
                            
                        }, 
                      )
                  ),
                  SizedBox(height: 10.h,),
               ],
             ),
           )
        
      ),
    );
  }
}

