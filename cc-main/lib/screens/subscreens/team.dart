import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:project1/screens/subscreens/subscreenWidgets/teamCarousel.dart';
import 'package:syncfusion_flutter_treemap/treemap.dart';
import 'package:project1/widgets/MHeading1.dart';
import 'package:project1/widgets/dbSquares.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Team extends StatefulWidget {
  const Team({super.key});

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xff2b578e),
            title:const Text("Professional\n\t\t\t\t\t\tProfile"),
            centerTitle: true,
             leading: GestureDetector(
            child:const Icon( Icons.arrow_back_ios, color: Colors.white,  ),
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
      body:const Slider24(),
    );
  }
}