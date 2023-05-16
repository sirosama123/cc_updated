import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/downloadCards/allCards.dart';
import 'package:project1/screens/downloadCards/pdf1.dart';
import 'package:project1/screens/login.dart';
import 'package:project1/widgets/square_head.dart';
import 'package:provider/provider.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:open_filex/open_filex.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/services.dart' show ByteData, Uint8List, rootBundle;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../../widgets/memberPageBars.dart';
import '../../widgets/multi3.dart';
import '../memberLogin/approval.dart';
import '../memberLogin/hospitals.dart';


class LandingCard extends StatelessWidget {
  const LandingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
         appBar: AppBar(
          backgroundColor: Color(0xff2b578e),
          title: Text("Profile"),
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ]),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: GestureDetector(
                onTap: (){
                    Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllCards()));
                },
                child: MemberPageBar1(
                  heading: 'My Profile      ',
                  imgAddress: 'assets/images/user.png',
                ),
                ),
              )
            ],
          ),
      ),
      );
  }
}