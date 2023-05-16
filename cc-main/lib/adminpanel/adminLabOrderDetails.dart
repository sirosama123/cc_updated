import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/adminpanel/adminFirstLanding.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/widgets/NHD.dart';
import 'package:project1/widgets/heading3B.dart';
import 'package:project1/widgets/chead2.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../widgets/blueLabels.dart';
import '../../widgets/boldHeading4.dart';
import '../screens/subscreens/subscreenWidgets/TTB.dart';
import '../widgets/NotificatioHead.dart';
import '../widgets/toosmall.dart';



class AdminLabOrderDetail extends StatefulWidget {
  const AdminLabOrderDetail({super.key});

  @override
  State<AdminLabOrderDetail> createState() => _AdminLabOrderDetailState();
}

class _AdminLabOrderDetailState extends State<AdminLabOrderDetail> {
  late TooltipBehavior _tooltipBehavior;
      void initState() {
    _tooltipBehavior = TooltipBehavior(
                enable: true,               
              );
    
     super.initState();
    
    BackButtonInterceptor.add(myInterceptor);
    } 
  @override
   
   

  @override
  void dispose() {
    
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => AdminfirstLanding(tab: 0)));
    return true;
  }
  bool load = false;
    @override
  
  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
     void update(String stat,String uid) async{
      try {
         FirebaseFirestore db = FirebaseFirestore.instance;
          db.collection("labs").doc(uid).update({
          "status":stat
        });
      } catch (e) {
        
      }
    }
     Future getData()async{
      setState(() {
        load=true;
      });
      try {
         FirebaseFirestore.instance
    .collection('labs')
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
         
            Provider11.lab_dates.add(doc["recieving_date"].toString().substring(0,11));
            Provider11.patient_names_lab.add(doc["patient_name"].toString());
            Provider11.patients_age_lab.add(doc["age"].toString());
            Provider11.prescription_url_lab.add(doc["url"].toString());
            Provider11.status_lab.add(doc["status"].toString());
            Provider11.uid_lab.add(doc["uid"].toString());
        });
    });
   
    await  Future.delayed(const Duration(seconds: 1)); 
     Provider11.labDetail();
    Provider11.lab();
    await  Future.delayed(const Duration(seconds: 1)); 
    await  Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => super.widget));
      } catch (e) {
        
      }
    }
    clear(){
      Provider11.serialNo_lab.clear();
      Provider11.patient_names_lab.clear();
      Provider11.patients_age_lab.clear();
      Provider11.prescription_url_lab.clear();
      Provider11.status_lab.clear();
      Provider11.uid_lab.clear();
      Provider11.labs.clear();
      Provider11.lab_detail.clear();
      Provider11.lab_dates.clear();
    }
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(  
        backgroundColor:Colors.white ,
         appBar: AppBar(
        backgroundColor: Color(0xff2b578e),
            title: Text("Laboratory Orders"),
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                
                    
                  onPressed: () async{
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => AdminfirstLanding(tab: 0)));
  
                }
                )
            
          ),
          body: SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.vertical,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 0.w),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Theme(
                            data: Theme.of(context).copyWith(
                                dividerColor: Color(0xff2b578e)
                            ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                          child: DataTable(
                            columnSpacing: 14,
                            dataRowHeight: 50,
                            headingRowHeight: 70,
                            
                            columns: [
                               DataColumn(
                                label: BHeading4(head: "Sno.",),
                                
                                ),
                              DataColumn(
                                label: Padding(
                                   padding:  EdgeInsets.only(left: 3.w),
                                  child: BHeading4(head: "Name",),
                                )
                                ),
                
                              DataColumn(
                                label: BHeading4(head: "Prescr",)
                                ),
                              DataColumn(
                                label: Padding(
                                  padding:  EdgeInsets.only(left: 17.w),
                                  child: BHeading4(head: "Status",),
                                )
                                ),
                              DataColumn(
                                label: Padding(
                                  padding:  EdgeInsets.only(left: 5.w),
                                  child: BHeading4(head: "Set",),
                                )
                                ),

                            ], 
                            rows: Provider11.lab_detail.map(
                              (e) => DataRow(
                                cells: [
                                  DataCell(
                                    Center(child: BlueLabelss(lab: e.serial.toString())),
                                  ),
                                  DataCell(
                                    Center(child: BlueLabelss(lab: e.PatientNameLab.toString())),
                                  ),
                                  DataCell(
                                    Center(
                                      child: GestureDetector(
                                        onTap: (){
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: BHeading3(head: "Your Prescription"),
                                                content: Image.network(e.PrescriptionUrlLab.toString()),
                                                actions: <Widget>[
                                                  ElevatedButton(
                                                     style: ElevatedButton.styleFrom(
                                                    backgroundColor: Color(0xff164584),
                                                      shape: RoundedRectangleBorder(                       
                                                        borderRadius: BorderRadius.circular(20),
                                                      ),
                                                    ),
                                                    child: Text('OK'),
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Container( 
                                          height: 30.h,
                                          width: 30.h,
                                          decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          image: new DecorationImage(
                                              image: new NetworkImage(e.PrescriptionUrlLab.toString()),
                                              fit: BoxFit.fill,
                                          )
                                          )),
                                      ),
                                    )
                                  ),
                                  DataCell(
                                    Center(
                                      child: Container(
                                        height: 20.h,
                                        width: 80.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: e.status=="pending"?Colors.amber:e.status=="cancelled"?Colors.red:Colors.green
                                        ),
                                        child:  Center(
                                          child:NHD(head: e.status.toString(), color: Colors.white)
                                        ),
                                      )
                                    ),
                                  ),
                                  DataCell(
                                    Container(
                                      height: 20.h,
                                      width: 40.w,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xff164584),
                                        padding: EdgeInsets.all(1),
                                          shape: RoundedRectangleBorder(                       
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                        ),
                                        child:TSB(head: "Alter", color: Colors.white),
                                        onPressed:(){
                                            load==false?showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: BHeading3(head: "Your Prescription"),
                                                content: Container(
                                                  height: 300.h,
                                                  width: double.infinity,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      GestureDetector(
                                                        child: Image.network(e.PrescriptionUrlLab.toString(),height: 200.h,width: 200.w,),
                                                        onTap: (){
                                                         
                                                            AlertDialog(
                                                                          title: Text('Welcome'),           // To display the title it is optional
                                                                          content: Text('GeeksforGeeks'),   // Message which will be pop up on the screen
                                                                                                              // Action widget which will provide the user to acknowledge the choice
                                                                          
                                                                        );
                                                        },
                                                        ),
                                                      Container(
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  NH(head: "Patient Name", color:Color(0xff164584)),
                                                                  NH(head: "${e.PatientNameLab}", color:Color(0xff164584)),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  NH(head: "Patient Age", color:Color(0xff164584)),
                                                                  NH(head: "${e.PatientAgeLab}", color:Color(0xff164584)),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  NH(head: "Status", color:Color(0xff164584)),
                                                                  NH(head: "${e.status}", color:Color(0xff164584)),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  NH(head: "OrderId", color:Color(0xff164584)),
                                                                  TS(head: "${e.uidLab}", color:Color(0xff164584)),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                  ),
                                                actions: <Widget>[
                                                  Center(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        ElevatedButton(
                                                     style: ElevatedButton.styleFrom(
                                                      
                                                    backgroundColor: Colors.green,
                                                    padding: EdgeInsets.all(1),
                                                      shape: RoundedRectangleBorder(                       
                                                        borderRadius: BorderRadius.circular(20),
                                                      ),
                                                    ),
                                                    child:TSB(head: "Delievered", color: Colors.white),
                                                    onPressed: () {
                                                      update("delievered", e.uidLab);
                                                      clear();
                                                      getData();
                                                      
                                                    },
                                                  ),
                                                  SizedBox(width: 5.w,),
                                                  ElevatedButton(
                                                     style: ElevatedButton.styleFrom(
                                                      
                                                    backgroundColor: Colors.amber,
                                                    padding: EdgeInsets.all(1),
                                                      shape: RoundedRectangleBorder(                       
                                                        borderRadius: BorderRadius.circular(20),
                                                      ),
                                                    ),
                                                    child:TSB(head: "Pending", color: Colors.white),
                                                    onPressed: () async{
                                                      update("pending", e.uidLab);
                                                      clear();
                                                      getData();
                                                      Future.delayed(const Duration(seconds: 5)); 
                                                    },
                                                  ),
                                                   SizedBox(width: 5.w,),
                                                  ElevatedButton(
                                                     style: ElevatedButton.styleFrom(
                                                      
                                                    backgroundColor: Colors.red,
                                                    padding: EdgeInsets.all(1),
                                                      shape: RoundedRectangleBorder(                       
                                                        borderRadius: BorderRadius.circular(20),
                                                      ),
                                                    ),
                                                    child:TSB(head: "Cancel", color: Colors.white),
                                                    onPressed: () {
                                                      update("cancelled", e.uidLab);
                                                      clear();
                                                      getData();
                                                      Future.delayed(const Duration(seconds: 5)); 
                                                    },
                                                  ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              );
                                            },
                                          ):CircularProgressIndicator(color:Color(0xff164584),);
                                        },
                                      ),
                                    ),
                                  ),
                                ]
                                )
                              ).toList(),
                            
                            ),
                        ),
                      ),
                 
                        Container(
                           decoration: BoxDecoration(
                              color: Colors.white,
                               boxShadow: [
                                BoxShadow(
                                  color: Color(0xffA4A4A4),
                                  blurRadius: 6.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0.0, 0.0),
                                  // Shadow position
                                ),
                              ],
                               borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(60),
                                  topLeft: Radius.circular(60),
                                ),
                            ),
                                              
                              child: Padding(
                                padding:  EdgeInsets.symmetric(vertical: 10.h),
                                child: Column(
                                  children: [
                                    CHeading2(head: "Online Lab Test Orders", color: Colors.black),
                                    SizedBox(height: 10.h,),
                                     Container(
                                      height: 200.h,
                                        child: SfCartesianChart(
                                          
                                          plotAreaBackgroundColor: Color(0xffafc4dd),
                                          
                          primaryXAxis: CategoryAxis(
                          
                          ),
                                           
                         tooltipBehavior: _tooltipBehavior,
                          series: <CartesianSeries>[
                            
                              ColumnSeries<Labs, String>(
                                animationDuration: 2000,
                                enableTooltip: true, 
                                  dataSource: Provider11.labs,
                                  xValueMapper: (Labs data, _) => data.date,
                                  yValueMapper: (Labs data, _) => data.count,
                                  // Map color for each data points from the data source
                                 
                                  width: 0.4, 
                                  // Spacing between the bars
                                  spacing: 0.3 ,
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  color: Color(0xff164584),
                                  xAxisName: "Service"
                                  
                              )
                          ]
                                            )
                                    )
                                          ],
                                        ),
                              ),
                            ) ,] ),
                )
          )
      ),
    ) ));
  }
}