import 'dart:core';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/subscreens/BMIresult.dart';
import 'package:project1/widgets/heading2.dart';
import 'package:project1/widgets/links.dart';
import 'package:project1/widgets/nheading2.dart';
import 'package:project1/widgets/square_head.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:wheel_chooser/wheel_chooser.dart';
import '../../widgets/boldHeading1.dart';
import 'package:number_selection/number_selection.dart';

class BMIinput extends StatefulWidget {
  const BMIinput({super.key});

  @override
  State<BMIinput> createState() => _BMIinputState();
}

class _BMIinputState extends State<BMIinput> {
    @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.pop(context); // Do some stuff.
    return true;
  }

  TextEditingController age = TextEditingController(text: "20");
  TextEditingController weight = TextEditingController(text: "50");
  int? gen = 0 ;
  int _height_inch = 8;
  int _height_feet = 0;

 
  @override
  Widget build(BuildContext context) {
  final Provider11 = Provider.of<Provider1>(context); 
    return  Scaffold(
         appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
            
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        backgroundColor: Color(0xff2b578e),
            title: Text("BMI"),
             actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search,color: Colors.white,),
            
            onPressed: () {},
          ), ]
          ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                            
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                               boxShadow: [
                                BoxShadow(
                                  color: Color(0xffA4A4A4),
                                  blurRadius: 6.0.r,
                                  spreadRadius: 1.0.r,
                                  offset: Offset(0.0, 0.0),
                                  // Shadow position
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  gen=0;
                                });
                              },
                              child: CircleAvatar(
                                radius: 70.r,
                                backgroundImage:AssetImage("assets/images/mstudent.png"),
                                backgroundColor: gen==0?Colors.blue:Colors.grey
                              ),
                            ),
                          ),
                          Heading2(head: "Male")
                        ],
                      ),
            
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                               boxShadow: [
                                BoxShadow(
                                  color: Color(0xffA4A4A4),
                                  blurRadius: 6.0.r,
                                  spreadRadius: 1.0.r,
                                  offset: Offset(0.0, 0.0),
                                  // Shadow position
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {

                                  gen=1;
                                });
                              },
                              child: CircleAvatar(
                                radius: 70.r,
                                backgroundImage:AssetImage("assets/images/fstudent.png"),
                                backgroundColor: gen==1?Colors.blue:Colors.grey
                              ),
                            ),
                          ),
                          Heading2(head: "Female")
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    width: double.infinity,
                    // height: 130.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffA4A4A4),
                          blurRadius: 6.0.r,
                          spreadRadius: 1.0.r,
                          offset: Offset(0.0, 0.0),
                          // Shadow position
                        ),
                      ],
                      
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 15.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                            
              SizedBox(width: 20.w,),
             
                            ],
                          ),
                           NHeading2(head: "HEIGHT"),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               BHeading1(head: "${_height_inch} . ${_height_feet}",color: Color(0xff164584),),
                               Links(head: "ft")
                             ],
                           ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                                Column(
                                  children: [
                                    Center(
                child: Container(
                  height: 50.h,
                  width: 100.w,
                  child: NumberSelection(
                    
                    theme: NumberSelectionTheme(
                      
                       draggableCircleColor: Color(0xff2b578e),
                        iconsColor: Colors.white,
                        numberColor: Colors.white,
                        backgroundColor: Color.fromARGB(255, 102, 139, 185),
                        outOfConstraintsColor: Colors.deepOrange),
                    initialValue: _height_inch,
                    
                    minValue: 1,
                    maxValue: 8,
                    direction: Axis.horizontal,
                    withSpring: true,
                    onChanged: (int value) => setState(() {
                      _height_inch=value;
                    }),
                    enableOnOutOfConstraintsAnimation: true,
                    onOutOfConstraints: () =>
                        print("This value is too high or too low"),
                  ),
                ),
              ),
              SizedBox(height: 3.h,),
              Links(head: "feet")
                                  ],
                                ),
            
                Column(
                  children: [
                    Center(
                    child: Container(
                      height: 50.h,
                      width: 100.w,
                      child: NumberSelection(
                        
                        theme: NumberSelectionTheme(
                          
                            draggableCircleColor: Color(0xff2b578e),
                            iconsColor: Colors.white,
                            numberColor: Colors.white,
                            backgroundColor: Color.fromARGB(255, 102, 139, 185),
                            outOfConstraintsColor: Colors.deepOrange),
                        initialValue: _height_feet,
                        
                        minValue: 0,
                        maxValue: 11,
                        direction: Axis.horizontal,
                        withSpring: true,
                        onChanged: (int value) => setState(() {
                          _height_feet=value;
                        }),
                        enableOnOutOfConstraintsAnimation: true,
                        onOutOfConstraints: () =>
                            print("This value is too high or too low"),
                      ),
                    ),
              ),
              SizedBox(height: 3.h,),
              Links(head: "inch")
                  ],
                ),
                            ],
                           )
                          //  SfSlider(
                          //   min: 1,
                          //   max: 8.11,
                          //   value: _height,
                          //   interval: 0.01,
                          //   showTicks: false,
                          //   showLabels: false,
                          //   activeColor: Color(0xff164584),
                          //   semanticFormatterCallback: (dynamic value){
                          //     return 'The selected value is $value';
                          //   },
                          //   onChanged: (dynamic newValue) {
                          //     setState(() {
                          //       _height = newValue;
                          //     });
                          //   },
                          // ),

                       
            
                        ],
                      ),
                    )
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 150.h,
                        width:150.w ,
                        decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffA4A4A4),
                          blurRadius: 6.0.r,
                          spreadRadius: 1.0.r,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],         
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NHeading2(head: "Age"),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Container(
                                width: 50.w,
                                child: TextField(
                                style: GoogleFonts.montserrat(
                                textStyle: TextStyle(color: Color(0xff164584), 
                                letterSpacing: 1,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w900) ),
                                textAlign: TextAlign.center,
      
                                  controller: age,
                                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                                  inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4),
                          ],
                                ),
                                
                          ),
                          Links(head: "yrs")
                             ],
                           ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                 decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                 boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffA4A4A4),
                                    blurRadius: 6.0.r,
                                    spreadRadius: 1.0.r,
                                    offset: Offset(0.0, 0.0),
                                    // Shadow position
                                  ),
                                ],
                              ),
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                     age.text = (int.parse(age.text.toString())+1).toString();
                                    });
                                  },
                                  child: CircleAvatar(
                                    radius: 20.r,
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage("assets/images/plus.png"),
                                  ),
                                )
                              ),
                               Container(
                                 decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                 boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffA4A4A4),
                                    blurRadius: 6.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(0.0, 0.0),
                                  ),
                                ],
                              ),
                                child: GestureDetector(
                                  onTap: (){
                                    age.text = (int.parse(age.text.toString())-1).toString();
                                  },
                                  child: CircleAvatar(
                                    radius: 20.r,
                                    backgroundImage: AssetImage("assets/images/minus.png"),
                                    backgroundColor: Colors.white,
                                  ),
                                )
                              )
                            ],
                          ),
                         
            
                        ],
                      ),
                    ),
                      ),
                       Container(
                        height: 150.h,
                        width:150.w ,
                        decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffA4A4A4),
                          blurRadius: 6.0.r,
                          spreadRadius: 1.0.r,
                          offset: Offset(0.0, 0.0),
                          // Shadow position
                        ),
                      ],         
                    ),
                    child:
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column( mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NHeading2(head: "Weight"),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Container(
                                  width: 50.w,
                                  child: TextField(
                                  style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(color: Color(0xff164584), 
                                  letterSpacing: 1,
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w900) ),
                                  textAlign: TextAlign.center,
      
                                    controller: weight,
                                    keyboardType: TextInputType.numberWithOptions(decimal: false),
                                    inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(4),
                            ],
                                  ),
                            ),
                            Links(head: "kg")
                               ],
                             ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                   decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                   boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffA4A4A4),
                                      blurRadius: 6.0.r,
                                      spreadRadius: 1.0.r,
                                      offset: Offset(0.0, 0.0),
                                    ),
                                  ],
                                ),
                                  child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                       weight.text = (int.parse(weight.text.toString())+1).toString();
                                      });
                                    },
                                    child: CircleAvatar(
                                      radius: 20.r,
                                      backgroundColor: Colors.white,
                                      backgroundImage: AssetImage("assets/images/plus.png"),
                                    ),
                                  )
                                ),
                                 Container(
                                   decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                   boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffA4A4A4),
                                      blurRadius: 6.0.r,
                                      spreadRadius: 1.0.r,
                                      offset: Offset(0.0, 0.0),
                                    ),
                                  ],
                                ),
                                  child: GestureDetector(
                                    onTap: (){
                                      weight.text = (int.parse(weight.text.toString())-1).toString();
                                    },
                                    child: CircleAvatar(
                                      radius: 20.r,
                                      backgroundImage: AssetImage("assets/images/minus.png"),
                                      backgroundColor: Colors.white,
                                    ),
                                  )
                                )
                              ],
                            ),
                           
            
                          ],
                        ),
                    ),),
                      
                    ],
                  ),
                  SizedBox(height:20.h ,),
                  Container(
                                height: 50.h,
                                width: double.infinity,
                                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff164584),
                                      shape: RoundedRectangleBorder(                       
                                        borderRadius: BorderRadius.circular(20.r),
                                      ),
                                    ),
                                  child:  TitleHeading(head: 'Calculate BMI',),
                                  onPressed: () {
                                      if (gen==0) {
                                        Provider11.BMIgen = "male";
                                      } else {
                                        Provider11.BMIgen = "female";
                                      }
                                      Provider11.bmiAge= int.parse(age.text);
                                      Provider11.finalWeight_kg = double.parse(weight.text.toString());
                                      Provider11.hei_ft = double.parse("${_height_inch.toString()}.${_height_feet.toString()}");
                                      Provider11.finalHeight_m = double.parse("${_height_inch.toString()}.${_height_feet.toString()}")*0.304;
                                      Provider11.BMI();
                                      Provider11.EstWeight();
                                      print('${Provider11.estWeight} est weight');
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => BMIresult()),);
                                    
                                  },
                                )
                            ),
                ],
              ),
            ),
          ),
        ),
     
    );
       
  }
}