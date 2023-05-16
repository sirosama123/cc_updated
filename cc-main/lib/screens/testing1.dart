
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project1/widgets/dbSquares.dart';
import 'package:project1/widgets/heading1.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'Provider/provider1.dart';


class MyWidget extends StatelessWidget {

  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    return Scaffold(
      appBar: AppBar(),
      body: DBsquare(mainhead: "mainhead", counts: 8778, bgColor: Colors.red, height: 100,width: 150,),
     
     
    );
  }
}

//  Container(
//       child: SfCartesianChart(
//             primaryXAxis: CategoryAxis(),
//             primaryYAxis: NumericAxis(minimum: 0, maximum: 10, interval: 1),
            
//             series: <CartesianSeries>[
//                             ColumnSeries<MedicineLabs, String>(
//                                 dataSource: Provider11.medlabs,
//                                 xValueMapper: (MedicineLabs data, _) => data.dateMedicine,
//                                 yValueMapper: (MedicineLabs data, _) => data.countMedicine,
//                                 color: Colors.red
//                             ),
//                             ColumnSeries<MedicineLabs, String>(
//                                 dataSource: Provider11.medlabs,
//                                 xValueMapper: (MedicineLabs data, _) => data.dateLab,
//                                 yValueMapper: (MedicineLabs data, _) => data.countLab,
//                                 color: Colors.blue
//                             ),
                           
//                         ]
//             ))