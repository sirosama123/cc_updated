import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/widgets/heading1.dart';
import 'package:project1/widgets/MHeading1.dart';



class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
    Bool?  _isVisible;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xff2b578e),
            title: Text("About Us"),
            centerTitle: true,
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
            Container(
              constraints: new BoxConstraints.expand(
                height: 200.h,
              ),
              alignment: Alignment.bottomLeft,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage('assets/images/doctorss.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                height:double.infinity,
                width: double.infinity,
                color: Color(0xff164584).withOpacity(0.5),
                child: Center(child: 
                MHeading1(head: "About Us", color: Colors.white)
                ) ,
              )
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
              
              child: Container(  
                decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Color(0xffD13225),
              boxShadow: [
                      BoxShadow(
                        color: Color(0xffA4A4A4),
                        blurRadius: 6.0,
                        spreadRadius: 1.0,
                        offset: Offset(0.0, 0.0),
                        // Shadow position
                      ),]
        ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                  child: Text(
                  
                  '''Crescent Care Pvt. Ltd. Is a third party administration (TPA) that specializes in healthcare services and administration for insurance companies and self-managed groups. The company is a joint venture between Centegy Technologies and insurance industry veterans. It also has a collaboration with Aegis Group for strategic advisory services.
      
                  Centegy Technologies is a multinational technology solutions provider with extensive experience in the insurance industry. It is the one of the leading providers of software solutions in the region and serves clients in over 30 countries across the globe. It has a strong presence in Pakistan and is well-respected in the insurance and business community. It is headquartered in Dubai, UAE and has a regional development center in Karachi, Pakistan.''',
              textAlign: TextAlign.justify,
              style:GoogleFonts.montserrat(
                          textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 12.sp,fontWeight: FontWeight.w700),
                        ),
              ),
                ),
              )
            ),
      SizedBox(height: 10.h,),
      Center(child: MHeading1(head: "Who We Are", color: Color(0xff2b578e))),
    
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff1C552A),
                boxShadow: [
                        BoxShadow(
                          color: Color(0xffA4A4A4),
                          blurRadius: 6.0,
                          spreadRadius: 1.0,
                          offset: Offset(0.0, 0.0),
                          // Shadow position
                        ),]
          ),
          child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                  
                  child: Text(
                    
                    '''Crescent Care is (Pvt.) Ltd. (CC), is supported bt a robust management team and board of advisors that have over 100 years of collective experience in the healthcare and insurance industries. CC is also partner of Centegy Technologies, One of the leading Enterprises Software Solutions Provider in the insurance industries & Sales & Distribution across 30 countries around the Globe.''',
                  textAlign: TextAlign.justify,
                  style:GoogleFonts.montserrat(
                            textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 12.sp,fontWeight: FontWeight.w700),
                          ),
                  ),
    ),
        ),
      ),
    SizedBox(height: 10.h,),
    Center(child: MHeading1(head: "What We Offer", color: Color(0xff2b578e))),
    
    Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff244094),
                boxShadow: [
                        BoxShadow(
                          color: Color(0xffA4A4A4),
                          blurRadius: 6.0,
                          spreadRadius: 1.0,
                          offset: Offset(0.0, 0.0),
                          // Shadow position
                        ),]
          ),
        child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                  
                  child: Text(
                    
                    '''Crescent Care is at the vanguard of the TPA revolution in Pakistan. We have state-of-the-art benefit management & administration platform based on ICD and CPT coding system that is being widely used in the UAE, and we have customized it to the local market needs. Crescent Care has the domain knowledge, technical expertise, trained professional manpower to offer a fully automated integrated, and innovative benefit administration services to meet our clients current and future needs.''',
                  textAlign: TextAlign.justify,
                  style:GoogleFonts.montserrat(
                            textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 12.sp,fontWeight: FontWeight.w700),
                          ),
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

class abc extends StatelessWidget {
  const abc({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Heading1(head: "about us"),
    );
  }
}
