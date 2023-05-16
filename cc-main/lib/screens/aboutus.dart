import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:project1/screens/subscreens/about.dart';
import 'package:project1/screens/subscreens/location.dart';
import 'package:project1/screens/subscreens/message.dart';
import 'package:project1/screens/subscreens/team.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
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
   
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "About us",
        useSafeArea: true, // default: true, apply safe area wrapper
        labels: const ["About us","Our Team", "Location", "Message"],
        icons: const [Icons.info,Icons.people,  Icons.location_on_rounded,Icons.message],
       tabSize: 50.sp,
        tabBarHeight: 55.h,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: Colors.white,
        tabIconSize: 28.0.sp,
        tabIconSelectedSize: 26.0.sp,
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
        physics: const NeverScrollableScrollPhysics(), 
        controller: _tabController,
        children: const <Widget>[
          About(),
          Team(),
          location(),
          Message()
        ],
      ),
    );
  }
}

