import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/widgets/heading3B.dart';
import 'package:project1/widgets/chead2.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../widgets/NHD.dart';
import '../../widgets/blueLabels.dart';
import '../../widgets/boldHeading4.dart';


class MedicineOrderDetail extends StatefulWidget {
  const MedicineOrderDetail({super.key});

  @override
  State<MedicineOrderDetail> createState() => _MedicineOrderDetailState();
}

class _MedicineOrderDetailState extends State<MedicineOrderDetail> {
   late TooltipBehavior _tooltipBehavior;

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
    final Provider11 = Provider.of<Provider1>(context); 
    Provider11.medicines.clear();
    Provider11.med_detail.clear();
    Navigator.pop(context); // Do some stuff.
    return true;
  }
  Widget build(BuildContext context) {

    final Provider11 = Provider.of<Provider1>(context); 
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(  
        backgroundColor:Colors.white ,
         appBar: AppBar(
        backgroundColor: Color(0xff2b578e),
            title:const Text("Medicines Orders"),
            leading: IconButton(
                icon:const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () async{
                  Provider11.medicines.clear();
                  Provider11.med_detail.clear();
                 
                  Navigator.of(context).pop();

                    
  
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
                            columnSpacing: 14,
                            dataRowHeight: 50,
                            headingRowHeight: 70,
                            
                            columns: [
                               DataColumn(
                                label: BHeading4(head: "Sno.",),
                                
                                ),
                              DataColumn(
                                label: BHeading4(head: "Name",)
                                ),
                              DataColumn(
                                label: BHeading4(head: "Prescr",)
                                ),
                              DataColumn(
                                label: BHeading4(head: "Status",)
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
                                                title: BHeading3(head: "Your Prescription"),
                                                content: Image.network(e.PrescriptionUrl.toString()),
                                                actions: <Widget>[
                                                  ElevatedButton(
                                                     style: ElevatedButton.styleFrom(
                                                    backgroundColor: Color(0xff164584),
                                                      shape: RoundedRectangleBorder(                       
                                                        borderRadius: BorderRadius.circular(20),
                                                      ),
                                                    ),
                                                    child:const Text('OK'),
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
    ) ));
  }
}