import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:project1/screens/dashboard.dart';
import 'package:project1/screens/memberPage.dart';
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
      body: Landing1(),
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

    var planData;
var claims;
  UtilizationData(String? plan) async {
      final dio = Dio();
      try {
          setState(() {
            abc=true;
          });
        final response = await dio.get(
            'https://script.google.com/macros/s/AKfycbyPDQT__HMAQRKzW08vwrGTzHt4XcuYZFn1-cF-nDpNk4T8sLaP58TnUeQzImnMbnG-Yw/exec?plan=${plan}');
         final response2 = await dio.get(
            'https://script.google.com/macros/s/AKfycbxBCsQO0T1K94xMb2v-TRlXUrCxQpIJpgRLwgdV6hcpx2XnY69uKRuRcXYLyF48NBCR/exec?member_id=${Provider11.empId}');
        if (response.statusCode == 200 && response2.statusCode == 200) {
          final data = response.data;
          planData=response.data;
          




          final data2 = response2.data;
          claims=response2.data;
          List<double> amount = [];
          List<dynamic> claim2 = claims['data'];
          List<info> abc = [];
          List<info2> profile = [];
          List<String> names = [];
          List<info3> completeData = [];
          for (var i = 0; i < Provider11.data1['data'].length; i++) {
            profile.add(info2(
              name: Provider11.data1['data'][i]['Name'], 
              gender: Provider11.data1['data'][i]['Gender'], 
              relation: Provider11.data1['data'][i]['Relation']
              ));
              
            print("${profile[i].name}----> name");
          }
          for (var i = 0; i < claim2.length; i++) {
            abc.add(info(name: claim2[i]['patient_name'], gender: "claim2[i]['']", amount: double.parse(claim2[i]['claim_amount'].toString())));
            names.add( claim2[i]['patient_name']);
          }
          Set<String> uniqueNames = Set<String>.from(names);
          List<String> resultNames = uniqueNames.toList();
           List<info> finals = [];
            for (var element in abc) {
    int index = finals.indexWhere((info) => info.name == element.name);
    if (index != -1) {
      finals[index].amount = (finals[index].amount ?? 0) + (element.amount ?? 0);
    } else {
      finals.add(info(name: element.name, gender: element.gender, amount: element.amount));
    }
  }



for (var i = 0; i < profile.length; i++) {
  if (resultNames.contains(profile[i].name)) {
   int j = resultNames.indexOf(profile[i].name.toString());
    completeData.add(info3(name: profile[i].name, gender: profile[i].gender, relation: profile[i].relation, amount: finals[j].amount));
    amount.add(finals[j].amount!);
  } else {
    completeData.add(info3(name: profile[i].name, gender: profile[i].gender, relation: profile[i].relation, amount: 0));
  }
  print("${completeData[i].name}======>name"+"\n"+"${completeData[i].gender}======>gender"+"\n"+"${completeData[i].amount}======>amount");
}


double sum = amount.fold(0, (double previousValue, double currentElement) => previousValue + currentElement);
Provider11.planAmount=planData['data'][0]['outPatient'].toString();
Provider11.utilizedAmount=sum.toString();
print(sum);
print(planData['data'][0]['outPatient'].toString());

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
      setState(() {
            abc=false;
          });
    }


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
          await UtilizationData(data['data'][0]['PlanCode'].toString());
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
                                         Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => HDApp()));
                                 
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