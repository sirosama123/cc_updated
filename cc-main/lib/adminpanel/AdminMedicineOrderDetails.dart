import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/adminpanel/AdminDashboard.dart';
import 'package:project1/adminpanel/adminFirstLanding.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/subscreens/subscreenWidgets/TTB.dart';
import 'package:project1/widgets/NHD.dart';
import 'package:project1/widgets/heading3B.dart';
import 'package:project1/widgets/chead2.dart';
import 'package:project1/widgets/toosmall.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../widgets/blueLabels.dart';
import '../../widgets/boldHeading4.dart';
import '../widgets/NotificatioHead.dart';


class AdminMedicineOrderDetail extends StatefulWidget {
  const AdminMedicineOrderDetail({super.key});

  @override
  State<AdminMedicineOrderDetail> createState() => _AdminMedicineOrderDetailState();
}

class _AdminMedicineOrderDetailState extends State<AdminMedicineOrderDetail> {
   late TooltipBehavior _tooltipBehavior;
   bool load = false;
    @override
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
  Widget build(BuildContext context) {
    

   
    final Provider11 = Provider.of<Provider1>(context); 

    void update(String stat,String uid) async{
      try {
         FirebaseFirestore db = FirebaseFirestore.instance;
          db.collection("medicines").doc(uid).update({
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
    .collection('medicines')
    .get()
    .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
         
            Provider11.med_dates.add(doc["recieving_date"].toString().substring(0,11));
            Provider11.patient_names.add(doc["patient_name"].toString());
            Provider11.patients_age.add(doc["age"].toString());
            Provider11.prescription_url.add(doc["url"].toString());
            Provider11.status.add(doc["status"].toString());
            Provider11.uid_med.add(doc["uid"].toString());
        });
    });
   
    await  Future.delayed(const Duration(seconds: 1)); 
     Provider11.medDetail();
    Provider11.med();
    await  Future.delayed(const Duration(seconds: 1)); 
    await  Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => super.widget));
      } catch (e) {
        
      }
    }
    clear(){
      Provider11.serialNo_med.clear();
      Provider11.patient_names.clear();
      Provider11.patients_age.clear();
      Provider11.prescription_url.clear();
      Provider11.status.clear();
      Provider11.uid_med.clear();
      Provider11.medicines.clear();
      Provider11.med_detail.clear();
      Provider11.med_dates.clear();
    }
    
    return  Scaffold(  
        backgroundColor:Colors.white ,
         appBar: AppBar(
        backgroundColor: Color(0xff2b578e),
            title:const Text("Medicines Orders"),
            leading: IconButton(
                icon:const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () async{
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => AdminfirstLanding(tab: 0)));
  
                })
            
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
                            columnSpacing: 17,
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
                            rows: Provider11.med_detail.map(
                              (e) => DataRow(
                                cells: [
                                  DataCell(
                                    Center(child: BlueLabelss(lab: e.serial.toString())),
                                  ),
                                  DataCell(
                                    Center(child: BlueLabelss(lab: e.PatientName.toString())),
                                  ),
                                  DataCell(
                                    Center(
                                      child: GestureDetector(
                                        onTap: (){
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: BHeading3(head: "Prescription Image"),
                                                content: Image.network(e.PrescriptionUrl.toString()),
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
                                          image:  DecorationImage(
                                              image:  NetworkImage(e.PrescriptionUrl.toString()),
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
                                       
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: e.status=="pending"?Colors.amber:e.status=="cancelled"?Colors.red:Colors.green
                                        ),
                                        child:  Center(
                                          child:TSB(head: e.status.toString(), color: Colors.white)
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
                                                        child: Image.network(e.PrescriptionUrl.toString(),height: 200.h,width: 200.w,),
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
                                                                  NH(head: "${e.PatientName}", color:Color(0xff164584)),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  NH(head: "Patient Age", color:Color(0xff164584)),
                                                                  NH(head: "${e.PatientAge}", color:Color(0xff164584)),
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
                                                                  TS(head: "${e.uidMed}", color:Color(0xff164584)),
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
                                                 Row(
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
                                                      update("delievered", e.uidMed);
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
                                                      update("pending", e.uidMed);
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
                                                      update("cancelled", e.uidMed);
                                                      clear();
                                                      getData();
                                                      Future.delayed(const Duration(seconds: 5)); 
                                                    },
                                                  ),
                                                  ],
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
                                ),
                               
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
                                    CHeading2(head: "Online Medicine Orders", color: Colors.black),
                                    SizedBox(height: 10.h,),
                                     Container(
                                      height: 200.h,
                                        child: SfCartesianChart(
                                          
                                          plotAreaBackgroundColor: Color(0xffafc4dd),
                                          
                          primaryXAxis: CategoryAxis(
                          
                          ),                                 
                         tooltipBehavior: _tooltipBehavior,
                          series: <CartesianSeries>[                 
                              ColumnSeries<Medicine, String>(
                                animationDuration: 2000,
                                enableTooltip: true, 
                                  dataSource: Provider11.medicines,
                                  xValueMapper: (Medicine data, _) => data.date,
                                  yValueMapper: (Medicine data, _) => data.count,
                                  width: 0.4, 
                                  spacing: 0.3 ,
                                  borderRadius: const BorderRadius.all(Radius.circular(15)),
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
    ) );
  }
}