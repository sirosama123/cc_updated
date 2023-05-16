import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/screens/subscreens/subscreenWidgets/TD.dart';
import 'package:project1/screens/subscreens/subscreenWidgets/TT.dart';
import 'package:project1/screens/subscreens/subscreenWidgets/subTT.dart';
import 'package:project1/widgets/NHD.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../widgets/NHT.dart';





class Slider24 extends StatefulWidget {
  const Slider24({super.key});

  @override
  State<Slider24> createState() => _Slider24State();
}

class _Slider24State extends State<Slider24> {
  @override
  
  late PageController _pageController;
  int activeIndex = 0;
  List images = [
    ContainerSlider(
      name: "MUNEER AHMED KHAN", 
      designation: "CHIEF EXECUTIVE OFFICER", 
      description: "With over 22 years of professional experience, Muneer A. Khan has deep business knowledge and insight. He works closely with management and employees at all levels to develop corporate strategy. His core competencies include business relationship management, business planning, business development, and customer relationship management.", 
      imgaddress: "assets/images/muneer.jpg",
      experience: "22+ years",
      ),
      ContainerSlider(
      name: "DR MUBASHIR RIAZ", 
      designation: "MANAGER MEDICAL SERVICES", 
      description: "He is an elected member of the Royal Society for Public Health in the United Kingdom as well as a nominated member of the Industrial Advisory Board of Sir Syed University of Engineering & Technology, Karachi. 13 + years of personable, devoted, dedicated and team-spirited medical professional with demonstrated record of accomplishment in skilled patient evaluation.", 
      imgaddress: "assets/images/mubashir.jpeg",
      experience: "13+ years",
      ),
      ContainerSlider(
      name: "FAIZAN AHMED KHAN", 
      designation: "OPERATION MANAGER", 
      description: "Mr. Faizan Ahmed Khan has over 15+ years of rich work experience in health Insurance. Mr. Faizan has been associated with Crescent Care as Operation Manager since its inception. He played an instrumental role in setting up the departments. Prior to joining Crescent Care, Mr. Faizan worked at senior level positions which includes his role as a Senior Manager at Health econnex Pvt Ltd the first operational TPA in Pakistan.", 
      imgaddress: "assets/images/faizan.jpeg",
      experience: "15+ years",
      ),
      ContainerSlider(
      name: "SHAHZAD AHMED", 
      designation: "OPERATION MANAGER", 
      description: "Mr. Shahzad Ahmed with him over 13 years of experience in health insurance. His key areas of expertise are product development and operations management. He has developed health insurance products for various stakeholders and multi-national corporations. He held Management positions at Pakistan’s first operational TPA, Insurance Brokerage firms and health insurance companies.", 
      imgaddress: "assets/images/shahzad.jpg",
      experience: "13+ years",
      ),
   
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }
 int activePage = 0;
@override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: images.length, 
            itemBuilder: (context,index,realIndex){
              
              return images[index];
            }, 
            options: CarouselOptions(   
              scrollDirection: Axis.vertical,
              height: 550.h,
              autoPlay: true,
              reverse: true,
              autoPlayInterval: Duration(seconds: 5),
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            )),
            SizedBox(height: 10.h,),
            // buildIndicator()
        ],
      ),
    );

      
  }
  Widget buildImage(String img , int index)=> Container(
        color: Colors.grey,
        child:  Image.asset(img,fit: BoxFit.cover,width:double.infinity,),
      );
  Widget buildIndicator()=> AnimatedSmoothIndicator( 
    activeIndex:activeIndex, count: images.length,
    effect:  JumpingDotEffect(
      dotHeight: 5.h,
      dotColor: Color(0xffafc4dd),
      dotWidth: 5.w,
      activeDotColor: Color(0xff164584)
    ),
    
    
   );   
}


class ContainerSlider extends StatelessWidget {
  String name;
  String designation;
  String description;
  String imgaddress;
  String experience;
   ContainerSlider({super.key,required this.name,required this.designation,required this.description,required this.imgaddress,required this.experience});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity.h,
      width: double.infinity.w,
      color: Colors.transparent,
      child: Stack(  
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.1, 0.5],
                    colors: [
                      Color(0xff164584),
                      Color.fromARGB(255, 64, 119, 187)
                    ],
                  ),
                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
          
                    ],
                  ),
                  )
                ),
          
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(height: 50.h,),
                      
                      SizedBox(height: 8.h,),
                      TT(head: "${name}", color:  Color(0xff2b578e) ),
                      SizedBox(height: 2.h,),
                      TD(head: "${designation}", color:Color.fromARGB(255, 113, 111, 111)),
                      SizedBox(height: 2.h,),
                      TD(head: "abc123def@gmail.com", color:Color(0xff2b578e)),
                      SizedBox(height: 2.h,),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                        child: Container(
                          width: double.infinity,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:Colors.white,
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
                             child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SubTT(head: "Experience:", color: Color(0xff2b578e)),
                                SubTT(head: "${experience}", color: Color(0xff2b578e))
                              ],
                             ),
                              ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.w),
                        child: Container(
                          child: Text(
                            "${description}",
                            textAlign: TextAlign.justify,
                            style:GoogleFonts.montserrat(
                              textStyle: TextStyle(color: Color(0xff2b578e), letterSpacing: .5,fontSize: 12.sp,fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  )
                ),
             
            ],
          
            
          ),
           Align(
                 alignment: Alignment.topCenter,
                 child: Padding(
                   padding:  EdgeInsets.only(top:20.h),
                   child: Container(
                    height: 200.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffA4A4A4),
                          blurRadius: 6.0,
                          spreadRadius: 1.0,
                          offset: Offset(0.0, 0.0),
                          // Shadow position
                        ),
                      ],
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: AssetImage(
                            '${imgaddress}'),
                        fit: BoxFit.fill,
                      ),
                    ),
                   ),
                 ),
              )
        ],
      ),
    );
  }
}