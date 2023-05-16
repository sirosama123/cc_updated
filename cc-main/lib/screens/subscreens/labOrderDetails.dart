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



class LabOrderDetail extends StatefulWidget {
  const LabOrderDetail({super.key});

  @override
  State<LabOrderDetail> createState() => _LabOrderDetailState();
}

class _LabOrderDetailState extends State<LabOrderDetail> {
   late TooltipBehavior _tooltipBehavior;

    @override
    void initState() {
    _tooltipBehavior = TooltipBehavior(
                enable: true,
                // Templating the tooltip
               
              );
    super.initState();
    } 
  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(  
        backgroundColor:Colors.white ,
         appBar: AppBar(
        backgroundColor: Color(0xff2b578e),
            title: Text("Laboratory Orders"),
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: (){
                    
                  Provider11.labs.clear();
                  Provider11.lab_detail.clear();
                 
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