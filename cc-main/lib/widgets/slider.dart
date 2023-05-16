import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class Slider22 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: CarouselSlider(
        options: CarouselOptions(
          
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: [
          Image.asset("assets/images/f.jpeg"),
          Image.asset("assets/images/g.jpg"),
          Image.asset("assets/images/h.jpg"),
          Image.asset("assets/images/l.jpeg"),
          Image.asset("assets/images/j.png"),
          Image.asset("assets/images/k.jpg"),
        ],
      ),
    );
  }
}


class Slider23 extends StatefulWidget {
  const Slider23({super.key});

  @override
  State<Slider23> createState() => _Slider23State();
}

class _Slider23State extends State<Slider23> {
  @override
  
  late PageController _pageController;
  int activeIndex = 0;
  List<String> images = [
    "assets/images/f.jpeg",
    "assets/images/g.jpg",
    "assets/images/h.jpg",
    "assets/images/l.jpeg",
    "assets/images/j.png",
    "assets/images/k.jpg"
   
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
          itemCount: images.length, 
          itemBuilder: (context,index,realIndex){
            final img = images[index];
            return buildImage(img,index);
          }, 
          options: CarouselOptions(   
            height: 200.h,
            autoPlay: true,
            reverse: true,
            autoPlayInterval: Duration(seconds: 2),
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
    activeIndex:activeIndex, count: images.length,
    effect:  JumpingDotEffect(
      dotHeight: 5.h,
      dotColor: Color(0xffafc4dd),
      dotWidth: 5.w,
      activeDotColor: Color(0xff164584)
    ),
    
    
   );   
}