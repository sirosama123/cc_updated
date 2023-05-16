import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/downloadCards/pdf1.dart';
import 'package:project1/screens/login.dart';
import 'package:project1/widgets/square_head.dart';
import 'package:provider/provider.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:uuid/uuid.dart';
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
import '../../widgets/multi3.dart';
import '../memberLogin/approval.dart';

class AllCards extends StatelessWidget {
  const AllCards({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
    Future<void> savePdf(
        String? ClientName,
        String? EmployeeName,
        String? cardId,
        String? policyNo,
        String? PartnerId,
        String? Gender,
        String? Age,
        String? Product,
        String? EffectiveDate,
        String? ExpiryDate,
        String? RoomLimit,
        String? HospLimit,
        String? Maternity,
        String? Emergency,
        String? Heading1,
        String? Desc1,
        String? Heading2,
        String? Desc2,
        String? Heading3,
        String? Desc3,
        String? Note1,
        String? Note2) async {
      //Create a new PDF document
      PdfDocument document = PdfDocument();

//Create a PdfGrid class

      final PdfPage page = document.pages.add();

// Load image from assets using the Image.asset method
// Load image from assets using the Image.asset method
      final ByteData imageData =
          await rootBundle.load('assets/images/side.png');
      final Uint8List uint8list = imageData.buffer.asUint8List();

// Calculate the height and width of the image
      final PdfBitmap image = PdfBitmap(uint8list);
      final double imageWidth = image.width * 0.75;
      final double imageHeight = image.height * 0.75;

// Draw the image on the page at the left side and with required size
      page.graphics
          .drawImage(image, Rect.fromLTWH(0, 10, imageWidth, imageHeight));

      final ByteData imageData2 = await rootBundle.load('assets/images/cc.png');
      final Uint8List uint8list2 = imageData2.buffer.asUint8List();

// Calculate the height and width of the image
      final PdfBitmap image2 = PdfBitmap(uint8list2);
      final double imageWidth2 = image2.width * 0.75;
      final double imageHeight2 = image2.height * 0.75;
      page.graphics.drawImage(
          image2, Rect.fromLTWH(600, 10, imageWidth2 / 3, imageHeight2 / 2));

      page.graphics.drawString(
          '$ClientName',
          PdfStandardFont(PdfFontFamily.helvetica, 10.sp,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: Rect.fromLTWH(50, 50, 300, 50));

      page.graphics.drawString(
          '$EmployeeName',
          PdfStandardFont(PdfFontFamily.helvetica, 10.sp,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: Rect.fromLTWH(50, 115, 300, 50));

      page.graphics.drawString(
          'Effective Date',
          PdfStandardFont(PdfFontFamily.helvetica, 10.sp,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(300, 110), Offset(300, 110))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );

      page.graphics.drawString(
          'Expiry Date',
          PdfStandardFont(PdfFontFamily.helvetica, 10.sp,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(420, 110), Offset(420, 110))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );

      page.graphics.drawString(
          '$EffectiveDate',
          PdfStandardFont(PdfFontFamily.helvetica, 10.sp,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(300, 120), Offset(300, 120))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );

      page.graphics.drawString(
          '$ExpiryDate',
          PdfStandardFont(PdfFontFamily.helvetica, 10.sp,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(420, 120), Offset(420, 120))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );

      page.graphics.drawString(
          'BENEFITS COVERED',
          PdfStandardFont(PdfFontFamily.helvetica, 9.sp,
              style: PdfFontStyle.italic),
          brush: PdfBrushes.red,
          bounds: Rect.fromPoints(Offset(300, 150), Offset(300, 150))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );

      page.graphics.drawString(
          'Room Entitlement',
          PdfStandardFont(
            PdfFontFamily.helvetica,
            9.sp,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(300, 170), Offset(300, 170))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );
      page.graphics.drawString(
          '          :   $RoomLimit',
          PdfStandardFont(PdfFontFamily.helvetica, 9.sp,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(350, 170), Offset(350, 170))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );

      page.graphics.drawString(
          'Hospital Limit',
          PdfStandardFont(
            PdfFontFamily.helvetica,
            9.sp,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(300, 190), Offset(300, 190))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );
      page.graphics.drawString(
          '          :   $HospLimit',
          PdfStandardFont(PdfFontFamily.helvetica, 9.sp,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(350, 190), Offset(350, 190))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );

      page.graphics.drawString(
          'Maternity',
          PdfStandardFont(
            PdfFontFamily.helvetica,
            9.sp,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(300, 210), Offset(300, 210))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );
      page.graphics.drawString(
          '          :   $Maternity',
          PdfStandardFont(PdfFontFamily.helvetica, 9.sp,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(350, 210), Offset(350, 210))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );

      page.graphics.drawString(
          'Emergency',
          PdfStandardFont(
            PdfFontFamily.helvetica,
            9.sp,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(300, 230), Offset(300, 230))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );
      page.graphics.drawString(
          '          :   $Emergency',
          PdfStandardFont(PdfFontFamily.helvetica, 9.sp,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(350, 230), Offset(350, 230))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );

      page.graphics.drawString(
          'Card No.',
          PdfStandardFont(
            PdfFontFamily.helvetica,
            9.sp,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(50, 150), Offset(50, 150))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );
      page.graphics.drawString(
          ':   $cardId',
          PdfStandardFont(PdfFontFamily.helvetica, 9.sp,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(100, 150), Offset(100, 150))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );

      page.graphics.drawString(
          'Policy No.',
          PdfStandardFont(
            PdfFontFamily.helvetica,
            9.sp,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(50, 170), Offset(50, 170))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );
      page.graphics.drawString(
          ':   $policyNo',
          PdfStandardFont(PdfFontFamily.helvetica, 9.sp,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(100, 170), Offset(100, 170))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );

      page.graphics.drawString(
          'Partner ID',
          PdfStandardFont(
            PdfFontFamily.helvetica,
            9.sp,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(50, 190), Offset(50, 190))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );
      page.graphics.drawString(
          ':   $PartnerId',
          PdfStandardFont(PdfFontFamily.helvetica, 9.sp,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(100, 190), Offset(100, 190))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );

      page.graphics.drawString(
          'Gender/Age',
          PdfStandardFont(
            PdfFontFamily.helvetica,
            9.sp,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(50, 210), Offset(50, 210))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );
      page.graphics.drawString(
          ':   ${Gender}/${Age}',
          PdfStandardFont(PdfFontFamily.helvetica, 9.sp,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(100, 210), Offset(100, 210))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );
      page.graphics.drawString(
          'Product',
          PdfStandardFont(
            PdfFontFamily.helvetica,
            9.sp,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(50, 230), Offset(50, 230))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );
      page.graphics.drawString(
          ':   $Product',
          PdfStandardFont(PdfFontFamily.helvetica, 9.sp,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(100, 230), Offset(100, 230))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );

      page.graphics.drawString(
          'IMPORTANT INSTRUCTIONS',
          PdfStandardFont(PdfFontFamily.helvetica, 9.sp,
              style: PdfFontStyle.italic),
          brush: PdfBrushes.red,
          bounds: Rect.fromPoints(Offset(50, 250), Offset(50, 250))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );

      page.graphics.drawString(
          '$Heading1',
          PdfStandardFont(
            PdfFontFamily.helvetica,
            9.sp,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(50, 270), Offset(50, 270))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );
      page.graphics.drawString(
          ':   $Desc1',
          PdfStandardFont(PdfFontFamily.helvetica, 9.sp,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(100, 270), Offset(100, 270))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );

      page.graphics.drawString(
          '$Heading2',
          PdfStandardFont(
            PdfFontFamily.helvetica,
            9.sp,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(50, 290), Offset(50, 290))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );
      page.graphics.drawString(
          ':   $Desc2',
          PdfStandardFont(PdfFontFamily.helvetica, 9.sp,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(100, 290), Offset(100, 290))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );

      page.graphics.drawString(
          '$Heading3',
          PdfStandardFont(
            PdfFontFamily.helvetica,
            9.sp,
          ),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(50, 310), Offset(50, 310))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );
      page.graphics.drawString(
          ':   $Desc3',
          PdfStandardFont(PdfFontFamily.helvetica, 9.sp,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(100, 310), Offset(100, 310))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );

      page.graphics.drawString(
          'NOTE',
          PdfStandardFont(PdfFontFamily.helvetica, 9.sp,
              style: PdfFontStyle.italic),
          brush: PdfBrushes.red,
          bounds: Rect.fromPoints(Offset(50, 330), Offset(50, 330))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );

      page.graphics.drawString(
          '$Note1',
          PdfStandardFont(PdfFontFamily.helvetica, 9.sp,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(50, 350), Offset(50, 350))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );

      page.graphics.drawString(
          '$Note2',
          PdfStandardFont(PdfFontFamily.helvetica, 9.sp,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: Rect.fromPoints(Offset(50, 370), Offset(50, 370))
          // bounds: Rect.fromLTWH(50, 130, 300, 50)
          );
// Get the size of the image
      final PdfBitmap image3 = PdfBitmap(uint8list2);
      final Size imageSize3 = Size(120.w, 60.h);

      // Get the size of the page
      final Size pageSize = page.getClientSize();

      // Calculate the position of the image on the page
      final double x = pageSize.width - imageSize3.width - 20;
      final double y = 30;

      // Draw the image on the page
      page.graphics.drawImage(
          image3, Rect.fromLTWH(x, y, imageSize3.width, imageSize3.height));

//Set the grid style

      PdfPen pen = PdfPen(PdfColor(0, 0, 0), width: 1);
//Draw a rectangle with border line
      page.graphics.drawLine(
        PdfPen(
          PdfColor(165, 42, 42),
          width: 2,
        ),
        Offset(30, 100),
        Offset(600, 100),
      );

//Draw the grid

      List<int> bytes = await document.save();
//Get external storage directory
      final directory = await getApplicationSupportDirectory();

//Get directory path
      final path = directory.path;

//Create an empty file to write PDF data
      File file = File('$path/Output.pdf');

//Write PDF data
      await file.writeAsBytes(bytes, flush: true);

//Open the PDF document in mobile
      OpenFilex.open('$path/Output.pdf');

//Save and dispose the PDF document
// File('SampleOutput.pdf').writeAsBytes(await document.save());
      document.dispose();
    }

    return Scaffold(
       appBar: AppBar(
          backgroundColor: Color(0xff2b578e),
          title: Text("Profile"),
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
          itemCount: Provider11.policyData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 5.h, right: 10.w, left: 10.w),
              child: Neumorphic(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Provider11.policyData['data'][index]['Relation'].toString()=='SELF'?Image.asset("assets/images/self.png",height: 20.h,width: 20.w,):Provider11.data1['data'][index]['Relation'].toString()=='SPOUSE'?Image.asset("assets/images/spouse.png",height: 20.h,width: 20.w,):Provider11.data1['data'][index]['Relation'].toString()=='SON'?Image.asset("assets/images/son.png",height: 20.h,width: 20.w,):Image.asset("assets/images/daughter.png",height: 20.h,width: 20.w,),
                            SizedBox(
                              width: 5.w,
                            ),
                            Multi3(
                                color: Colors.white,
                                subtitle: Provider11.policyData[index]
                                        ['EmployeeName']
                                    .toString(),
                                weight: FontWeight.bold,
                                size: 16),
                          ],
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(
                                color: Colors.white,
                                subtitle: "Name",
                                weight: FontWeight.bold,
                                size: 12),
                            SizedBox(
                              width: 5.w,
                            ),
                            Multi3(
                                color: Colors.white,
                                subtitle: Provider11.policyData[index]
                                        ['EmployeeName']
                                    .toString(),
                                weight: FontWeight.bold,
                                size: 12),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(
                                color: Colors.white,
                                subtitle: "Card Id",
                                weight: FontWeight.bold,
                                size: 12),
                            SizedBox(
                              width: 5.w,
                            ),
                            Multi3(
                                color: Colors.white,
                                subtitle: Provider11.policyData[index]['cardId']
                                    .toString(),
                                weight: FontWeight.bold,
                                size: 12),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            NeumorphicButton(
                                margin: EdgeInsets.only(top: 12),
                                onPressed: () {
                                  savePdf(
                                      Provider11.policyData[index]['ClientName']
                                          .toString(),
                                      Provider11.policyData[index]['EmployeeName']
                                          .toString(),
                                      Provider11.policyData[index]['cardId']
                                          .toString(),
                                      Provider11.policyData[index]['policyNo']
                                          .toString(),
                                      Provider11.policyData[index]['PartnerId']
                                          .toString(),
                                      Provider11.policyData[index]['Gender']
                                          .toString(),
                                      Provider11.policyData[index]['Age']
                                          .toString(),
                                      Provider11.policyData[index]['Product']
                                          .toString(),
                                      Provider11.policyData[index]
                                              ['EffectiveDate']
                                          .toString()
                                          .substring(0, 10),
                                      Provider11.policyData[index]['ExpiryDate']
                                          .toString()
                                          .substring(0, 10),
                                      Provider11.policyData[index]['RoomLimit']
                                          .toString(),
                                      Provider11.policyData[index]['HospLimit']
                                          .toString(),
                                      Provider11.policyData[index]['Maternity']
                                          .toString(),
                                      Provider11.policyData[index]['Emergency']
                                          .toString(),
                                      Provider11.policyData[index]['Heading1']
                                          .toString(),
                                      Provider11.policyData[index]['Desc1']
                                          .toString(),
                                      Provider11.policyData[index]['Heading2']
                                          .toString(),
                                      Provider11.policyData[index]['Desc2']
                                          .toString(),
                                      Provider11.policyData[index]['Heading3']
                                          .toString(),
                                      Provider11.policyData[index]['Desc3']
                                          .toString(),
                                      Provider11.policyData[index]['Note1'].toString(),
                                      Provider11.policyData[index]['Note2'].toString());
                                },
                                style: NeumorphicStyle(
                                  shadowLightColor: Colors.blue,
                                  shape: NeumorphicShape.flat,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(8)),
                                  //border: NeumorphicBorder()
                                ),
                                padding: EdgeInsets.all(6.0),
                                child: Text(
                                  "Show Card",
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        )
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
          }),
    );
  }
}
