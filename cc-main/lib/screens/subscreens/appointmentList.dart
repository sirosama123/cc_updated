import 'dart:io';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:project1/main.dart';
import 'package:project1/screens/aboutus.dart';
import 'package:project1/screens/dashboard.dart';
import 'package:project1/screens/dashboardDrawer.dart';
import 'package:project1/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/history.dart';
import 'package:project1/screens/landingpage.dart';
import 'package:project1/screens/notification.dart';
import 'package:project1/screens/profile.dart';
import 'package:project1/screens/subscreens/appointment.dart';
import 'package:project1/screens/subscreens/doctoronline.dart';
import 'package:project1/screens/subscreens/labPrescription.dart';
import 'package:project1/screens/subscreens/prescription.dart';
import 'package:project1/screens/subscreens/selectionCity.dart';
import 'package:project1/widgets/heading3.dart';
import 'package:project1/widgets/links.dart';
import 'package:project1/widgets/square_head.dart';
import 'package:provider/provider.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:url_launcher/url_launcher.dart' ;

import '../../widgets/multi3.dart';
import '../widgets/appointmentView.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/multi3.dart';
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
import 'package:intl/intl.dart';
import 'package:open_filex/open_filex.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/services.dart' show ByteData, Uint8List, rootBundle;
import 'dart:io';
import 'package:path_provider/path_provider.dart';



class AppointList extends StatelessWidget {
   AppointList({super.key});

  @override
  Widget build(BuildContext context) {
     final Provider11 = Provider.of<Provider1>(context); 
    final Stream<QuerySnapshot> abc = FirebaseFirestore.instance.collection('appointments').doc(Provider11.uuid).collection("data").snapshots();
     generatePdf(
      String hsptlName,
      String hsptlAddress,
      String name,
      String relation,
      String dob,
      String age,
      String cnic,
      String pc,
      String dn,
      String apprFor,
      String gen,
      String remaining
      )async{
       //Create a new PDF documentation
//Create a new PDF documentation
PdfDocument document = PdfDocument();

final PdfPage page = document.pages.add();


// table  1 which have 2 rows only


//Create a PdfGrid class
PdfGrid grid = PdfGrid();
grid.columns.add(count: 1);

//Add header to the grid
grid.headers.add(1);

//Add the rows to the grid
PdfGridRow header = grid.headers[0];
header.cells[0].value = '$hsptlName';

//Add rows to grid
PdfGridRow row = grid.rows.add();
row.cells[0].value = hsptlAddress;

header.cells[0].style.stringFormat = PdfStringFormat(
    alignment: PdfTextAlignment.center,
    lineAlignment: PdfVerticalAlignment.bottom,
    );

row.cells[0].style.stringFormat = PdfStringFormat(
    alignment: PdfTextAlignment.center,
    lineAlignment: PdfVerticalAlignment.bottom,
    );

PdfStringFormat format = PdfStringFormat();
format.alignment = PdfTextAlignment.center;

//Set the grid style
grid.style = PdfGridStyle(
    
    cellPadding: PdfPaddings(left: 10, right: 10, top: 1, bottom: 1),
    backgroundBrush: PdfBrushes.transparent,
    textBrush: PdfBrushes.black,
    font: PdfStandardFont(PdfFontFamily.helvetica, hsptlAddress!.length>60?10:12, style: PdfFontStyle.regular));




//Create a PdfGrid class
PdfGrid grid2 = PdfGrid();
grid2.columns.add(count: 2);

//Add header to the grid
grid2.headers.add(1);

grid2.columns[0].width = 150.w;


//Create a PdfGrid class
PdfGrid grid3 = PdfGrid();
grid3.columns.add(count: 1);

//Add header to the grid
grid3.headers.add(1);

//Add the rows to the grid
PdfGridRow header3 = grid3.headers[0];
header3.cells[0].value = 'APPROVED LIMIT FOR OPD : Rs 1500/_';

//Add rows to grid
PdfGridRow row13 = grid3.rows.add();
row13.cells[0].value = 'Maximum Room and Board Entitlement : Private Room';

//Add rows to grid
PdfGridRow row14 = grid3.rows.add();
row14.cells[0].value = 'Total Remaining Amount of Plan : $remaining';

//Add rows to grid
PdfGridRow row15 = grid3.rows.add();
row15.cells[0].value = 'This includes Previous Limit of Rs. Nil';

//Add rows to grid
PdfGridRow row16 = grid3.rows.add();
row16.cells[0].value = 'Diagnosis: Consultation';

//Add the rows to the grid2
PdfGridRow header2 = grid2.headers[0];
header2.cells[0].value = 'Patient Name';
header2.cells[1].value = '$name';


//Add rows to grid
PdfGridRow row2 = grid2.rows.add();
row2.cells[0].value = 'Relationship with employes';
row2.cells[1].value = '$relation';



//Add rows to grid
PdfGridRow row4 = grid2.rows.add();
row4.cells[0].value = 'Employee Name';
row4.cells[1].value = '${Provider11.first} ${Provider11.last}';

//Add rows to grid
PdfGridRow row5 = grid2.rows.add();
row5.cells[0].value = 'Date of Birth / Age';
row5.cells[1].value = '$dob / $age';

//Add rows to grid
PdfGridRow row6 = grid2.rows.add();
row6.cells[0].value = 'Card No';
row6.cells[1].value = '$cnic';

//Add rows to grid
PdfGridRow row7 = grid2.rows.add();
row7.cells[0].value = 'Plan';
row7.cells[1].value = '$pc';

//Add rows to grid
PdfGridRow row8 = grid2.rows.add();
row8.cells[0].value = 'Participant Name';
row8.cells[1].value = '$name';

//Add rows to grid
PdfGridRow row9 = grid2.rows.add();
row9.cells[0].value = 'Designation';
row9.cells[1].value = '$relation';

//Add rows to grid
PdfGridRow row10 = grid2.rows.add();
row10.cells[0].value = 'Employee Id';
row10.cells[1].value = '$dn';

header2.cells[0].style.stringFormat = PdfStringFormat(
    alignment: PdfTextAlignment.center,
    lineAlignment: PdfVerticalAlignment.bottom,
    );
header2.cells[1].style.stringFormat = PdfStringFormat(
    alignment: PdfTextAlignment.center,
    lineAlignment: PdfVerticalAlignment.bottom,
    );

row2.cells[0].style.stringFormat = PdfStringFormat(
    alignment: PdfTextAlignment.center,
    lineAlignment: PdfVerticalAlignment.bottom,
    );
row2.cells[1].style.stringFormat = PdfStringFormat(
    alignment: PdfTextAlignment.center,
    lineAlignment: PdfVerticalAlignment.bottom,
    );

header2.cells[0].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8,style: PdfFontStyle.bold)
);
header2.cells[1].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8)
);


header3.cells[0].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8,style: PdfFontStyle.bold), 
);
header3.cells[0].style.stringFormat = PdfStringFormat(
    alignment: PdfTextAlignment.center,
    lineAlignment: PdfVerticalAlignment.bottom,
    );


row2.cells[0].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8,style: PdfFontStyle.bold)
);

row4.cells[0].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8,style: PdfFontStyle.bold)
);
row5.cells[0].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8,style: PdfFontStyle.bold)
);
row6.cells[0].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8,style: PdfFontStyle.bold)
);
row7.cells[0].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8,style: PdfFontStyle.bold)
);
row8.cells[0].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8,style: PdfFontStyle.bold)
);
row9.cells[0].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8,style: PdfFontStyle.bold)
);
row10.cells[0].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8,style: PdfFontStyle.bold)
);

row2.cells[1].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8)
);

row4.cells[1].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8)
);
row5.cells[1].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8)
);
row6.cells[1].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8)
);
row7.cells[1].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8)
);
row8.cells[1].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8)
);
row9.cells[1].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8)
);
row10.cells[1].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8)
);




header3.cells[0].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8,style: PdfFontStyle.bold), 
);
header3.cells[0].style.stringFormat = PdfStringFormat(
    alignment: PdfTextAlignment.center,
    lineAlignment: PdfVerticalAlignment.bottom,
    );
row13.cells[0].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8,style: PdfFontStyle.bold)
);
row13.cells[0].style.stringFormat = PdfStringFormat(
    alignment: PdfTextAlignment.center,
    lineAlignment: PdfVerticalAlignment.bottom,
    );
row14.cells[0].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8,style: PdfFontStyle.bold)
);
row14.cells[0].style.stringFormat = PdfStringFormat(
    alignment: PdfTextAlignment.center,
    lineAlignment: PdfVerticalAlignment.bottom,
    );
row15.cells[0].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8,style: PdfFontStyle.bold)
);
row15.cells[0].style.stringFormat = PdfStringFormat(
    alignment: PdfTextAlignment.center,
    lineAlignment: PdfVerticalAlignment.bottom,
    );
row16.cells[0].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8,style: PdfFontStyle.bold)
);
row16.cells[0].style.stringFormat = PdfStringFormat(
    alignment: PdfTextAlignment.center,
    lineAlignment: PdfVerticalAlignment.bottom,
    );


//Create a PdfGrid class
PdfGrid grid4 = PdfGrid();
grid4.columns.add(count: 2);

//Add header to the grid
grid4.headers.add(1);

PdfGridRow header4 = grid4.headers[0];
header4.cells[0].value = 'NOTES FOR THE PREFERRED PROVIDER HOSPITAL:';


PdfGridRow header5 = grid4.headers[0];
header5.cells[1].value = 'APPROVED LIMIT FOR OPD : Rs 1500/_';

//Add rows to grid
PdfGridRow row131 = grid4.rows.add();
row131.cells[0].value = ' 1) OUT-patient treatment, through this letter is allowed except In-patient treatment and Daycare Procedures.\n2) The preferred provider (Hospital) may entertain the fax copy of this letter duly attested by the employer, however, the hospital have the right to call for the original in case of any doubt.Hospital should obtain a Crescent Care Identification Card/Photo/National Card Identification of the patient\n3) The preferred provider hospital is requested to forward their bills with all supporting documents including copy of CNIC, Crescent Care Identification Card and copy of this credit letter, to us directly for payment\n4) Preferred provider (Hospital) is requested to inform Crescent Care Pvt. Limited at phone (021-1234567 Ext. 001 (Hotline 0315-4567890), within 24 hours of treatment of any of the above named Member\n5) Prior Approval should be taken before 24 hours of admission for elective procedures/treatment from Crescent Care Pvt. Limited\n6) Difference of charges between Panel and Visiting Doctor tobe paid by the Card holder/members.';

row131.cells[1].value = '- Charges for meals, phones, laundry and similar services.\n- Eye glasses, contact lenses, hearing aids & Dentures\n- Dental Examination, extraction and fillings.\n -  Radial keratomy & Excimer laser procedures\n -  Congenital defects & Deformities\n -  Any hospitalization directly or indirectly related to Pregnancy\n - Tests and Treatments related to infertility & its complication';


header4.cells[0].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8,style: PdfFontStyle.bold,),
  
  
  
);
header5.cells[1].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 8,style: PdfFontStyle.bold)
);
row131.cells[0].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 6)
);
row131.cells[1].style=PdfGridCellStyle(
  font:PdfStandardFont(PdfFontFamily.helvetica, 6)
);

header4.cells[0].style.borders = PdfBorders(
    left: PdfPen(PdfColor(0, 0, 0), width: 1),
    top: PdfPen(PdfColor(0, 0, 0), width: 1),
    right: PdfPen(PdfColor(0, 0, 0), width: 0.5),
    bottom: PdfPens.transparent,
    );

header4.cells[1].style.borders = PdfBorders(
    left: PdfPen(PdfColor(0, 0, 0), width: 0.5),
    top: PdfPen(PdfColor(0, 0, 0), width: 1),
    right: PdfPen(PdfColor(0, 0, 0), width: 1),
    bottom:PdfPens.transparent,
    );
row131.cells[0].style.borders = PdfBorders(
    left: PdfPen(PdfColor(0, 0, 0), width: 1),
    top: PdfPens.transparent,
    right: PdfPen(PdfColor(0, 0, 0), width: 0.5),
    bottom: PdfPen(PdfColor(0, 0, 0), width: 1)
    );

row131.cells[1].style.borders = PdfBorders(
    left: PdfPen(PdfColor(0, 0, 0), width: 1),
    top: PdfPens.transparent,
    right: PdfPen(PdfColor(0, 0, 0), width: 0.5),
    bottom: PdfPen(PdfColor(0, 0, 0), width: 1)
    );

//Set the grid style
grid2.style = PdfGridStyle(
    
    cellPadding: PdfPaddings(left: 10, right: 10, top: 1, bottom: 1),
    backgroundBrush: PdfBrushes.transparent,
    textBrush: PdfBrushes.black,
    font: PdfStandardFont(PdfFontFamily.helvetica, 15, style: PdfFontStyle.bold));

grid4.style = PdfGridStyle(
    
    cellPadding: PdfPaddings(left: 5, right: 5, top: 1, bottom: 1),
    backgroundBrush: PdfBrushes.transparent,
    textBrush: PdfBrushes.black,
    font: PdfStandardFont(PdfFontFamily.helvetica, 15, style: PdfFontStyle.bold));
//Create a PdfGrid class
PdfGrid grid5 = PdfGrid();
grid5.columns.add(count: 2);

//Add header to the grid
grid5.headers.add(1);

PdfGridRow header6 = grid5.headers[0];
header6.cells[0].value = '\n Approved By : \n\n Approval Department';


PdfGridRow header7 = grid5.headers[0];
header7.cells[1].value = ' Employee Name:\n ID:\n CNIC No:\n Employer\'s Signature & Seal:';

//Create a PdfGrid class
PdfGrid grid6 = PdfGrid();
grid6.columns.add(count: 1);

//Add header to the grid
grid6.headers.add(1);
PdfGridRow header8 = grid6.headers[0];
header8.cells[0].value = ' Patient/Employee is requested to inform Crescent Care for cancellation of letter if treatment is postponed ';



page.graphics.drawString(
    '${DateTime.now().day} ${DateTime.now().month} ${DateTime.now().year}', PdfStandardFont(PdfFontFamily.helvetica, 9.sp,),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(0, 20), Offset(0, 20))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );

page.graphics.drawString(
    'Card No.', PdfStandardFont(PdfFontFamily.helvetica, 9.sp,),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(0, 35), Offset(0, 35))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );
page.graphics.drawString(
    ':   $cnic', PdfStandardFont(PdfFontFamily.helvetica, 9.sp, style: PdfFontStyle.bold),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(50, 35), Offset(50, 35))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );

page.graphics.drawString(
    'Policy No.', PdfStandardFont(PdfFontFamily.helvetica, 9.sp,),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(0, 50), Offset(0, 50))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );
page.graphics.drawString(
    ':   $dn', PdfStandardFont(PdfFontFamily.helvetica, 9.sp, style: PdfFontStyle.bold),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(50, 50), Offset(50, 50))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );

page.graphics.drawString(
    'Partner ID', PdfStandardFont(PdfFontFamily.helvetica, 9.sp,),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(0, 65), Offset(0, 65))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );
page.graphics.drawString(
    ':   Nil', PdfStandardFont(PdfFontFamily.helvetica, 9.sp, style: PdfFontStyle.bold),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(50, 65), Offset(50, 65))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );

page.graphics.drawString(
    'Gender/Age', PdfStandardFont(PdfFontFamily.helvetica, 9.sp,),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(0, 80), Offset(0, 80))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );
page.graphics.drawString(
    ':   ${gen}/${age}', PdfStandardFont(PdfFontFamily.helvetica, 9.sp, style: PdfFontStyle.bold),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(50, 80), Offset(50, 80))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );
page.graphics.drawString(
    'Product', PdfStandardFont(PdfFontFamily.helvetica, 9.sp,),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(0, 95), Offset(0, 95))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );
page.graphics.drawString(
    ':   Nil', PdfStandardFont(PdfFontFamily.helvetica, 9.sp, style: PdfFontStyle.bold),
    brush: PdfBrushes.black, bounds: Rect.fromPoints(Offset(50, 95), Offset(50, 95))
    // bounds: Rect.fromLTWH(50, 130, 300, 50)
    );
final ByteData imageData2 = await rootBundle.load('assets/cc.png');
final Uint8List uint8list2 = imageData2.buffer.asUint8List();

// Calculate the height and width of the image
final PdfBitmap image2 = PdfBitmap(uint8list2);
final double imageWidth2 = image2.width * 0.95;
final double imageHeight2 = image2.height * 0.95;
page.graphics.drawImage(image2, Rect.fromLTWH(380, 20, imageWidth2, imageHeight2));
//Draw the grid
grid.draw(
    page: page, bounds: const Rect.fromLTWH(0, 130, 0, 0));

page.graphics.drawString(
  'Assalam-o-Alaikum',
  PdfStandardFont(PdfFontFamily.helvetica, 11,),
  bounds: Rect.fromLTWH(0, 185, page.getClientSize().width, 100),
  format: PdfStringFormat(alignment: PdfTextAlignment.left),
);
page.graphics.drawString(
  'Re: Approval Letter of $apprFor',
  PdfStandardFont(PdfFontFamily.helvetica, 11,style:PdfFontStyle.bold),
  bounds: Rect.fromLTWH(0, 205, page.getClientSize().width, 100),
  format: PdfStringFormat(alignment: PdfTextAlignment.left),
);
page.graphics.drawString(
  'The following Person is covered under Crescent Care Pvt. Limit Health Policy. You are kindly requested to please extend the best possible services/treatment and bill to us for reimbursement as per agreement. Details of Covered Members are as follows:-',
  PdfStandardFont(PdfFontFamily.helvetica, 12,),
  bounds: Rect.fromLTWH(0, 225, page.getClientSize().width, 100),
  format: PdfStringFormat(alignment: PdfTextAlignment.left),
);

//Draw the grid
grid2.draw(
    page: page, bounds: const Rect.fromLTWH(0, 275, 0, 0));

grid3.draw(
    page: page, bounds: const Rect.fromLTWH(0, 420, 0, 0));
grid4.draw(
    page: page, bounds: const Rect.fromLTWH(0, 500, 0, 0));

page.graphics.drawString(
  'Crescent Care Pvt. Limited, guarantees the payment to the hospitals on its panel for providing the benefit to covered to any of the above mentioned person, during the validity of this letter (see top right).',
  PdfStandardFont(PdfFontFamily.helvetica, 8,style:PdfFontStyle.bold),
  bounds: Rect.fromLTWH(0, 635, page.getClientSize().width, 100),
  format: PdfStringFormat(alignment: PdfTextAlignment.left),
);
grid5.draw(
    page: page, bounds: const Rect.fromLTWH(0, 660, 0, 0));

grid6.draw(
    page: page, bounds: const Rect.fromLTWH(0, 710, 0, 0));

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
document.dispose(); 
    }
    return Scaffold(
       appBar: AppBar(
          backgroundColor: Color(0xff2b578e),
          title: Text("Appointment Lists"),
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
      body:StreamBuilder<QuerySnapshot>(
      stream: abc,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return Container(
      height: data['status']=="confirmed"?180.h:150.h,
      child: Padding(
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
                         Multi3(color: Colors.white, subtitle: data['name'], weight: FontWeight.bold, size: 16),
                           
                          ],
                        ),
                        Divider(color: Colors.white,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                         Multi3(color: Colors.white, subtitle: "Hospital Name", weight: FontWeight.bold, size: 12),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle:data['hsptlName'], weight: FontWeight.bold, size: 12),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                         Multi3(color: Colors.white, subtitle: "Doctor Name", weight: FontWeight.bold, size: 12),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle:data['DoctorName'], weight: FontWeight.bold, size: 12),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                         Multi3(color: Colors.white, subtitle: "Date of appointment", weight: FontWeight.bold, size: 12),
                            SizedBox(width: 5.w,),
                            Multi3(color: Colors.white, subtitle:data['appointment_date'], weight: FontWeight.bold, size: 12),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                         Multi3(color: Colors.white, subtitle: "Status", weight: FontWeight.bold, size: 12),
                            SizedBox(width: 5.w,),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: data['status']=="confirmed"?Colors.green:data['status']=="pending"?Colors.orange:Colors.green
                              ),
                              child: Padding(
                                padding:  EdgeInsets.all(5),
                                child: Multi3(color: Colors.white, subtitle:data['status'], weight: FontWeight.bold, size: 12),
                              )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                           data['status']=="confirmed"?  NeumorphicButton(
              
                  margin: EdgeInsets.only(top: 12),
                  onPressed: () {
                     generatePdf(
                      data['hsptlName'], 
                      data['hsptlName'], 
                      data['name'],
                      data['relation'],
                      data['dob'],
                      data['age'],
                      data['cnic'],
                      data['pc'],
                      data['dn'],
                      'appointment', 
                      data['gen'],
                      data['remaining'],
                      );
                  },
                  style: NeumorphicStyle(
                    shadowLightColor: Colors.blue,
                    shape: NeumorphicShape.flat,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                    //border: NeumorphicBorder()
                  ),
                  padding:  EdgeInsets.all(6.0),
                  child: Multi3(color: Color(0xff2b578e), subtitle: "Proceed", weight: FontWeight.bold, size: 12)
                  ):Container(),
                  Container(),
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
            
            
            // AppointmentVeiw(
            //   pname: data['name'], 
            //   hname: data['hsptlName'], 
            //   doa: data['appointment_date'], 
            //   status: data['status'], dname: data['DoctorName'],);
          }).toList(),
        );
      },
    )
      
      
       
    );
  }
}

















