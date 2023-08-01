import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:project1/screens/dashboard.dart';
import 'package:project1/screens/notification.dart';
import 'package:project1/screens/subscreens/appointment.dart';
import 'package:project1/screens/subscreens/labPrescription.dart';
import 'package:project1/screens/subscreens/prescription.dart';
import 'package:project1/widgets/slider.dart';
import 'package:project1/widgets/squares.dart';
import 'package:hellodoc_service_pkg/main.dart';
import 'package:hellodoc_service_pkg/screens/HomeScreen.dart';
import 'package:provider/provider.dart';

import '../../widgets/wideSquare.dart';
import '../Provider/provider1.dart';
import 'BMIinput.dart';



class Activities1 extends StatefulWidget {
  const Activities1({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _Activities1State createState() => _Activities1State();
}

class _Activities1State extends State<Activities1> with TickerProviderStateMixin {
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
  bool abc = false;
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
              backgroundColor: Color(0xff2b578e),
              title: Text("Activities"),
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
      
        body: Landing1(),
     
    );
  }
}

class Landing1 extends StatelessWidget {
  const Landing1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(height: 10.h,),
                      Slider23(),
                      SizedBox(height: 10.h,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: GestureDetector(
                              child: WideSquares(imgAddress: "assets/images/calculator.png", heading: "BMI calculator"),
                              onTap: (){
                                Navigator.push(context,
                                MaterialPageRoute(builder: (context) => BMIinput()));
                              },
                              
                              ),
                        ),
          ],
        ),
      ),
    );
  }
}
