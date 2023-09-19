import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/memberLogin/pharmacyCities.dart';
import 'package:project1/screens/memberLogin/profile.dart';
import 'package:provider/provider.dart';
import '../../widgets/memberPageBars.dart';
import '../widgets/memberPageBars.dart';
import 'city.dart';



class CenterPage extends StatelessWidget {
  List<dynamic> hospcities;
  CenterPage({super.key ,required this.hospcities});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Color(0xff2b578e),
          title: Text("Please Select"),
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
              onPressed: () {
                
              },
            ),
          ]),
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   GestureDetector(
                    onTap: (){
                        Navigator.push(
              context, MaterialPageRoute(builder: (context) =>HospCities(hospcities: hospcities, for1: 'OPD',)
               ));
                    },
                    child: MemberPageBar1(
                      heading: 'OPD      ',
                      imgAddress: 'assets/images/rx.png',
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GestureDetector(
                    onTap: (){
                         Navigator.push(
              context, MaterialPageRoute(builder: (context) =>HospCities(hospcities: hospcities, for1: 'IPD',)
               ));
                    },
                    child: MemberPageBar1(
                      heading: 'IPD      ',
                      imgAddress: 'assets/images/rx.png',
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}