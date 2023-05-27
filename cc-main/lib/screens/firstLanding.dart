import 'dart:io';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
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
import 'package:project1/screens/subscreens/appointmentList.dart';
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



class firstLanding extends StatefulWidget {
  int? tab;
   firstLanding({Key? key, this.title,required this.tab}) : super(key: key);
  
  final String? title;

  @override
  _firstLandingState createState() => _firstLandingState();
}

class _firstLandingState extends State<firstLanding> with TickerProviderStateMixin {
  TabController? _tabController;
   
  @override
  void initState() {
    
    BackButtonInterceptor.add(myInterceptor);
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
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
  

  List _pages = [
     LandingPage(),
     Notificationss(),
     History(),
     Profile()
  ];

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
          IconButton(
            icon: const Icon(Icons.search,color: Colors.white,),
            
            onPressed: () {},
          ), ]
          ),
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Home",
        useSafeArea: true, // default: true, apply safe area wrapper
        labels: const ["Home", "Notification", "Dashboard"],
        icons: const [Icons.home,Icons.notifications,  Icons.dashboard],

        // optional badges, length must be same with labels
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
           LandingPage(),
           Notificationss(),
           Dashboard(count: Provider11.counter,)
        
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
                    onTap: ()async{
                      Provider11.medDetail();
                      await Future.delayed(const Duration(seconds: 2));
                      print('''
                        ${Provider11.patient_names_lab},
                        ${Provider11.patients_age_lab},
                        ${Provider11.prescription_url_lab},
                        ${Provider11.status_lab},
                        ${Provider11.uid_lab},
 ''');
                      Provider11.labDetail();
                      Provider11.labs.clear();
                      Provider11.medicines.clear();
                      Provider11.med();
                      Provider11.lab();
                      print(Provider11.med_detail);
                      print(Provider11.lab_detail);
                        Navigator.push(context,
                       MaterialPageRoute(builder: (context) => DashboardDrawer()));
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
                      Heading3(head: "Appointment List")
                    ],),
                    onTap: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AppointList()));
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
                InkWell(
                  child: GestureDetector(
                    child: Row(children: [
                      SizedBox(width: 20.w,),
                      Container(child: SvgPicture.asset('assets/svgs/about.svg'),height: 25.h,width: 25.w,),
                      SizedBox(width: 35.w,),
                      Heading3(head: "About Us")
                    ],),
                    onTap: (){
                       Navigator.push(context,
                       MaterialPageRoute(builder: (context) => AboutUs()));
                    },
                  ),
                  onTap: (){},
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
                    child: TitleHeading(head: "OUR SERVICES"),
                  ),
                ),
           
                  SizedBox(height: 25.h,),
                InkWell(
                  child: GestureDetector(
                    child: Row(children: [
                      SizedBox(width: 20.w,),
                      Container(child: Image.asset('assets/images/map.png'),height: 25.h,width: 25.w,),
                      SizedBox(width: 35.w,),
                      Heading3(head: "Hospital Locator")
                    ],),
                    onTap: (){
                       Navigator.push(context,
                       MaterialPageRoute(builder: (context) => SelectionCity()));
                    },
                    onLongPress:(){
                      
                    } ,
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
                      Heading3(head: "Pharmacy Online")
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
                      Heading3(head: "Lab Test Online")
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