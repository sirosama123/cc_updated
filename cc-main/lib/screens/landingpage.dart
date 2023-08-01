import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/screens/activities.dart';
import 'package:project1/screens/adminpanel.dart';
import 'package:project1/screens/outPatient.dart';
import 'package:project1/screens/patientServices.dart';
import 'package:project1/screens/subscreens/activities.dart';
import 'package:project1/screens/subscreens/appointment.dart';
import 'package:project1/screens/subscreens/push.dart';
import 'package:project1/screens/testing1.dart';
import 'package:project1/widgets/slider.dart';
import 'package:project1/widgets/squares.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'Provider/provider1.dart';
import 'downloadCards/allCards.dart';
import 'downloadCards/landingCard.dart';
import 'downloadCards/pdf1.dart';
import 'memberLogin/memberLoginDisclaimer.dart';
import 'memberLogin2/memberPage2.dart';
import 'memberPage.dart';
import 'package:http/http.dart' as http;

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  bool abc = false;
  Widget build(BuildContext context) {
       var utilizedHistory;
  String? pcode;
  double? totalAmount;
  double? totalUtilized;
    var planData;
     var claims;
    final Provider11 = Provider.of<Provider1>(context);
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
          try {
            for (var i = 0; i < Provider11.data1['data'].length; i++) {
            profile.add(info2(
              name: Provider11.data1['data'][i]['Name'], 
              gender: Provider11.data1['data'][i]['Gender'], 
              relation: Provider11.data1['data'][i]['Relation']
              ));
              
            print("${profile[i].name}----> name");
          }
          } catch (e) {
            print("error at 1");
          }
         try {
            for (var i = 0; i < claim2.length; i++) {
            abc.add(info(name: claim2[i]['patient_name'], gender: "claim2[i]['']", amount: double.parse(claim2[i]['claim_amount'].toString())));
            names.add( claim2[i]['patient_name']);
            
          }
         } catch (e) {

           print("error at 2");
         }
          Set<String> uniqueNames = Set<String>.from(names);
          List<String> resultNames = uniqueNames.toList();
          List<info> finals = [];
      
          try {
                     for (var element in abc) {
    int index = finals.indexWhere((info) => info.name == element.name);
    if (index != -1) {
      finals[index].amount = (finals[index].amount ?? 0) + (element.amount ?? 0);
    } else {
      finals.add(info(name: element.name, gender: element.gender, amount: element.amount));
    }
  }
          print("FINAL LENGTH ${finals.length} ABC LENGTH ${abc.length}");
          } catch (e) {
           
          }



try {
  for (var i = 0; i < profile.length; i++) {
  if (resultNames.contains(profile[i].name)) {
   int j = resultNames.indexOf(profile[i].name.toString());
    completeData.add(info3(name: profile[i].name, gender: profile[i].gender, relation: profile[i].relation, amount: finals[j].amount));
    amount.add(finals[j].amount!);
  } else {
    completeData.add(info3(name: profile[i].name, gender: profile[i].gender, relation: profile[i].relation, amount: 0));
  }
  // print("${completeData[i].name}======>name"+"\n"+"${completeData[i].gender}======>gender"+"\n"+"${completeData[i].amount}======>amount");
}
} catch (e) {
  print("error at 4");
}


try {
  double sum = amount.fold(0, (double previousValue, double currentElement) => previousValue + currentElement);
Provider11.planAmount=planData['data'][0]['outPatient'].toString();
Provider11.utilizedAmount=sum.toString();
print(sum);
print(planData['data'][0]['outPatient'].toString());
pcode = Provider11.pcode;
totalAmount = sum;
totalUtilized= sum;
utilizedHistory= completeData;
planData= planData['data'];

} catch (e) {
  print("error at 5");
}



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
      final dio = Dio();
      try {
        setState(() {
          abc=true;
        });
        final response = await dio.get(
            'https://script.google.com/macros/s/AKfycbyo0wI08qmH1T4u55gdGY3dQiC4IeuvpoCqouJcp87Zt7KMNUPKR7wGG35VDBRaaMPMRw/exec?headcnic=$cnic');
        // EasyLoading.dismiss();
        if (response.statusCode == 200) {
          final data = response.data;
          Provider11.data1 = data;
          Provider11.empId=data['data'][0]['empId'].toString();
          Provider11.pcode=data['data'][0]['PlanCode'].toString();
          await UtilizationData(data['data'][0]['PlanCode'].toString());
          data['data'].isEmpty?Navigator.push(
              context, MaterialPageRoute(builder: (context) => MemberDisclaimer())):Navigator.push(
              context, MaterialPageRoute(builder: (context) => MemberPage(pcode: Provider11.pcode, totalAmount: totalAmount, totalUtilized: totalUtilized, utilizedHistory: utilizedHistory, planData: planData,)));
          
        } else {
          print('API request failed with status code ${response.statusCode}');
        }
        setState(() {
          abc=false;
        });
      } catch (e) {
        print('Error retrieving data from API: $e');
        print('Data not exist');
        setState(() {
          abc=false;
        });
      }
    }

    getCardData(String cid) async {
      final dio = Dio();
      try {
        setState(() {
          abc=true;
        });
        EasyLoading.show(
          status: 'loading...',
          maskType: EasyLoadingMaskType.black,

        );
        final response = await dio.get(
            'https://script.google.com/macros/s/AKfycbyBJNKGuO1bUOdaXPGt_i1ZvKkOK3HYl-26QPZdbZ-_M2JBLFKOCjqam_ZPkG6CdWfqnA/exec?cardId=$cid');
        setState(() {
          abc=false;
        });
        if (response.statusCode == 200) {
          final data = response.data;
          Provider11.policyData = data['data'];
          print(data['data'][0]);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LandingCard()));
        } else {
           setState(() {
          abc=false;
        });
          print('API request failed with status code ${response.statusCode}');
        }
        EasyLoading.dismiss();
      } catch (e) {
         setState(() {
          abc=false;
        });
      }
    }

    return  Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
           
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Slider23(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: GestureDetector(
                                    child: Squares(
                                        imgAddress: 'assets/images/healthcare.png',
                                        heading: "In-Patient Services"),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Services1()));
                                    },
                                  ),
                                  onTap: () {},
                                  splashColor: Color(0xff2b578e),
                                  highlightColor: Color(0xff2b578e),
                                ),
                                InkWell(
                                  child: GestureDetector(
                                    child: Squares(
                                        imgAddress: "assets/images/medicine.png",
                                        heading: "Out-Patient Services"),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => OutPatient()));
                                    },
                                  ),
                                  onTap: () {},
                                  splashColor: Color(0xff2b578e),
                                  highlightColor: Color(0xff2b578e),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: GestureDetector(
                                    child: Squares(
                                        imgAddress: "assets/images/permission.png",
                                        heading: "Member Login"),
                                    onTap: () async {
                                      // print(Provider11.med_dates);
                                      // print(Provider11.lab_dates);
                                      // Provider11.medLab();
                                      // print(Provider11.medlabs);
                                      // print(Provider11.cnic);
                                      if (Provider11.usage == "international") {
                                        getCardData(Provider11.policy.toString());
                                      } else {
                                        // EasyLoading.show(
                                        //   status: 'loading...',
                                        //   maskType: EasyLoadingMaskType.black,
                                        // );
                                        getDataInsured(Provider11.cnic);
                                      }
                                    },
                                  ),
                                  onTap: () {},
                                  splashColor: Color(0xff2b578e),
                                  highlightColor: Color(0xff2b578e),
                                ),
                                InkWell(
                                  child: GestureDetector(
                                    child: Squares(
                                        imgAddress: "assets/images/activities.png",
                                        heading: "Activities"),
                                    onTap: () async {
                                       Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Activities1()));
                                      // DatabaseReference ref = FirebaseDatabase
                                      //     .instance
                                      //     .ref("local_users");
                                      // await ref
                                      //     .child('42201-3260358-9')
                                      //     .onValue
                                      //     .listen((event) {
                                      //   Map<dynamic, dynamic> data = event.snapshot
                                      //       .value as Map<dynamic, dynamic>;
                                      //   Provider11.data2 = data;
                                      //   print(data.keys);
                                      // });

                                      // DatabaseReference ref2 = FirebaseDatabase
                                      //     .instance
                                      //     .ref("hospitals");
                                      // await ref2.onValue.listen((event) {
                                      //   Map<dynamic, dynamic> hsptl = event.snapshot
                                      //       .value as Map<dynamic, dynamic>;
                                      //   Provider11.hsptl_data = hsptl;
                                      //   print("${hsptl}-------->");
                                      // });

                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) => MemberPage2()));
                                    },
                                  ),
                                  onTap: () {},
                                  splashColor: Color(0xff2b578e),
                                  highlightColor: Color(0xff2b578e),
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
        ),
  
      
    );
  }
}
