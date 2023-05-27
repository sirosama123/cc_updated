import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/profile.dart';
import 'package:project1/screens/subscreens/labOrderDetails.dart';
import 'package:project1/screens/subscreens/medicineOrdersDetail.dart';
import 'package:project1/widgets/dbSquares.dart';
import 'package:project1/widgets/heading3B.dart';
import 'package:project1/widgets/chead2.dart';
import 'package:project1/widgets/smallDBsquare.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tap_to_expand/tap_to_expand.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../widgets/multi3.dart';
import '../../widgets/multiText.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/initialScreen.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/aboutus.dart';
import 'package:project1/screens/firstLanding.dart';
import 'package:project1/screens/send.dart';
import 'package:project1/screens/splashScreen.dart';
import 'package:project1/screens/subscreens/appointment.dart';
import 'package:project1/screens/subscreens/map2.dart';
import 'package:project1/screens/subscreens/push.dart';
import 'package:project1/screens/subscreens/selectionCityDis.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:open_filex/open_filex.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/services.dart' show ByteData, Uint8List, rootBundle;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class MemberProfile extends StatelessWidget {
  var data1;

  MemberProfile({super.key, required this.data1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
          
              ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: int.parse(data1['data'].length.toString()),
                  itemBuilder: (BuildContext context, int index) {
                    final item = data1['data'][index];
                    return Container(
                      
                        child: Column(
                          children: [
                            TapToExpand(
                              color: Color(0xff2b578e),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.transparent.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              onTapPadding: 5,
                              closedHeight: 95.h,
                              scrollable: true,
                              borderRadius: 10,
                              openedHeight: 380.h,
                              content: Column(
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "CNIC",
                                          weight: FontWeight.bold,
                                          size: 10),
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "${item['CNIC'].toString()}",
                                          weight: FontWeight.bold,
                                          size: 10),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "Plan code",
                                          weight: FontWeight.bold,
                                          size: 10),
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "${item['PlanCode'].toString()}",
                                          weight: FontWeight.bold,
                                          size: 10),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "Member Code",
                                          weight: FontWeight.bold,
                                          size: 10),
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "${item['DocumentNo'].toString()}",
                                          weight: FontWeight.bold,
                                          size: 10),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "Issue Date",
                                          weight: FontWeight.bold,
                                          size: 10),
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "${item['IssueDate'].toString()}",
                                          weight: FontWeight.bold,
                                          size: 10),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "Health code",
                                          weight: FontWeight.bold,
                                          size: 10),
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "${item['healthcode'].toString()}",
                                          weight: FontWeight.bold,
                                          size: 10),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "Effective Date",
                                          weight: FontWeight.bold,
                                          size: 10),
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "${item['EffectiveDate'].toString()}",
                                          weight: FontWeight.bold,
                                          size: 10),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "Gender",
                                          weight: FontWeight.bold,
                                          size: 10),
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "${item['Gender'].toString()}",
                                          weight: FontWeight.bold,
                                          size: 10),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "Age",
                                          weight: FontWeight.bold,
                                          size: 10),
                                      Multi(
                                          color: Colors.white,
                                          subtitle: "${item['Age'].toString()}",
                                          weight: FontWeight.bold,
                                          size: 10),
                                    ],
                                  ),
                                   SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Multi(
                                                  color: Colors.white,
                                                  subtitle: "DOB",
                                                  weight: FontWeight.bold,
                                                  size: 10),
                                              Multi(
                                                  color: Colors.white,
                                                  subtitle: "${item['Dob'].toString()}",
                                                  weight: FontWeight.bold,
                                                  size: 10),
                                            ],
                                          ),
                                        SizedBox(
                                            height: 10.h,
                                          ),
                                        NeumorphicButton(
              
                  margin: EdgeInsets.only(top: 12),
                  onPressed: ()async {
                     PdfDocument document = PdfDocument();

//Create a PdfGrid class


final PdfPage page = document.pages.add();

// Load image from assets using the Image.asset method
// Load image from assets using the Image.asset method
final ByteData imageData = await rootBundle.load('assets/images/side.png');
final Uint8List uint8list = imageData.buffer.asUint8List();

// Calculate the height and width of the image
final PdfBitmap image = PdfBitmap(uint8list);
final double imageWidth = image.width * 0.50;
final double imageHeight = image.height * 0.50;

// Draw the image on the page at the left side and with required size
page.graphics.drawImage(image, Rect.fromLTWH(40, 10, imageWidth, imageHeight));

final ByteData imageData2 = await rootBundle.load('assets/images/cc.png');
final Uint8List uint8list2 = imageData2.buffer.asUint8List();

page.graphics.drawString(
    '${item['Name'].toString()}', PdfStandardFont(PdfFontFamily.helvetica, 7.sp, style: PdfFontStyle.bold),
    brush: PdfBrushes.black, bounds: Rect.fromLTWH(70, 80, 280, 30));

page.graphics.drawString(
    'Effective Date', PdfStandardFont(PdfFontFamily.helvetica, 7.sp, style: PdfFontStyle.bold),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(300, 80), Offset(300, 80))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );

page.graphics.drawString(
    'Expiry Date', PdfStandardFont(PdfFontFamily.helvetica, 7.sp, style: PdfFontStyle.bold),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(420, 80), Offset(420, 80))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );

page.graphics.drawString(
    '${item['EffectiveDate'].toString().substring(0,10)}', PdfStandardFont(PdfFontFamily.helvetica, 7.sp, style: PdfFontStyle.bold),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(300, 90), Offset(300, 90))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );

page.graphics.drawString(
    '----------', PdfStandardFont(PdfFontFamily.helvetica, 7.sp, style: PdfFontStyle.bold),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(420, 90), Offset(420, 90))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );

page.graphics.drawString(
    'BENEFITS COVERED', PdfStandardFont(PdfFontFamily.helvetica, 9.sp,style: PdfFontStyle.italic),
    brush: PdfBrushes.red, bounds: Rect.fromPoints(Offset(300, 114), Offset(300, 114))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );

page.graphics.drawString(
    'Room Entitlement', PdfStandardFont(PdfFontFamily.helvetica, 9.sp,),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(300, 124), Offset(300, 124))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );
page.graphics.drawString(
    '          :   ----', PdfStandardFont(PdfFontFamily.helvetica, 9.sp, style: PdfFontStyle.bold),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(350, 124), Offset(350, 124))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );

page.graphics.drawString(
    'Hospital Limit', PdfStandardFont(PdfFontFamily.helvetica, 9.sp,),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(300, 134), Offset(300, 134))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );
page.graphics.drawString(
    '          :   ----', PdfStandardFont(PdfFontFamily.helvetica, 9.sp, style: PdfFontStyle.bold),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(350, 134), Offset(350, 134))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );

page.graphics.drawString(
    'Maternity', PdfStandardFont(PdfFontFamily.helvetica, 9.sp,),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(300, 144), Offset(300, 144))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );
page.graphics.drawString(
    '          :   ----', PdfStandardFont(PdfFontFamily.helvetica, 9.sp, style: PdfFontStyle.bold),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(350, 144), Offset(350, 144))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );

page.graphics.drawString(
    'Emergency', PdfStandardFont(PdfFontFamily.helvetica, 9.sp,),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(300, 155), Offset(300, 155))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );
page.graphics.drawString(
    '          :   ----', PdfStandardFont(PdfFontFamily.helvetica, 9.sp, style: PdfFontStyle.bold),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(350, 155), Offset(350, 155))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );



page.graphics.drawString(
    'Card No.', PdfStandardFont(PdfFontFamily.helvetica, 9.sp,),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(70, 114), Offset(70, 114))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );
page.graphics.drawString(
    ':   ${item['DocumentNo'].toString()}', PdfStandardFont(PdfFontFamily.helvetica, 9.sp, style: PdfFontStyle.bold),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(120, 114), Offset(120, 114))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );

page.graphics.drawString(
    'Policy No.', PdfStandardFont(PdfFontFamily.helvetica, 9.sp,),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(70, 124), Offset(70, 124))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );
page.graphics.drawString(
    ':   ----', PdfStandardFont(PdfFontFamily.helvetica, 9.sp, style: PdfFontStyle.bold),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(120, 124), Offset(120, 124))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );

page.graphics.drawString(
    'Partner ID', PdfStandardFont(PdfFontFamily.helvetica, 9.sp,),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(70, 136), Offset(70, 136))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );
page.graphics.drawString(
    ':   ----', PdfStandardFont(PdfFontFamily.helvetica, 9.sp, style: PdfFontStyle.bold),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(120, 136), Offset(120, 136))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );

page.graphics.drawString(
    'Gender/Age', PdfStandardFont(PdfFontFamily.helvetica, 9.sp,),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(70, 148), Offset(70, 148))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );
page.graphics.drawString(
    ':   ${item['Gender'].toString()}/${item['Age'].toString()}', PdfStandardFont(PdfFontFamily.helvetica, 9.sp, style: PdfFontStyle.bold),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(120, 148), Offset(120, 148))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );
page.graphics.drawString(
    'Product', PdfStandardFont(PdfFontFamily.helvetica, 9.sp,),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(70, 160), Offset(70, 160))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );
page.graphics.drawString(
    ':   ----', PdfStandardFont(PdfFontFamily.helvetica, 9.sp, style: PdfFontStyle.bold),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(120, 160), Offset(120, 160))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );

page.graphics.drawString(
    'IMPORTANT INSTRUCTIONS', PdfStandardFont(PdfFontFamily.helvetica, 9.sp,style: PdfFontStyle.italic),
    brush: PdfBrushes.red, bounds: Rect.fromPoints(Offset(70, 185), Offset(70, 185))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );


page.graphics.drawString(
    'NOTE', PdfStandardFont(PdfFontFamily.helvetica, 9.sp,style: PdfFontStyle.italic),
    brush: PdfBrushes.red, bounds: Rect.fromPoints(Offset(70, 225), Offset(70, 225))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );
// Get the size of the image
  final PdfBitmap image3 = PdfBitmap(uint8list2);
  final Size imageSize3 = Size(90.w, 60.h);

  // Get the size of the page
  final Size pageSize = page.getClientSize();

  // Calculate the position of the image on the page
  final double x = pageSize.width - imageSize3.width - 65;
  final double y = 10;

  // Draw the image on the page
  page.graphics.drawImage(image3, Rect.fromLTWH(x, y, imageSize3.width, imageSize3.height));

//Set the grid style


PdfPen pen = PdfPen(PdfColor(0, 0, 0), width: 1);
//Draw a rectangle with border line
page.graphics.drawLine(  PdfPen(PdfColor(165, 42, 42), width: 2,),
    Offset(58, 70),
    Offset(470, 70),
    );

//Draw the grid

List<int> bytes = await document.save();
//Get external storage directory
final directory = await getApplicationSupportDirectory();

//Get directory path
final path = directory.path;

//Create an empty file to write PDF data
File file = File('$path/Output3.pdf');

//Write PDF data
await file.writeAsBytes(bytes, flush: true);

//Open the PDF document in mobile
OpenFilex.open('$path/Output3.pdf');

//Save and dispose the PDF document
// File('SampleOutput.pdf').writeAsBytes(await document.save());
document.dispose();
                  },
                  style: NeumorphicStyle(
                    shadowLightColor: Colors.blue,
                    shape: NeumorphicShape.flat,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                    //border: NeumorphicBorder()
                  ),
                  padding:  EdgeInsets.all(6.0),
                  child: Multi3(color: Color(0xff2b578e), subtitle: "Download Card", weight: FontWeight.bold, size: 12)
                  ),    
                                ],
                              ),
                              title: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Multi3(
                                              color: Colors.white,
                                              subtitle: "${item['Relation'].toString()}",
                                              weight: FontWeight.bold,
                                              size: 17),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Multi(
                                                  color: Colors.white,
                                                  subtitle: "${item['Name'].toString()}",
                                                  weight: FontWeight.bold,
                                                  size: 10),
                                         
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ));
                  }),
              SizedBox(
                height: 15.h,
              ),
              //          ListView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: dependents.length,
              //   itemBuilder: (context, index) {
              //     final dependent = dependents.values.elementAt(index);

              //     return  Padding(
              //       padding:  EdgeInsets.only(bottom: 7.h),
              //       child: Container(
              //           width: double.infinity,
              //         decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10.0),
              //                 color: Color(0xffafc4dd),
              //                 boxShadow: [
              //                   BoxShadow(
              //                     color: Color(0xffA4A4A4),
              //                     blurRadius: 6.0,
              //                     spreadRadius: 1.0,
              //                     offset: Offset(0.0, 0.0),
              //                     // Shadow position
              //                   ),
              //                 ],
              //               ),
              //         child: Padding(
              //           padding: const EdgeInsets.all(15),
              //           child: Column(
              //             children: [
              //                Multi3(color: Colors.white, subtitle: dependent['relation'], weight: FontWeight.bold, size: 17),
              //                SizedBox(height: 10.h,),
              //                 Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Multi(color: Colors.white, subtitle: "Name", weight: FontWeight.bold, size: 10),
              //                   Multi(color: Colors.white, subtitle: dependent['name'], weight: FontWeight.bold, size: 10),
              //                 ],
              //                ),
              //                SizedBox(height: 10.h,),
              //                Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Multi(color: Colors.white, subtitle: "DOB", weight: FontWeight.bold, size: 10),
              //                   Multi(color: Colors.white, subtitle: dependent['dob'], weight: FontWeight.bold, size: 10),
              //                 ],
              //                ),
              //                SizedBox(height: 10.h,),
              //                Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Multi(color: Colors.white, subtitle: "CNIC", weight: FontWeight.bold, size: 10),
              //                   Multi(color: Colors.white, subtitle: dependent['cnic'], weight: FontWeight.bold, size: 10),
              //                 ],
              //                ),

              //                SizedBox(height: 10.h,),
              //                Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Multi(color: Colors.white, subtitle: "Age", weight: FontWeight.bold, size: 10),
              //                   Multi(color: Colors.white, subtitle: dependent['age'], weight: FontWeight.bold, size: 10),
              //                 ],
              //                ),
              //                SizedBox(height: 10.h,),
              //                Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Multi(color: Colors.white, subtitle: "Gender", weight: FontWeight.bold, size: 10),
              //                   Multi(color: Colors.white, subtitle: dependent['gender'], weight: FontWeight.bold, size: 10),
              //                 ],
              //                ),
              //                SizedBox(height: 10.h,),
              //                ElevatedButton(onPressed: (){
              //                 // print(data1['data']);
              //                 for (var i = 0; i < data1['data'].length; i++) {
              //                   print("${data1['data'][i]['Name']} this is $i");
              //                 }
              //                }, child: Text("data"))
              //             ],
              //           ),
              //         ),
              //         ),
              //     );
              //   },
              // ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
