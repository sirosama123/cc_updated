import 'dart:io';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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

import '../../widgets/multi3.dart';






// class AppointmentVeiw extends StatelessWidget {
//   String? pname;
//   String? hname;
//   String? doa;
//   String? status;
//   String? dname;
//   AppointmentVeiw({super.key,required this.pname,required this.dname,required this.hname,required this.doa,required this.status});

//   @override
//   Widget build(BuildContext context) {
//         final Provider11 = Provider.of<Provider1>(context); 
//     return ;
//   }
// }



















