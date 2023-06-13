import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:provider/provider.dart';
import '../../widgets/multi3.dart';
import 'approval2.dart';

class ClaimDetails extends StatelessWidget {
  String? claim_no;
  String? patient_name;
  String? relation;
  String? provider_detail;
  String? diagnosis;
  String? service_code;
  String? outPatient;
  String? deduction;
  String? claim_amount;
  String? payable_amount;
  String? rejected;
  String? claim_recieved_date;
  String? date_of_treatment;
  String? date_of_claim_paid;
  String? claim_status;

  ClaimDetails({super.key,
  required this.claim_no,
  required this.claim_status,
  required this.deduction,
  required this.diagnosis,
  required this.outPatient,
  required this.patient_name,
  required this.provider_detail,
  required this.relation,
  required this.service_code,
  required this.claim_amount,
  required this.payable_amount,
  required this.rejected,
  required this.claim_recieved_date,
  required this.date_of_treatment,
  required this.date_of_claim_paid,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff2b578e),
          title: Text("Claim Detail"),
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
          body: Padding(
                padding:EdgeInsets.only(top: 5.h,right: 10.w,left: 10.w),
                child: Neumorphic(
                
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: Container(
                    height: 410.h,
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(height: 5.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "Claim Number", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 2.w,),
                            Multi3(color: Colors.white, subtitle: claim_no.toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                        Divider(color: Colors.white,),
                       
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "Patient Name", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle: patient_name.toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "Relation", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle: relation.toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                           Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "Diagnosis", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle:diagnosis.toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "Provider Detail", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle:provider_detail.toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "Service Code", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle: service_code.toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),








   Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "Claim Amount", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle:claim_amount.toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "Payable Amount", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle:payable_amount.toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "Deduction/Rejected", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle:rejected.toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                          

                             Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "Claim Recieved Date", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle:claim_recieved_date.toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "Date of Treatment", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle:date_of_treatment.toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                         date_of_claim_paid=='N/A'?Container(): Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "Date of Claim Paid", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle:date_of_claim_paid.toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                          











                          
                  
                         
                        deduction=="N/A"?Container(): Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "Remarks", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle:deduction.toString(), weight: FontWeight.bold, size: 16),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.white, subtitle: "Claim Status", weight: FontWeight.bold, size: 16),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle:claim_status.toString(), weight: FontWeight.bold, size: 16),
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
              ),
    );
  }
}


