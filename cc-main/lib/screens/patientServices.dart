import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:project1/screens/dashboard.dart';
import 'package:project1/screens/notification.dart';
import 'package:project1/screens/subscreens/BMIinput.dart';
import 'package:project1/screens/subscreens/selectionCity.dart';
import 'package:project1/screens/subscreens/selectionCityDis.dart';
import 'package:project1/widgets/slider.dart';
import 'package:project1/widgets/squares.dart';
import 'package:project1/widgets/wideSquare.dart';

import '../widgets/links.dart';
import '../widgets/roboto.dart';
import '../widgets/square_head.dart';



class Services1 extends StatefulWidget {
  const Services1({super.key});

  @override
  State<Services1> createState() => _Services1State();
}

class _Services1State extends State<Services1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xff2b578e),
            title: Text("In Patient Services"),
             leading: GestureDetector(
            child: Icon( Icons.arrow_back_ios, color: Colors.white,  ),
               onTap: () {
                 Navigator.pop(context);
                } ,
        ) ,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search,color: Colors.white,),
            
            onPressed: () {},
          ), ]
          ),
      body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10.h,),
                  Slider23(),
                  SizedBox(height: 20.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 24.w),
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  child: Squares(imgAddress: 'assets/images/location1.png', heading: "Hospital Locator"),
                                  onTap: (){
                                      Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => SelectionCity()));
                                  },
                                  ),
                                GestureDetector(child: Squares(imgAddress: "assets/images/discounts.png", heading: "Discount Center"),
                                onTap: (){
                                     Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => SelectionCityD()));
                                },),
                              ],
                            ),
                           
                            SizedBox(height: 20.h,),
                            Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(   
        borderRadius: BorderRadius.circular(10.0),           
             color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xffA4A4A4),
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                  offset: Offset(0.0, 0.0),
                  // Shadow position
                ),
              ],
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding:EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/info.png",height: 25.h,width: 25.w,),
                          SizedBox(width: 5.w,),
                          Roboto(
                            color: Color(0xff2b578e), 
                            subtitle: "Attention", 
                            weight: FontWeight.w700, 
                            size: 18, 
                            align: TextAlign.start
                            ),
                        ],
                      ),
                      SizedBox(height: 7.h,),
                      Links(head: "PLEASE CARRY YOUR ORIGINAL CNIC, HEALTH CARD AND COMPANY CARD WITH YOU."),
                      
                   
                    ]
                  ),
                ),
              ),
            )
          ),
          
        )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}






class Services extends StatefulWidget {
  const Services({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
            backgroundColor: Color(0xff2b578e),
            title: Text("In Patient Services"),
             leading: GestureDetector(
            child: Icon( Icons.arrow_back_ios, color: Colors.white,  ),
               onTap: () {
                 Navigator.pop(context);
                } ,
        ) ,
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
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: <Widget>[
         Services1(),
         Notificationss(),
         Dashboard(count: 0,)
        ],
      ),
    );
  }
}