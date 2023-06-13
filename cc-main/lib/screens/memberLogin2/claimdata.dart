import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:provider/provider.dart';
import '../../widgets/multi3.dart';
import 'approval2.dart';
import 'claimDetail.dart';



class ClaimData extends StatelessWidget {
  var claimdata;
  ClaimData({super.key,required this.claimdata});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff2b578e),
          title: Text("Your Claims"),
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
          body: ListView.builder(
            itemCount: claimdata.length,
            itemBuilder: (context,index){
              return Padding(
                padding:EdgeInsets.only(top: 5.h,right: 10.w,left: 10.w),
                child: Neumorphic(
                
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: Container(
                    
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(height: 5.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                         Multi3(color: Colors.white, subtitle: "Claim Number", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 2.w,),
                            Multi3(color: Colors.white, subtitle: claimdata[index]['claim_no'].toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                        Divider(color: Colors.white,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "Patient Name", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle: claimdata[index]['patient_name'].toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "Relation", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle: claimdata[index]['relation'].toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "Claim Amount", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle: claimdata[index]['claim_amount'].toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                             NeumorphicButton(
              
                  margin: EdgeInsets.only(top: 12),
                  onPressed: () {
                    
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ClaimDetails(
                                      claim_no: claimdata[index]['claim_no'].toString(), 
                                      claim_status: claimdata[index]['claim_status'].toString(), 
                                      deduction: claimdata[index]['remarks'].toString(), 
                                      diagnosis: claimdata[index]['diagnosis'].toString(),
                                       outPatient: claimdata[index]['patient_name'].toString(), 
                                       patient_name: claimdata[index]['patient_name'].toString(), 
                                       provider_detail: claimdata[index]['provider'].toString(), 
                                       relation: claimdata[index]['relation'].toString(), 
                                      service_code: claimdata[index]['service_code'].toString(), 
                                      rejected:  claimdata[index]['dissallow'].toString(), 
                                      claim_amount:  claimdata[index]['claim_amount'].toString(), 
                                      claim_recieved_date: claimdata[index]['claim_recieved_date'].toString(), 
                                      date_of_claim_paid:  claimdata[index]['date_claim_paid'].toString(), 
                                      date_of_treatment:  claimdata[index]['date_treatment'].toString(), 
                                      payable_amount:  claimdata[index]['payable_amount'].toString(),
                                      )));
                  },
                  style: NeumorphicStyle(
                    shadowLightColor: Colors.blue,
                    shape: NeumorphicShape.flat,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                    //border: NeumorphicBorder()
                  ),
                  padding:  EdgeInsets.all(6.0),
                  child: Multi3(color: Color(0xff2b578e), subtitle: "Details", weight: FontWeight.bold, size: 12)
                  ),
                          ],
                        ),
                        SizedBox(height: 5.h,)
                      ],
                    ),
                  ),
                ),
              
                
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  // shadowDarkColor: Color.fromARGB(255, 0, 38, 69),
                  color: Color(0xff2b578e),
                  // shadowLightColor: Color.fromARGB(255, 0, 38, 69),
                  lightSource: LightSource.bottomRight,
                  depth: -20,
                  disableDepth: false,
                  border: NeumorphicBorder(
                  color: Color(0x33000000),
                  width: 0.1,
                  
                )),
                          ),
              );
            }
            )
    );
  }
}