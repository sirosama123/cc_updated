import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/memberLogin/profile.dart';
import 'package:project1/screens/profile.dart';
import 'package:project1/screens/subscreens/labOrderDetails.dart';
import 'package:project1/screens/subscreens/medicineOrdersDetail.dart';
import 'package:project1/widgets/dbSquares.dart';
import 'package:project1/widgets/heading3B.dart';
import 'package:project1/widgets/chead2.dart';
import 'package:project1/widgets/smallDBsquare.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../widgets/hosdept.dart';
import '../../widgets/hospitalName.dart';
import '../../widgets/multi3.dart';
import '../widgets/memberPageBars.dart';


class HsptlDependentsDataAppointment extends StatefulWidget {
  String? hsptlName;
  String? drName;
  String? dptName;
  String? date_of_appointment;
  HsptlDependentsDataAppointment({super.key,required this.hsptlName,required this.date_of_appointment,required this.dptName,required this.drName});

  @override
  State<HsptlDependentsDataAppointment> createState() => _HsptlDependentsDataAppointmentState();
}

class _HsptlDependentsDataAppointmentState extends State<HsptlDependentsDataAppointment> {
  @override
  bool abc = false;
  bool state2 = false;
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
      
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff2b578e),
          title: Text("Dependents"),
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
          body:
           Stack(
             children: [
               SingleChildScrollView(
                 child: Column(
                   children: [
                      SizedBox(height: 5.h,),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                       Multi3(color: Color(0xff2b578e), subtitle: "Doctor Name", weight: FontWeight.bold, size: 16),
                                        SizedBox(width: 5.w,),
                                        Container(
                                           width: 200.w,
                                          child: Multi3(color: Color(0xff2b578e), subtitle: widget.drName.toString(), weight: FontWeight.bold, size: 16)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                   padding:  EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Divider(color: Color(0xff2b578e),),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Multi3(color: Color(0xff2b578e), subtitle: "Hospital Name", weight: FontWeight.bold, size: 16),
                                        SizedBox(width: 5.w,),
                                        Container(
                                          width: 200.w,
                                          child: Multi3(color: Color(0xff2b578e), subtitle: widget.hsptlName.toString(), weight: FontWeight.bold, size: 16)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Divider(color: Color(0xff2b578e),),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Multi3(color: Color(0xff2b578e), subtitle: "Dept Name", weight: FontWeight.bold, size: 16),
                                        SizedBox(width: 5.w,),
                                        Container(
                                           width: 200.w,
                                          child: Multi3(color: Color(0xff2b578e), subtitle: widget.dptName.toString(), weight: FontWeight.bold, size: 16)),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Divider(color: Color(0xff2b578e),),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Multi3(color: Color(0xff2b578e), subtitle: "Date Of Appointment", weight: FontWeight.bold, size: 16),
                                        SizedBox(width: 5.w,),
                                        Container(
                                          width: 160.w,
                                          child: Multi3(color: Color(0xff2b578e), subtitle: widget.date_of_appointment.toString().substring(0,11), weight: FontWeight.bold, size: 16)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.h,),
                     ListView.builder(
                      shrinkWrap: true,
                       physics: NeverScrollableScrollPhysics(),
                      itemCount: Provider11.data1['data'].length,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                    Provider11.data1['data'][index]['Relation'].toString()=='SELF'?Image.asset("assets/images/self.png",height: 20.h,width: 20.w,):Provider11.data1['data'][index]['Relation'].toString()=='SPOUSE'?Image.asset("assets/images/spouse.png",height: 20.h,width: 20.w,):Provider11.data1['data'][index]['Relation'].toString()=='SON'?Image.asset("assets/images/son.png",height: 20.h,width: 20.w,):Image.asset("assets/images/daughter.png",height: 20.h,width: 20.w,),
                                      SizedBox(width: 5.w,),
                                      Multi3(color: Colors.white, subtitle: Provider11.data1['data'][index]['Relation'].toString(), weight: FontWeight.bold, size: 16),
                                    ],
                                  ),
                                  Divider(color: Colors.white,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi3(color: Colors.white, subtitle: "Name", weight: FontWeight.bold, size: 16),
                                      SizedBox(width: 5.w,),
                                      Multi3(color: Colors.white, subtitle: Provider11.data1['data'][index]['Name'].toString(), weight: FontWeight.bold, size: 16),
                                    ],
                                  ),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi3(color: Colors.white, subtitle: "CNIC", weight: FontWeight.bold, size: 16),
                                      SizedBox(width: 5.w,),
                                      Multi3(color: Colors.white, subtitle: Provider11.data1['data'][index]['CNIC'].toString()==''?"-------------":Provider11.data1['data'][index]['CNIC'].toString(), weight: FontWeight.bold, size: 16),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(),
                                       NeumorphicButton(
                        
                            margin: EdgeInsets.only(top: 12),
                            onPressed: ()async {
                              showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        content: Multi3(
                          color: Color(0xff2b578e), 
                          subtitle: "Do you want to Book Appointment for ${Provider11.data1['data'][index]['Name'].toString()} ?", weight: FontWeight.bold, size: 12),
                      
                        actions: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: NeumorphicButton(
                              onPressed: ()async{
                                setState(() {
                                  state2=true;
                                });
                                  final HttpsCallable callable = FirebaseFunctions.instance.httpsCallable('sendEmail');
                              final response = await callable.call(
                               <String, dynamic>{
                                'email': 'Hello@crescentcare.pk',
                                'cc':"crescentcareapp@gmail.com",
                                'subject': 'Request for an Appointment Booking',
                                'body': '''
                                  Patient Name : ${Provider11.data1['data'][index]['Name'].toString()}
                                  Patient Age : ${Provider11.data1['data'][index]['Age'].toString()}
                                  Patient Cnic : ${Provider11.data1['data'][index]['CNIC'].toString()}
                                  Patient Gender : ${Provider11.data1['data'][index]['Gender'].toString()}
                                  Employee name : ${Provider11.first} ${Provider11.last}
                                  Employee Email : ${Provider11.email}
                                  Employee Cnic : ${Provider11.cnic}
                                  Employee Phone : ${Provider11.number}
                                  Health Code : ${Provider11.data1['data'][index]['healthcode'].toString()}
                                  Plan Code : ${Provider11.data1['data'][index]['PlanCode'].toString()}
                                  Relation : ${Provider11.data1['data'][index]['Relation'].toString()}
                                  Appointment Date : ${widget.date_of_appointment.toString().substring(0,11)},
                                  Doctor Name : ${widget.drName}
                                  Department Name : ${widget.dptName}
                                  Hospital Name : ${widget.hsptlName}
                                        ''',
                               },
                             );
                                DocumentReference appointments = FirebaseFirestore.instance.collection('appointments').doc(Provider11.uuid).collection("data").doc();
                                appointments.set({
                                                                                  "DoctorName" :' ${widget.drName}',
                                  "DepartmentName" : '${widget.dptName}',
                                  "HospitalName" : '${widget.hsptlName}',
                                                  "age": Provider11.data1['data'][index]['Age'].toString(), 
                                                  "cnic": Provider11.data1['data'][index]['CNIC'].toString(), 
                                                  "dn": Provider11.data1['data'][index]['DocumentNo'].toString(), 
                                                  "dob": Provider11.data1['data'][index]['Dob'].toString(),
                                                  "ed": Provider11.data1['data'][index]['EffectiveDate'].toString(), 
                                                  "gen": Provider11.data1['data'][index]['Gender'].toString(),
                                                  "hc": Provider11.data1['data'][index]['healthcode'].toString(), 
                                                  "idate": Provider11.data1['data'][index]['IssueDate'].toString(), 
                                                  "name": Provider11.data1['data'][index]['Name'].toString(),
                                                  "pc": Provider11.data1['data'][index]['PlanCode'].toString(),
                                                  "relation": Provider11.data1['data'][index]['Relation'].toString(),
                                                  "hsptlName": widget.hsptlName,
                                                  "btn":"disabled",
                                                  "current_uid":appointments.id,
                                                  "appointment_date":widget.date_of_appointment.toString().substring(0,11),
                                                  "status":"pending",
                                                  "remaining":(double.parse(Provider11.planAmount.toString())-double.parse(Provider11.utilizedAmount.toString())).toString(),
                                }); 
                          
                                 final appointments_admin = FirebaseFirestore.instance.collection('appointments_admin').doc(appointments.id);
                                 appointments_admin.set({
                                               "DoctorName" :' ${widget.drName}',
                                  "DepartmentName" : '${widget.dptName}',
                                  "HospitalName" : '${widget.hsptlName}',
                                                  "user_uid":Provider11.uuid,
                                                  "employee_name":'${Provider11.first} ${Provider11.last}',
                                                  "age": Provider11.data1['data'][index]['Age'].toString(), 
                                                  "cnic": Provider11.data1['data'][index]['CNIC'].toString(), 
                                                  "dn": Provider11.data1['data'][index]['DocumentNo'].toString(), 
                                                  "dob": Provider11.data1['data'][index]['Dob'].toString(),
                                                  "ed": Provider11.data1['data'][index]['EffectiveDate'].toString(), 
                                                  "gen": Provider11.data1['data'][index]['Gender'].toString(),
                                                  "hc": Provider11.data1['data'][index]['healthcode'].toString(), 
                                                  "idate": Provider11.data1['data'][index]['IssueDate'].toString(), 
                                                  "name": Provider11.data1['data'][index]['Name'].toString(),
                                                  "pc": Provider11.data1['data'][index]['PlanCode'].toString(),
                                                  "relation": Provider11.data1['data'][index]['Relation'].toString(),
                                                  "hsptlName": widget.hsptlName,
                                                  "btn":"disabled",
                                                  "doc_uid":appointments.id,
                                                  "appointment_date":widget.date_of_appointment.toString().substring(0,11)
                                                  ,"status":"pending"
                                 });
                                 setState(() {
                                  state2=false;
                                });
                                 setState(() {
                                   abc=true;
                                 });
                                 Navigator.of(ctx).pop();
                            QuerySnapshot snapshot = await FirebaseFirestore.instance
                     .collection('appointments_admin')
                     .get();
                            print(snapshot.size);
                              },
                            style: NeumorphicStyle(
                                shadowLightColor: Color(0xff2b578e),
                                color: Color(0xff2b578e),
                                shape: NeumorphicShape.flat,
                                boxShape:
                                    NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                                //border: NeumorphicBorder()
                              ),
                              padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
                              child: Multi3(color:Colors.white , subtitle: "Yes", weight: FontWeight.bold, size: 12)
                              ),
                          ),
                             Padding(
                               padding:EdgeInsets.all(8.0),
                               child: NeumorphicButton(
                                
                                onPressed: (){
                                  Navigator.of(ctx).pop();
                                },
                                                 style: NeumorphicStyle(
                                                  color: Color(0xff2b578e),
                                shadowLightColor: Color(0xff2b578e),
                                shape: NeumorphicShape.flat,
                                boxShape:
                                    NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                                //border: NeumorphicBorder()
                                                   ),
                                                   padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
                                                   child: Multi3(color: Colors.white, subtitle: "No", weight: FontWeight.bold, size: 12)
                                                   ),
                             ),
                        ],
                      ),
                    );
               
                             
                                // Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //               builder: (context) => HsptlApproval(
                                //                 age: Provider11.data1['data'][index]['Age'].toString(), 
                                //                 cnic: Provider11.data1['data'][index]['CNIC'].toString(), 
                                //                 dn: Provider11.data1['data'][index]['DocumentNo'].toString(), 
                                //                 dob: Provider11.data1['data'][index]['Dob'].toString(),
                                //                 ed: Provider11.data1['data'][index]['EffectiveDate'].toString(), 
                                //                 gen: Provider11.data1['data'][index]['Gender'].toString(),
                                //                 hc: Provider11.data1['data'][index]['healthcode'].toString(), 
                                //                 idate: Provider11.data1['data'][index]['IssueDate'].toString(), 
                                //                 name: Provider11.data1['data'][index]['Name'].toString(),
                                //                 pc: Provider11.data1['data'][index]['PlanCode'].toString(),
                                //                 relation: Provider11.data1['data'][index]['Relation'].toString(), hsptlName: hsptlName,
                                //                 )));
                            },
                            style: NeumorphicStyle(
                              shadowLightColor: Colors.blue,
                              shape: NeumorphicShape.flat,
                              boxShape:
                                  NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                              //border: NeumorphicBorder()
                            ),
                            padding:  EdgeInsets.all(6.0),
                            child: Multi3(color: Color(0xff2b578e), subtitle: "Book", weight: FontWeight.bold, size: 12)
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
                            color: Color(0xff2b578e),
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
                      ),
                   ],
                 ),
               ),
               Align(
                alignment: Alignment.center,
                child:abc==true? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color:Color(0xff2b578e).withOpacity(0.5) ,
                  child: Center(
                    child: Padding(
                      padding:EdgeInsets.symmetric(horizontal: 20.w),
                      child: Container(
                        height: 130.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Multi3(
                                  color:Color(0xff2b578e) , 
                                  subtitle: "Your Request Has Been Sent To Crescent Care Helpline, They Will Get Back To You With a Confirmation Call.", 
                                  weight: FontWeight.bold, 
                                  size: 12),
                                SizedBox(height: 5.h,),
                                Padding(
                               padding:EdgeInsets.all(8.0),
                               child: NeumorphicButton(
                                
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                                 style: NeumorphicStyle(
                                                  color: Color(0xff2b578e),
                                shadowLightColor: Color(0xff2b578e),
                                shape: NeumorphicShape.flat,
                                boxShape:
                                    NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                                //border: NeumorphicBorder()
                                                   ),
                                                   padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 5.h),
                                                   child: Multi3(color: Colors.white, subtitle: "Go Back", weight: FontWeight.bold, size: 12)
                                                   ),
                             ),
                              ],
                            ),
                            
                          ),
                        ),
                      ),
                    ),
                  ),
                ):Container(),
               ),
                 state2==true? Align(
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
           )




      
    );
  }
}