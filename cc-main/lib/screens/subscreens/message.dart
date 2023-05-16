import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/screens/subscreens/subscreenWidgets/TD.dart';
import 'package:project1/screens/subscreens/subscreenWidgets/TT.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../widgets/square_head.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
            child: Column(
              children: [
                SizedBox(height: 15.h,),
                  Container(
                  height: 30.h,
                  width: double.infinity,
                  color: Color(0xff164584),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 7.h),
                    child: TitleHeading(head: "CEO'S message"),
                  ),
                ),
                SizedBox(height: 15.h,),
                Testimonal(
                  bgcolor:Color(0xff244094).withOpacity(0.1) ,
                  imgAddress: "assets/images/muneer.jpg",
                  name: "Muneer Ahmed Khan", 
                  designation: "CHEIF EXECUTIVE OFFICER", 
                  message: "We live in an ever-changing environment and healthcare depends on us. In consumer-centric healthcare, more and more people need access to healthcare due to technological advances and an increase in chronic diseases. Crescent Care Health TPA is well-positioned to meet the challenges and changes ahead and to strategically plan for the future. But none of this would be possible without the amazing team at Crescent Care."),
                 SizedBox(height: 15.h,),
                  Container(
                  height: 30.h,
                  width: double.infinity,
                  color: Color(0xff164584),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 7.h),
                    child: TitleHeading(head: " BOARD OF DIRECTORS "),
                  ),
                ),
                SizedBox(height: 15.h,),
               const Slider25(),
                SizedBox(height: 15.h,),
              ],
            ),
          ),
        ) ,
      ),
    );
  }
}


class Testimonal extends StatelessWidget {
  String name;
  String designation;
  String message;
  String imgAddress;
  Color bgcolor;
  Testimonal({super.key,required this.name,required this.designation,required this.message,required this.imgAddress,required this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgcolor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Color(0xff2b578e),
                    child:CircleAvatar(  
                      radius: 32,
                      backgroundColor: Colors.white,
                      child:Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                '${imgAddress}'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TT(head: name, color: Color.fromARGB(255, 113, 111, 111)),
                      TD(head: designation, color: Color(0xff2b578e))
                    ],
                  )
                ],
              ),
              
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
              child: Container(
                height: 100.h, 
                width: double.infinity , 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: bgcolor,
                      boxShadow: [
                              BoxShadow(
                                color: bgcolor,
                                blurRadius: 6.0,
                                spreadRadius: 1.0,
                                offset: Offset(0.0, 0.0),
                                // Shadow position
                              ),]
                ),
                child: Center(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.w),
                    child: Text(
                                    "\"${message}\"",
                                    textAlign: TextAlign.justify,
                                    style:GoogleFonts.montserrat(
                                      textStyle: TextStyle(color: Color(0xff2b578e), letterSpacing: .5,fontSize: 8.sp,fontWeight: FontWeight.w500,fontStyle: FontStyle.italic),
                                    ),
                                  ),
                  ),
                ),
              ),
            )
      
          ],
        ),
      ),
    );
  }
}


class Slider25 extends StatefulWidget {
  const Slider25({super.key});

  @override
  State<Slider25> createState() => _Slider25State();
}

class _Slider25State extends State<Slider25> {
  @override
  
  late PageController _pageController;
  int activeIndex = 0;
  List messages = [
   Testimonal(bgcolor: Color(0xffD13225).withOpacity(0.1), name: "Imran Ali",imgAddress: "assets/images/user.png", designation: "Cheif Operating Officer", message: "Mr. Ali is the Chief Operating Officer at Centegy Technologies and has been with the company since 2010. During his tenure, he has led the implementation and support practices within the insurance and takaful solution division, and has also steered business development activities. Prior to joining Centegy, he worked in management consulting for over 13 years and was aligned with leading companies in USA and UK including Ernst & Young, Cap Gemini, and Motorola. He has an MBA from London Business School."),
   Testimonal(bgcolor: Color(0xff244094).withOpacity(0.1),name: "Ahmed Salahuddin",imgAddress: "assets/images/user.png", designation: "Mariner", message: "Ahmed Salahuddin, a Mariner, MBA, ACII, Associate in Claims, nearing 3 decades in the industry has had an illustrious career rising from Adamjee Insurance's head of Hull Portfolio, to assume the position of the Country Manager, Guardian Royal Exchange Assurance. He also incubated a new company PICIC Insurance and was the founding Chief Executive Officer and Managing Director of the entity for a decade. Presently he is working as head of International TPA Development at Manhattan Data Inc. Having handled large infrastructure projects in the power."),
   Testimonal(bgcolor: Color(0xff1C552A).withOpacity(0.1),name: "Ahmed Abdul Bari",imgAddress: "assets/images/user.png", designation: "entrepreneur", message: "Ahmad Abdul Bari, 64, (Bari Mian) hailing from one of the oldest families of the subcontinent (Ulama-e-Firangi Mahal, Lucknow) is a seasoned entrepreneur having dabbled in trading, real estate, travel, software and petroleum globally. He 'tasted blood' working with Saudi Conglomerate Zainal Alireza & Co. in the 70's and has never looked back since. Outside the Chairman's Chair, Bari Mian "),
   Testimonal(bgcolor: Color(0xffD13225).withOpacity(0.1),name: "Mr. Khalid Diwan",imgAddress: "assets/images/user.png", designation: "entrepreneuror", message: "Mr. Diwan has over 40 years of entrepreneurship experience and has successfully built several ventures from the ground-up. His track record includes partnerships with multinational corporations from over 10 countries and he is credited with introducing innovations to Pakistan that have transformed their respective industries. Prior to his transition to Crescent Care, he served as a Senior Executive Vice President for EFU General Insurance for over 10 years.")
   
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }
 int activePage = 0;
@override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: messages.length, 
          itemBuilder: (context,index,realIndex){
           
            return messages[index] ;
          }, 
          options: CarouselOptions(   
            height: 200.h,
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
          buildIndicator()
      ],
    );

      
  }
  Widget buildImage(String img , int index)=> Container(
        color: Colors.grey,
        child:  Image.asset(img,fit: BoxFit.cover,width:double.infinity,),
      );
  Widget buildIndicator()=> AnimatedSmoothIndicator( 
    activeIndex:activeIndex, count: messages.length,
    effect:  JumpingDotEffect(
      dotHeight: 5.h,
      dotColor: Color(0xffafc4dd),
      dotWidth: 5.w,
      activeDotColor: Color(0xff164584)
    ),
    
    
   );   
}