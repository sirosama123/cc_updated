import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/memberLogin/pharmacyCities.dart';
import 'package:project1/screens/memberLogin/profile.dart';
import 'package:project1/screens/profile.dart';
import 'package:project1/screens/subscreens/appointment.dart';
import 'package:project1/screens/subscreens/labOrderDetails.dart';
import 'package:project1/screens/subscreens/medicineOrdersDetail.dart';
import 'package:project1/widgets/dbSquares.dart';
import 'package:project1/widgets/heading3B.dart';
import 'package:project1/widgets/chead2.dart';
import 'package:project1/widgets/smallDBsquare.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../memberLogin/hospitals.dart';
import '../widgets/memberPageBars.dart';


class BookAppointmentPanelHospitals extends StatefulWidget {
  const BookAppointmentPanelHospitals({super.key});

  @override
  State<BookAppointmentPanelHospitals> createState() => _BookAppointmentPanelHospitalsState();
}

class _BookAppointmentPanelHospitalsState extends State<BookAppointmentPanelHospitals> {
  @override
  bool abc = false;
  Widget build(BuildContext context) {
    var hospcities;
      
    return const Placeholder();
  }
}