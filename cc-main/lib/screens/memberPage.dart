import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/memberLogin/pharmacyCities.dart';
import 'package:project1/screens/memberLogin/profile.dart';
import 'package:provider/provider.dart';
import '../widgets/memberPageBars.dart';
import '../widgets/memberPageBars2.dart';
import 'memberLogin/center1.dart';
import 'memberLogin/city.dart';
import 'memberLogin/labCities.dart';
import 'memberLogin/myClaims.dart';
import 'memberLogin/utilization.dart';
import 'memberLogin2/claimdata.dart';

class MemberPage extends StatefulWidget {
    var utilizedHistory;
  String? pcode;
  double? totalAmount;
  double? totalUtilized;
  var planData;
   MemberPage({super.key,required this.pcode,required this.planData,required this.totalAmount,required this.totalUtilized,required this.utilizedHistory});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
   bool abc = false;
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
    var data1;
    var pharmacities;
    var labcities;
    var planData;
    var hospcities;
    sendMail()async{
      final Email email = Email(
  recipients: ['hello@crescentcare.pk'],
  isHTML: false,
);

await FlutterEmailSender.send(email);
    }
    getDataInsured(String? cnic) async {
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
          // Provider11.data1= response.data;
          print(data['data'][0]);
          print(data1);
          setState(() {
            abc=false;
          });
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => MemberPage()));
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

     getPanelCitiesLabs() async {
      final dio = Dio();
      try {
          setState(() {
            abc=true;
          });
        final response = await dio.get(
            'https://script.google.com/macros/s/AKfycbzu4_1I9V2L9W7ZPMgKDiTBOqVhsr7xyMyaiiqusHoNvuRXSPZV0N6FXjvNY4NTul5K/exec');
        if (response.statusCode == 200) {
          final data = response.data;
          labcities=response.data;
          print(data['data'][0]);
          print(labcities['data'].runtimeType);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LabCities(labcities: labcities['data'],)));
              EasyLoading.dismiss();
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




    getPanelCitiesHsptls() async {
      final dio = Dio();
      try {
          setState(() {
            abc=true;
          });
        final response = await dio.get(
            'https://script.google.com/macros/s/AKfycbyIGkzACG40DEox2Twfud51iFcuVXj7iuinfvdMPfswQpwYzbg3FcHZmMfG5BYMbumU/exec');
        if (response.statusCode == 200) {
          final data = response.data;
          hospcities=response.data;
          print(data['data'][0]);
          print(hospcities['data'].runtimeType);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>CenterPage(hospcities: hospcities['data'],)
               ));
              EasyLoading.dismiss();
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




   var claims;
    getClaims() async {
      final dio = Dio();
      try {
          setState(() {
            abc=true;
          });
        final response = await dio.get(
            'https://script.google.com/macros/s/AKfycbxBCsQO0T1K94xMb2v-TRlXUrCxQpIJpgRLwgdV6hcpx2XnY69uKRuRcXYLyF48NBCR/exec?member_id=${Provider11.empId}');
        if (response.statusCode == 200) {
          final data = response.data;
          claims=response.data;
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
            for (var i = 0; i < abc.length; i++) {
              print(abc[i].amount);
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
print(sum);


















          // print(claims['data'].runtimeType);
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => ClaimData(claimdata: claims['data'],)));
          EasyLoading.dismiss();
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



   UtilizationData(String? plan) async {
    Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => Utilization(pcode: widget.pcode, totalAmount: widget.totalAmount, totalUtilized: widget.totalUtilized, utilizedHistory: widget.utilizedHistory, planData: widget.planData,)));
    }













    getPanelCitiesPharmacy() async {
      final dio = Dio();
      try {
          setState(() {
            abc=true;
          });
        final response = await dio.get(
            'https://script.google.com/macros/s/AKfycbww0kAWZP3ylfs9GqmwrB7keeItJ990Q0TRoYQ32Mgu35zF_70-CKB31KhYwskyWXyS/exec');
        if (response.statusCode == 200) {
          final data = response.data;
          pharmacities=response.data;
          print(data['data'][0]);
          print(pharmacities['data'].runtimeType);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PharmaCities(pharmacities: pharmacities['data'],)));
              EasyLoading.dismiss();
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




    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff2b578e),
          title: Text("Member's Page"),
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
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 150.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                            image: AssetImage("assets/images/banner.png"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GestureDetector(
                    onTap: (){
                       getPanelCitiesHsptls();
                    },
                    child: MemberPageBar1(
                      heading: 'Panel Hospitals      ',
                      imgAddress: 'assets/images/hospital.png',
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GestureDetector(
                    onTap: (){
                        getPanelCitiesLabs();
                    },
                    child: MemberPageBar1(
                      heading: 'Panel Laboratories',
                      imgAddress: 'assets/images/laboratory.png',
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GestureDetector(
                    onTap: (){
                      print("${Provider11.data1} here is data");
                      getPanelCitiesPharmacy();
                    },
                    child: MemberPageBar1(
                      heading: 'Panel Pharmacies',
                      imgAddress: 'assets/images/pharmacy.png',
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                                        GestureDetector(
                    onTap: (){
                        // Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => MyClaims()));
                        getClaims();
                    },
                        child: MemberPageBar2(
                            imgAddress: "assets/images/claim.png",
                            heading: "My Claims"),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      GestureDetector(
                        onTap: () async{
                          print(Provider11.data1);
                          print(Provider11.data1.length);
                          await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MemberProfile(
                                          data1: Provider11.data1,
                                            )));
                        },
                        child: MemberPageBar2(
                            imgAddress: "assets/images/user.png",
                            heading: "My Profile"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                                        GestureDetector(
                    onTap: (){
                        
                        UtilizationData(Provider11.pcode);
                    },
                        child: MemberPageBar2(
                            imgAddress: "assets/images/utilization.png",
                            heading: "Utilization"),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      GestureDetector(
                        onTap: () async{
                          print(Provider11.data1);
                          print(Provider11.data1.length);
                        sendMail();
                        },
                        child: MemberPageBar2(
                            heading: 'Contact',
                        imgAddress: 'assets/images/telephone1.png',),
                      )
                    ],
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
      ),
    ),
    
    );
  }
}


//claims data with total amounts
class info{
  String? name;
  String? gender;
  double? amount;
  info({required this.name,required this.gender,required this.amount});
}

// profile data
class info2{
  String? name;
  String? gender;
  String? relation;
  info2({required this.name,required this.gender,required this.relation});
}

//combined profile data
class info3{
  String? name;
  String? gender;
  String? relation;
  double? amount;
  info3({required this.name,required this.gender,required this.relation,required this.amount});
}

