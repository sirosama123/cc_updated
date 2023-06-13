import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:project1/screens/dashboard.dart';
import 'package:project1/screens/notification.dart';
import 'package:project1/screens/subscreens/appointment.dart';
import 'package:project1/screens/subscreens/labPrescription.dart';
import 'package:project1/screens/subscreens/prescription.dart';
import 'package:project1/widgets/slider.dart';
import 'package:project1/widgets/squares.dart';
import 'package:hellodoc_service_pkg/main.dart';
import 'package:hellodoc_service_pkg/screens/HomeScreen.dart';
import 'package:provider/provider.dart';

import 'Provider/provider1.dart';
import 'appointmentBook.dart/appointmentHosp.dart';
import 'appointmentDisclaimer.dart';


class OutPatient extends StatefulWidget {
  const OutPatient({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _OutPatientState createState() => _OutPatientState();
}
void abcd() async {
                                  WidgetsFlutterBinding.ensureInitialized();
                                  runApp(HDApp());
                              }
class _OutPatientState extends State<OutPatient> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  bool abc = false;
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
            backgroundColor: Color(0xff2b578e),
            title: Text("Out Patient Services"),
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
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Home",
        useSafeArea: true, // default: true, apply safe area wrapper
        labels: const ["Home", "Notification", "Dashboard"],
        icons: const [Icons.home,Icons.notifications,  Icons.dashboard],
       tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: Colors.white,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: Colors.white,
        tabIconSelectedColor: Color(0xff2b578e),
        tabBarColor: Color(0xff2b578e),
        onTabItemSelected: (int value) {
          setState(() {
            _tabController!.index = value;
          });
        },
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(), 
        controller: _tabController,
        children: <Widget>[
         Landing1(),
         Notificationss(),
         Dashboard(count: 0,)
        ],
      ),
    );
  }
}


class Landing1 extends StatefulWidget {
  const Landing1({super.key});

  @override
  State<Landing1> createState() => _Landing1State();
}

class _Landing1State extends State<Landing1> {
  @override
  bool abc = false;
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
    var hospcities;
    var data1;
    getDataInsured(String? cnic) async {
      Provider11.data1=[];
      final dio = Dio();
      try {
          setState(() {
            abc=true;
          });
        final response = await dio.get(
            'https://script.google.com/macros/s/AKfycbwhf6DqjHQAWYToV7AZVhe-p_T_TgfIoV7sclnN4PJtOR60IA5BEfHNzVXOFkv2R0HOmQ/exec?headcnic=$cnic'
            );
        if (response.statusCode == 200) {
          final data = response.data;
          data1=response.data['data'];
          Provider11.data1= response.data;
          print(data['data'][0]);
          print(data1);
          setState(() {
            abc=false;
          });
          
        } else {
          print('API request failed with status code ${response.statusCode}');
          setState(() {
            abc=false;
          });
        }
      } catch (e) {
        print('Error retrieving data from API: $e');
        print('Data not exist');
        setState(() {
            abc=false;
          });
      }
    }
    getPanelHospitals() async {
    await  getDataInsured(Provider11.cnic);
      final dio = Dio();
      try {
          setState(() {
            abc=true;
          });
        final response = await dio.get(
            'https://script.google.com/macros/s/AKfycbzZ2utHnysZGpU5ZYZQn3so8FNFU3ys2mFtbmpEQbYONyXiXzHAapbUWWsQnnpowgunAg/exec');
        if (response.statusCode == 200) {
          final data = response.data;
          hospcities=response.data;
          print(data['data'][0]);
          print(hospcities['data'].runtimeType);
          data1.isEmpty? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AppointmentDisclaimer())): Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MemberHospitalsApointment(hospitalcities: hospcities['data'],)));
              setState(() {
            abc=false;
          });
        } else {
          print('API request failed with status code ${response.statusCode}');
          setState(() {
            abc=false;
          });
        }
      } catch (e) {
        print('Error retrieving data from API: $e');
        print('Data not exist');
        setState(() {
            abc=false;
          });
      }
    }
      return  Stack(
        children: [
          Scaffold(
             
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10.h,),
                      Slider23(),
                      SizedBox(height: 10.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 24.w),
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                             
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    child: Squares(imgAddress: 'assets/images/medicine.png', heading: "Medicine at your Doorstep"),
                                    onTap: (){
                                            Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => Prescription()));
                                    },
                                    ),
                                  GestureDetector(child: Squares(imgAddress: "assets/images/doctor.png", heading: "Doctor Online"),
                                  onTap: (){
                                        

                                        WidgetsFlutterBinding.ensureInitialized();
                                        runApp(HDApp());
                                      // Navigator.push(context,
                                      // MaterialPageRoute(builder: (context) => HomeScreen()));
                                  },),
                                ],
                              ),
                              SizedBox(height: 17.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    child: Squares(imgAddress: "assets/images/flask.png", heading: "Lab at your Doorstep"),
                                    onTap: (() {
                                       Navigator.push(context,
                                       MaterialPageRoute(builder: (context) => LabPrescription()));
                                    }),
                                    ),
                                  GestureDetector(
                                    child: Squares(imgAddress: "assets/images/bookapp.png", heading: "Appointment Services"),
                                    onTap: ()async{
                                      if (Provider11.usage=="cooperative") {
                                        await getPanelHospitals();
                                      } else {
                                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AppointmentDisclaimer()));
                                      }
                                      // Navigator.push(context,
                                      // MaterialPageRoute(builder: (context) => ComingSoon(PageName: "Appointment Services")));
                                    },
                                    )
                                ],
                              ),
              
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
              abc==true? Align(
              alignment: Alignment.center,
              child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.4),
                  
                  child: Center(
                    child: Container(
                      height: 80.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white,width: 1),
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.transparent
                      ),
                      child: Center(
                        child: CircularProgressIndicator(color: Colors.white,),
                      ),
                    ),
                  ),
                ),
            ):Container(),
        ],
      );
  
  }
}