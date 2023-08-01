import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';

import '../../class/marker.dart';

class Medicine {
  String date;
  int count;
  

  Medicine( this.date, this.count);

}
class Labs {
  String date;
  int count;

  Labs( this.date, this.count);

}

class MedicineDetail {
  int serial;
  String PatientName;
  String PatientAge;
  String PrescriptionUrl;
  String status;
  String uidMed;
  

  MedicineDetail(this.serial, this.PatientName, this.PatientAge ,this.PrescriptionUrl,this.status,this.uidMed);

}

class LabDetail {
  int serial;
  String PatientNameLab;
  String PatientAgeLab;
  String PrescriptionUrlLab;
  String status;
  String uidLab;

  LabDetail(this.serial, this.PatientNameLab, this.PatientAgeLab ,this.PrescriptionUrlLab,this.status,this.uidLab);

}






class MedicineLabs {
  String dateMedicine;
  String dateLab;
  int countMedicine;
  int countLab;
  

  MedicineLabs( this.dateMedicine, this.countMedicine,this.dateLab,this.countLab);

}

class NotificationMed{
  String name;
  String age;
  String urll;
  String orderdate;
  String ordertime;
  String ordertype;
  String recievedate;
  NotificationMed(this.name,this.age,this.urll,this.orderdate,this.ordertime,this.ordertype,this.recievedate);
}

class NotificationLab{
  String orderdatel;
  String ordertimel;
  String ordertypel;
  String recievedatel;
  NotificationLab(this.orderdatel,this.ordertimel,this.ordertypel,this.recievedatel);
}


class Provider1 extends ChangeNotifier{
  bool state2= false;
  fn(int index){
      if (index==0) {
      
        state2=false;
       
      
    } else {
      
        state2=true;
       
    }
    notifyListeners();
   }
  
  var data1;
  var data2;
  var hsptl_data;
  String? policy;
  var policyData;
  
  var med_dates = [];
  var lab_dates = [];

  var serialNo_med = [];
  var patient_names = [];
  var patients_age = [];
  var prescription_url = [];
  var status = [];
  var uid_med = [];


  var serialNo_lab = [];
  var patient_names_lab = [];
  var patients_age_lab = [];
  var prescription_url_lab = [];
  var status_lab = [];
  var uid_lab = [];

  var orderDate=[];
  var orderTime=[];
  var recieveDate=[];
  var orderType=[];

  var orderDateL=[];
  var orderTimeL=[];
  var recieveDateL=[];
  var orderTypeL=[];



  List<Medicine> medicines = [];
  List<Labs> labs = [];
  List<MedicineLabs> medlabs = [];

  List<MedicineDetail> med_detail = [];
  List<LabDetail> lab_detail = [];

  List<NotificationMed> notify_med = [];
  List<NotificationLab> notify_lab = [];
  

  String? first ;
  String? last ;
  String? email ;
  String? uuid;
  String? gender = "male" ;
  String? number;
  String? gen;
  String? dbuid;
  String? usage;

  double? Wei_kg;
  double? wei_lbs;
  
  double? hei_ft;
  double? hei_cm;

  double? finalWeight_kg;
  double? finalHeight_m;

  double? bmi;
  int? bmiAge;
  double? estWeight;

  String? empId;
  String? pcode;

  String? imagePath;
  DateTime? Recieving;
  String? time;
  String? uniqueID;
  String? PatientName;
  String? PatientAge;
  String? cnic;
  String? localProfile;
  String? ProfileImagePath = "https://cdn-icons-png.flaticon.com/512/1077/1077114.png";

  String? PrescriptionUrl;

  String? BMIgen;
   

  String? loc = "Abbottabad" ;

  late double lon;
  late double lat;
  late double zoom;
  
  String? locL = "Karachi" ;

  late double lonL;
  late double latL;
  late double zoomL;

  late int counter = med_dates.length;
  String? token;
  String? abc="false";
  change(value){
    gender = value;
    notifyListeners();
  }

  change2(String? ab){
    abc=ab;
    notifyListeners();
    print(ab);
  }
  medLab(){
    Map<String, int> occurrences = LinkedHashMap.fromIterable(med_dates, key: (i) => i, value: (i) => med_dates.where((j) => j == i).length);
    List<int> valuesM = occurrences.values.toList();
    List<String> keysM = occurrences.keys.toList();  
    for (var i = 0; i < valuesM.length; i++) {
      medicines.add(Medicine(keysM[i], valuesM[i]));
    }
    Map<String, int> occurrences2 = LinkedHashMap.fromIterable(lab_dates, key: (i) => i, value: (i) => lab_dates.where((j) => j == i).length);
    List<int> valuesL = occurrences2.values.toList();
    List<String> keysL = occurrences2.keys.toList(); 
    for (var i = 0; i < valuesL.length; i++) {
      labs.add(Labs(keysL[i], valuesL[i]));
    }
    int lstlen = valuesM.length + valuesL.length;
    print(occurrences);
    // print(occurrences2);
    //  for(int i = 0; i <3; i++){
    //   medlabs.add(MedicineLabs(keysM[i],valuesM[i],keysL[i],valuesL[i]));
    // }  
    notifyListeners();
  }
  clearLab(){
    serialNo_lab.clear();
    patient_names_lab.clear();
    patients_age_lab.clear();
    prescription_url_lab.clear();
    notifyListeners();
  }
   clearMed(){
    serialNo_med.clear();
    patient_names.clear();
    patients_age.clear();
    prescription_url.clear();
    notifyListeners();
  }
  medDetail()async{
    for(int i = 0 ;i < patient_names.length;i++){
      serialNo_med.add(i+1);
    }
    for (var i = 0; i < patient_names.length; i++) {
      med_detail.add(MedicineDetail(serialNo_med[i], patient_names[i], patients_age[i], prescription_url[i],status[i],uid_med[i]));
    }
    await Future.delayed(const Duration(seconds: 3));
    print('${med_detail}meddetails');
    notifyListeners();
  }
  labDetail() async{
    for(int i = 0 ;i < patient_names_lab.length;i++){
      serialNo_lab.add(i+1);
    }
    for (var i = 0; i < patient_names_lab.length; i++) {
      lab_detail.add(LabDetail(serialNo_lab[i], patient_names_lab[i], patients_age_lab[i], prescription_url_lab[i],status_lab[i],uid_lab[i]));
    }
    await Future.delayed(const Duration(seconds: 3));
    print('${med_detail}labdetails');
    notifyListeners();
  }
 
  med()async{
   try {
      Map<String, int> occurrences = LinkedHashMap.fromIterable(med_dates, key: (i) => i, value: (i) => med_dates.where((j) => j == i).length);
    List<int> values = occurrences.values.toList();
    List<String> keys = occurrences.keys.toList();  

    for(int i = 0; i < values.length; i++){
      medicines.add(Medicine(keys[i],values[i],));
    }  
    
    print("${medicines}meddd");
   } catch (e) {
     print("${e}errrrrorrrr");
   }
    
    notifyListeners();
  }
  lab(){
   try {
      Map<String, int> occurrences = LinkedHashMap.fromIterable(lab_dates, key: (i) => i, value: (i) => lab_dates.where((j) => j == i).length);
    List<int> values = occurrences.values.toList();
    List<String> keys = occurrences.keys.toList();  

    for(int i = 0; i < values.length; i++){
      labs.add(Labs(keys[i],values[i],));
    }  
    print(labs);
   } catch (e) {
     print("${e}errrrrorrrr");
   }
    
    notifyListeners();
  }
  Conversion(){
    if (Wei_kg!=null) {
      finalWeight_kg = Wei_kg;
    } else {
      finalWeight_kg =( wei_lbs!/(2.20462));
    }
    
    notifyListeners();
  }

  ftConversion(){
    finalHeight_m = hei_ft!*0.304;   
    notifyListeners();
  }

  Conversion2(){
    if (hei_ft!=null) {
      finalHeight_m = hei_ft!*0.304;
    } else {
      finalHeight_m = hei_cm!*0.01;
    }
    notifyListeners();
  }

  BMI(){
    bmi = finalWeight_kg!/(finalHeight_m!*finalHeight_m!);
    print(bmi);
    notifyListeners();
  }
  
 EstWeight(){
   if(bmi!<18.5){
      estWeight=20*(finalHeight_m!*finalHeight_m!);
   }
   else if(bmi!>18.5 && bmi!<24.9){
      estWeight=finalWeight_kg;
   }
   else if(bmi!>25.0 && bmi!<30.0){
      estWeight=29*(finalHeight_m!*finalHeight_m!);
   }
   else if(bmi!>30.0){
      estWeight=34*(finalHeight_m!*finalHeight_m!);
   }
    notifyListeners();
 }


 String? planAmount;
 String? utilizedAmount;



  List<dynamic> list1 =  [
  {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Al-Khalij Tower Main Shaheed-e-Millat",
   "Contact": "0346-7698961",
   "lat": 24.8807063,
   "lng": 67.0616774
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop No. 2 Rafiqui Shaheed Road, Karachi",
   "Contact": "0344-4453319",
   "lat": 24.8811817,
   "lng": 67.0596238
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop #04 Floor Lane 4 Sehar Commercial Phase 7 DHA",
   "Contact": "0345-4014984",
   "lat": 24.8137312,
   "lng": 67.0678928
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop#S-10 Ground Floor Usman garden Gulistan-e-Johar Block#13 Karachi.",
   "Contact": "03321424250",
   "lat": 24.8755932,
   "lng": 67.0385341
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop#2 Toshi Square, Block 13-B Gulshan-e-Iqbal Opp: Masjid Baitul Mukkarram, Karachi",
   "Contact": "03321424250",
   "lat": 24.9087866,
   "lng": 67.0818292
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop No.6 Darakhshan Society Malir Township Colony, Karachi",
   "Contact": "0344-4473129",
   "lat": 24.8822079,
   "lng": 67.1803567
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop No.2 Block-C (111-C 109) Nazimabad Karachi",
   "Contact": "0345-4014530",
   "lat": 24.9192485,
   "lng": 67.02734
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Abbas Square Ground Floor Plot# P12/B ST-7/B Block-7 F.B Area(Near Dhamthal Sweets) Karachi",
   "Contact": "0344-4476947",
   "lat": 24.9272889,
   "lng": 67.0626234
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop No. 2 Rafiqui Shaheed Road, Karachi",
   "Contact": "0344-4453319",
   "lat": 24.8657541,
   "lng": 67.0359753
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Road Bihar Muslim cop. Housing Society, Karachi",
   "Contact": "03408883249",
   "lat": 24.880944,
   "lng": 67.0606506
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Dr. Fazal Mobin Clinic, Firdous Shopping Mall, Gulshan-e-Iqbal, Block-2, Karachi",
   "Contact": "",
   "lat": 24.9266263,
   "lng": 67.0871661
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Plot#St-02 Block T Qalandria Chowk Opp Talib Chaman Park North Nazimabad Khi",
   "Contact": "02136630921",
   "lat": 24.9593148,
   "lng": 67.0471903
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Plot#141-2 Street 1/B Sector 3 Zaman Town Korangi 3 1/2 Karachi",
   "Contact": "0333-3998354",
   "lat": 24.826191,
   "lng": 67.1509313
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Plot No 423/20 Kalaboard Malir",
   "Contact": "0333-3998331",
   "lat": 24.8847622,
   "lng": 67.0764172
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Plot,125-2khargat Road Near Numaish Chowrangi Parsi Colony Khi",
   "Contact": "0333-3998345",
   "lat": 24.8727307,
   "lng": 67.032154
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Near Farooq-e-azam Masjid Block K Mumtaz Hospital Khi",
   "Contact": "021-3662666",
   "lat": 24.9276569,
   "lng": 66.9323802
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Near Teen Talwar Chowrangi Clifton Karachi",
   "Contact": "0333-3998364",
   "lat": 24.872649,
   "lng": 66.9643019
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "C-55 Block 17 Near Bank Al Habib Samnabad Gulberg Chowrangi Karachi",
   "Contact": "0333-3998352",
   "lat": 24.9421392,
   "lng": 67.0691497
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "C/ 42-43,Rizvia Society, Karachi",
   "Contact": "0333-0130046",
   "lat": 24.8997603,
   "lng": 67.0265959
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Al-maseeha General Hospital Landhi No.5 Khi",
   "Contact": "0333-3998354",
   "lat": 24.8408391,
   "lng": 67.187579
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Jamat E Islah E Qoum Medical Center Landhi #6 Karachi",
   "Contact": "0333-3998366",
   "lat": 24.8367745,
   "lng": 67.1789086
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Area 36/1near Dakhana Chowrangi Shahrah E Pakistan Karachi",
   "Contact": "0333-3998339",
   "lat": 24.8847935,
   "lng": 67.0288421
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Sector#11 Mehmoodabad #6 Near Sitara Bakeri Khi",
   "Contact": "0333-3998359",
   "lat": 24.858695,
   "lng": 67.0826115
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Plot # C-6/7 Shop #3 Shabbir Eye Hospital Metrovile Site Karachi",
   "Contact": "0333-3998367",
   "lat": 24.9241225,
   "lng": 66.9842201
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Fatima Homes Soldier Bazar #2 Paknight Clinic Shah Nawaz Bhutto Road Karachi",
   "Contact": "0335-2559106",
   "lat": 24.8743045,
   "lng": 67.0291891
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "R-13 5c4 North Karachi Near Power House Chowrangi Near Quba Masjid U Bank Karachi",
   "Contact": "0333-0324985",
   "lat": 24.988224,
   "lng": 67.0301205
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Saudabad Malir",
   "Contact": "0333-3998315",
   "lat": 24.8935158,
   "lng": 67.1591838
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Opp Bagh E Halar Hospital Shoe Market Karachi",
   "Contact": "0333-1219964",
   "lat": 24.9201264,
   "lng": 67.0925527
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop No 12 Sania Arcade Main Soldier Bazar Signal No Khi",
   "Contact": "0331-2154441",
   "lat": 24.8769821,
   "lng": 67.0325883
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Opp. Nishtar Park Ahmed Manzil,Soldier Bazar#2,Karachi",
   "Contact": "021-32222885",
   "lat": 24.8752776,
   "lng": 67.0303017
 },
 {
   "Hospital Name": "Rahila Research and Reference Lab (Pvt.) Ltd.",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "65 B/ 1, Muhammad Ali Cooperative Housing Society. Near Kaybee Resturant, Opposite Masjid-e-Bilal, Karachi",
   "Contact": "0321-9207136",
   "lat": 24.8769233,
   "lng": 67.0848397
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Z-74, DMC Society, Tariq Road, Karachi",
   "Contact": "0320 4557772",
   "lat": 24.8777868,
   "lng": 67.0614582
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "10th Street, Khayaban-e-Rahat, Phase 6, DHA, Karachi",
   "Contact": "(021)35345199",
   "lat": 24.8042254,
   "lng": 67.0614375
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "21st E-Street, near NADRA Mega Center, Phase 1, DHA, Karachi",
   "Contact": "(021) 3538 5515",
   "lat": 24.836028,
   "lng": 67.0533965
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Defence Market, opp. Sunny Medico, Phase 2, DHA, Karachi",
   "Contact": "(021) 3539 0808",
   "lat": 24.8416496,
   "lng": 67.0552022
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Street 1, 100 Foot Road, Azam Town, Karachi",
   "Contact": "(021) 3589 7771",
   "lat": 24.8430114,
   "lng": 67.0688261
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Hilal-e-Ahmer House, Teen Talwar, Clifton, Karachi",
   "Contact": "(021) 3537 3662",
   "lat": 24.8342963,
   "lng": 67.0308008
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Marine Arcade, opp. BBQ Tonite, Block 3, Clifton, Karachi",
   "Contact": "(021) 3537 6777",
   "lat": 24.816098,
   "lng": 67.0188159
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "10th Street, opp. Zamzama Park, Neelum Colony, Clifton, Karachi",
   "Contact": "(021) 3586 0131",
   "lat": 24.8140949,
   "lng": 67.0337943
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Nursery Flyover, Shahrah-e-Quaideen, Block 2, PECHS, Karachi",
   "Contact": "(021) 3455 5975",
   "lat": 24.8613189,
   "lng": 67.0569953
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Near Chanesar Halt, Mahmoodabad, Block 6, PECHS, Karachi",
   "Contact": "03204557773",
   "lat": 24.8531581,
   "lng": 67.0633345
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "University Road, adj. Ashfaq Mem. Hospital, Gulshan-e-Iqbal, Karachi",
   "Contact": "(021) 3496 5173",
   "lat": 24.9096861,
   "lng": 67.0831058
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Sahba Akhtar Road, Block 13 D-2, Gulshan-e-Iqbal, Karachi",
   "Contact": "(021) 3498 6552",
   "lat": 24.9094405,
   "lng": 67.069971
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "R-513, Hussain Hazara Goth, Block 11, Gulshan-e-Iqbal, Karachi",
   "Contact": "(021) 3485 7771",
   "lat": 24.9140646,
   "lng": 67.0888503
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "S.M Toufiq Road, Liaquatabad Underpass, Karachi",
   "Contact": "(021) 3485 7771",
   "lat": 24.9088717,
   "lng": 67.0442338
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Sector 11-B, opp. Masjid-e-Taiyyaba, North Karachi, Karachi",
   "Contact": "(021) 3690 7697",
   "lat": 24.9751411,
   "lng": 67.0619602
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "JF Plaza, Five Star Chowrangi, North Nazimabad Town, Karachi",
   "Contact": "(021) 3663 1957",
   "lat": 24.9420597,
   "lng": 67.0441047
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Behind Taj Medical Complex, off M.A Jinnah Road, Karachi",
   "Contact": "(021) 3278 6499",
   "lat": 24.8679681,
   "lng": 67.0299029
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Rafiq Plaza, Main Lucky Star, Saddar, Karachi",
   "Contact": "(021) 3569 1114",
   "lat": 24.8573849,
   "lng": 67.0309623
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Ground Floor, 372 Iqbal Hoti Road, Gazdarabad, Karachi",
   "Contact": "(021) 3272 6633",
   "lat": 24.864544,
   "lng": 67.0139032
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Sector 48-H, Korangi Creek, Karachi",
   "Contact": "0346 828 0085",
   "lat": 24.8149981,
   "lng": 67.0604933
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Riaz Mahmood Clinic, behind PSO Pump, Korangi No. 5, Karachi",
   "Contact": "(021) 3503 5332",
   "lat": 24.8318669,
   "lng": 67.0944467
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Commercial Area, Cattle Colony, Landhi, Karachi",
   "Contact": "3361816623",
   "lat": 24.8363029,
   "lng": 67.2610673
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Kala Board Stop, near Atia Hospital, National Highway, Malir, Karachi",
   "Contact": "(021) 3450 1199",
   "lat": 24.8819053,
   "lng": 67.1817009
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Street 18/C, Mauripur Road, Lyari, Karachi",
   "Contact": "3224557771",
   "lat": 24.8675578,
   "lng": 66.8424309
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Opp. City School PAF Chapter, Baloch Colony, Karachi",
   "Contact": "(021) 3430 0190",
   "lat": 24.8616114,
   "lng": 67.0851678
 },
 {
   "Hospital Name": "Dr. Mehdi A. Manji Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "105-L, P.E.C.H.S, Near Noorani Kabab House, Shahrah-e-quaideen, Karachi",
   "Contact": "021-34555952",
   "lat": 24.8678455,
   "lng": 66.9822624
 },
 {
   "Hospital Name": "Dr. Mehdi A. Manji Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "LS 43, Sector 11/ U.P Mor, Karachi",
   "Contact": "021-36902811",
   "lat": 24.9727733,
   "lng": 67.0319475
 },
 {
   "Hospital Name": "Dr. Mehdi A. Manji Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "B-171, Block - 2 Near oxford School Allama Shabbir A. Usmani Rd, Gulshan-e-iqbal, Karachi",
   "Contact": "021-34972777",
   "lat": 24.9481748,
   "lng": 67.0257635
 },
 {
   "Hospital Name": "Karachi Laboratory & Diagnostic Centre",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Delhi Mercantile Medical Complex Building Siraj-ud-Duala Road, Off Shaheed-e-Millat Rd, Darul Aman Society PECHS, Karachi",
   "Contact": "0336-4444817 ",
   "lat": 24.8761197,
   "lng": 67.0319327
 },
 {
   "Hospital Name": "Karachi Laboratory & Diagnostic Centre",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Arif Defence Medical Centre, DK-1, Khayaban-e-Bukhari / 34th Street, Defence Housing Authority, Phase VI, Karachi",
   "Contact": "0336-4444817 ",
   "lat": 24.7841132,
   "lng": 67.052503
 },
 {
   "Hospital Name": "Karachi Laboratory & Diagnostic Centre",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Ground Floor, ISM Building, Adjacent Anklesaria Nursing Home, Garden Road Karachi,",
   "Contact": "0336-4444817 ",
   "lat": 24.8666936,
   "lng": 67.0216593
 },
 {
   "Hospital Name": "Karachi Laboratory & Diagnostic Centre",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "E/2 Shamim Apartments Block 10, F.B Area, Adjacent Ayesha Manzil, Roundabout, Shahrah-e-Pakistan, Karachi",
   "Contact": "0336-4444817",
   "lat": 24.9284107,
   "lng": 67.0624569
 },
 {
   "Hospital Name": "Pro Lab Diagnostic Centre",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Unit # 1, 165-N Building, Khayaban-e-Muslim, D.H.A Phase 6 Muslim Commercial Area Karachi",
   "Contact": "0302-2835590",
   "lat": 24.8194649,
   "lng": 67.0196942
 },
 {
   "Hospital Name": "C Lab Diagnostics",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "shop no.14 Taj st, MA.Jinnah Road Saddar, Karachi, Pakistan.",
   "Contact": "+92 (0304) 111 2080",
   "lat": 24.9002442,
   "lng": 66.9944936
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "B-122 Blue building? Block H North Nazimabad Town, Karachi",
   "Contact": "(021) 111 786 986",
   "lat": 24.9409632,
   "lng": 67.0449514
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Suite#CS 19/02, Block 7, Ali Apartments, F.B. Area-Karachi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.9260001,
   "lng": 67.0631432
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "R-46, Sector 5 C-2, Near Power House Chowrangi, North Karachi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.9658295,
   "lng": 67.0397046
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "A-1/3 & 4, Block 4, Gulshan-e-Iqbal, Main Abul Hassan Isphahani Road - Karachi",
   "Contact": "(021) 111 786 986",
   "lat": 24.9583685,
   "lng": 67.0404683
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "S B 1, Suite#2, Javed Arcade, Block 17, Gulistan-e-Jauhar - Karachi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.911527,
   "lng": 67.1219614
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "FL-11/17, Block 13-A, Gulshan-e-Iqbal - Karachi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.9028725,
   "lng": 67.0717632
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Billy's Arcade, Shop No.145-146, Main University Road, KDA Scheme 33, Adjacent to Johar Complex - Karachi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.9115698,
   "lng": 67.1066405
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Suite#1, Bungalow No A-31/2, Near Colony Medical Store, Shama Chorangi, Shah Faisal Colony No. 2 - Karachi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.8831949,
   "lng": 67.1435901
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Plot 3/1, Embankment Road Opp. Kakri Ground, Khi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.8550121,
   "lng": 66.8585983
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop No. 26, 28,29,30, Ground Floor, Taj Complex Main M.A. Jinnah Road - Karachi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.8790973,
   "lng": 66.9913717
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Iqbal Shaheed Road Karachi Cantt Fowler Lines.",
   "Contact": "(021) 111 786 986",
   "lat": 24.8793761,
   "lng": 66.9913716
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Suite No. 2, Plot 8-C, Near Subway & Deepak Parwani, 4th Zamzama Commercial Lane - Karachi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.8169623,
   "lng": 67.039277
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop no 5 & 6, 16-C 5th zamzama commercial lane phase V, DHA",
   "Contact": "(021) 111 786 986",
   "lat": 24.8171435,
   "lng": 67.0388696
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop No. 1, Al-Rehman Tower, Plot # 4, Adjacent Ufone Office , Jinnah Co-operative Housing Society, Block 3, Main SHM Road Karachi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.8814083,
   "lng": 67.0592802
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Jinnah Avenue, Malir Cantt, Service Ln, Rufi Down Town, Karachi, Karachi City, Sindh",
   "Contact": "(021) 111 786 986",
   "lat": 24.9291898,
   "lng": 67.1763475
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Mehran Residency, M-3, Dr Daud Pota Rd, Karachi, 75530",
   "Contact": "(021) 111 786 986",
   "lat": 24.8465945,
   "lng": 67.0348432
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "One Step Diagnostic Centre: 38-C, Lane-8, Main Khayaban-e-Muslim, Bukhari Commercial, Phase-VI - Karachi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.7942969,
   "lng": 67.0603804
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "One Step Diagnostic Centre: R-01-02, Jamal-e-Ibrahim Society Quaidabad, Karachi",
   "Contact": "(021) 111 786 986",
   "lat": 24.8607845,
   "lng": 67.2058388
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "A-65 Indus Mehran Society Main Road Saudabad Malir Colony.",
   "Contact": "(021) 111 786 986",
   "lat": 24.8816036,
   "lng": 67.1868516
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "N-28 korangi 1/2, sector 35-C, opposite PSO pump",
   "Contact": "(021) 111 786 986",
   "lat": 24.8260315,
   "lng": 67.1485078
 },
 {
   "Hospital Name": "Sehatmand Zindagi Centre",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "111-C /1, Bus Stop No 7, Nazimabad 3, Near Abbasi Hospital Karachi",
   "Contact": "021-36617404",
   "lat": 24.9189506,
   "lng": 66.995799
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "B-31, Block-15, Off University Road,Gulshan-e-Iqbal , Karachi",
   "Contact": "021 34801257-9",
   "lat": 24.90129,
   "lng": 67.0791228
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Plot No. 34-C, Badar Commercial,Street 10 , Phase V, Karachi",
   "Contact": "0303-0993790",
   "lat": 24.9014343,
   "lng": 67.0112711
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Plot No. 18-C, 4th Zamzama Lane,Phase V DHA, Karachi",
   "Contact": "0347-3095416",
   "lat": 24.8171858,
   "lng": 67.0395946
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Khayaban-e-Jami, Phase-2, Extension DHA Karachi",
   "Contact": "0333-2870120",
   "lat": 24.8279375,
   "lng": 67.0381413
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Plot # 11-C, Khayaban-e-Shahbaz,DHA Phase Vi, Karachi",
   "Contact": "0333-2870121",
   "lat": 24.808107,
   "lng": 67.0439557
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Chand Bibi Road, Adj. Civil Hospital,Karachi",
   "Contact": "0304-0742293",
   "lat": 24.8601724,
   "lng": 67.0052868
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop No. G2, Prince Avenue, Plot No. 4,Lane No 1, Nazimabad No 3 Karachi",
   "Contact": "0342-5943944",
   "lat": 24.9153486,
   "lng": 67.0276462
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop No. 11, Dada Terrace, Jamaluddin Afghani Road, Karachi",
   "Contact": "0347-9028317",
   "lat": 24.8847432,
   "lng": 67.0630292
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "R 45, Sector 5c/2, New Karachi Town,Karachi",
   "Contact": "0333-1149432",
   "lat": 24.953368,
   "lng": 67.0308402
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "P/38 Khayabane Rahat 10th St, DHA, Phase 6,Karachi",
   "Contact": "0333-1149408",
   "lat": 24.8506657,
   "lng": 67.0292136
 },
 {
   "Hospital Name": "Sky Blue Labs",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Address: Al-11, Lane 15, Khayaban-e- Hilal, Phase-7, DHA Karachi.",
   "Contact": "0311-3993145",
   "lat": 24.8508133,
   "lng": 67.0292136
 },
 {
   "Hospital Name": "Sky Blue Labs",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Address: Shop# 1, 2,3m Falaknaz Arcade II Opposite Airport Police Sta  on Shahrah-e Faisal Karachi",
   "Contact": "021-34593141",
   "lat": 24.886773,
   "lng": 67.0774966
 },
 {
   "Hospital Name": "Sky Blue Labs",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Address: Street No. 8, Near UC office, Madina Masjid, Sector B, Akhter Colony, Karachi.",
   "Contact": "0345-6000984",
   "lat": 24.8565423,
   "lng": 67.0616879
 },];

List<dynamic> hyderabad=[
   {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Hyderabad",
   "Status": "On Panel",
   "Address": "Latifabad # 6 , Near Halal-e-Ahmer Hospital, Hyderabad",
   "Contact": "0346-7698954",
   "lat": 25.3683692,
   "lng": 68.3498874
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Hyderabad",
   "Status": "On Panel",
   "Address": "Fatima Heights, Doctors Avenue, Saddar Hyderabad",
   "Contact": "0311-1456789",
   "lat": 25.3818029,
   "lng": 68.3408778
 },
 {
   "Hospital Name": "Rahila Research and Reference Lab (Pvt.) Ltd.",
   "City": "Hyderabad",
   "Status": "On Panel",
   "Address": "shop#3 Nadeem complex Near Muslim Commercial Bank Main Road, Qasimabad. Hyderabad",
   "Contact": "(0333-2605740)",
   "lat": 25.3932081,
   "lng": 68.3182969
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Hyderabad",
   "Status": "On Panel",
   "Address": "Shop No.7, Fatima Heights, Doctors Ln, Soldier Bazaar ,Saddar, Hyderabad",
   "Contact": "+92 333 2869740",
   "lat": 25.3932037,
   "lng": 68.2920321
 },
 {
   "Hospital Name": "Sky Blue Labs",
   "City": "Hyderabad",
   "Status": "On Panel",
   "Address": "Address: KT Plot # 80 survay #40 Doctor Lain Saddar Cantt Hyderabad.",
   "Contact": "0311-3993144",
   "lat": 25.3921376,
   "lng": 67.7665773
 },
{
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Hyderabad",
   "Status": "On Panel",
   "Address": "Plot # 37, civic centre Latifabad no.6, Near Nadra Centre, Hyderabad.",
   "Contact": "(021) 111 786 986",
   "lat": 25.3688321,
   "lng": 68.3517254
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Hyderabad",
   "Status": "On Panel",
   "Address": "A Plot No: C99 Shop No: 1 Govt. Corporate Housing Society Main Naseem Nagar Chowk Qasimabad Hyderabad.",
   "Contact": "(021) 111 786 986",
   "lat": 25.3979423,
   "lng": 68.3338738
 },
];

List<dynamic> islamabad = [
   {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Shop# 05, 106-West Royal Centre, Fazal-e-Haq Road, Blue Area Islamabad.",
   "Contact": "0344-4443099",
   "lat": 33.7099922,
   "lng": 73.05557
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "110 Fazal-ul-Haq Road, Blue Area, IslAMabad.",
   "Contact": "051-831 1000",
   "lat": 33.7104987,
   "lng": 73.0566323
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "THE MALL SHOP, SHOP # 1, OPP PSO",
   "Contact": "051-232 2154",
   "lat": 33.6289233,
   "lng": 72.9086772
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Ground floor of the building federation tower, situared Sector E11/2 Markaz IslAMabad",
   "Contact": "051-874 6777",
   "lat": 33.697803,
   "lng": 72.8306339
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Shop no .6 basement umer plaza F8 markaz",
   "Contact": "051-831 1398",
   "lat": 33.715389,
   "lng": 73.0351891
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "PLOT # 5,Shop # 1, B-1 Capital Trade Center near Rahat Bakers F-10 Marakaz",
   "Contact": "051-831 1277",
   "lat": 33.6965871,
   "lng": 73.0089539
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Shop # 7, Ground Floor Lard Trade CENTRE",
   "Contact": "051-835 0191",
   "lat": 33.6830971,
   "lng": 72.9537735
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "PLOT # 35, Shop#14,Near by D.Watson, Al HAMeed Mall",
   "Contact": "051-835 0050",
   "lat": 33.669371,
   "lng": 72.9970209
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Khaiber Plaza 4, shop # 1, 17 G-15 Markaz IslAMabad",
   "Contact": "051-232 8189",
   "lat": 33.6335944,
   "lng": 72.888051
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "PLOT # 3, Shop # 8 Aniqe Arcade Plaza, near Alfalah bank",
   "Contact": "051-835 6615",
   "lat": 33.6335734,
   "lng": 72.8355203
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Excel Labs Diagnostic Unit Munawar Plaza Basement of Soneri bank I-10 markaz",
   "Contact": "051-831 4344",
   "lat": 33.6480811,
   "lng": 73.0374296
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "OGDCL Medical Center F-8 Markaz Excel Labs IslAMabad",
   "Contact": "051-2856 446",
   "lat": 33.6480614,
   "lng": 72.969578
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "OGDCL Medical Center, 39/B B Block Satellite Town, Rawalpindi",
   "Contact": "051- 8734 387",
   "lat": 33.6977635,
   "lng": 72.8306338
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "shop # 1, Hassan Abbas Plaza Gull Berg Town Ali Pur opposite Shell Pump",
   "Contact": "051-261 6044",
   "lat": 33.6332567,
   "lng": 72.9544861
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Main branch: 6-Pak Pavillion Plaza, 65-e, Fazal-e-Haq Road",
   "Contact": "051-2806327-8",
   "lat": 33.7114388,
   "lng": 73.0522893
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Capital ShoppingCentre, Next to Ramna Police Station, G-11 Markaz",
   "Contact": "051-4717881",
   "lat": 33.6673011,
   "lng": 72.9274597
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Plot # 4-E, Shoukat Plaza I-10 Markaz Islamabad",
   "Contact": "051-2806327-8",
   "lat": 33.6482658,
   "lng": 73.0382453
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Capital Shopping Centre, Opp Bank of Punjab G-11 Markaz Islamabad",
   "Contact": "051-2806327-8",
   "lat": 33.6673011,
   "lng": 72.9953088
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Huma Plaza, Opp Poly Clinic, Fazl e Haq Road Islamabad",
   "Contact": "051-2806327-8",
   "lat": 33.7172931,
   "lng": 73.0685913
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Mehran Plaza, Adjacent Abdullah Bin Masood Masjid G-9 Markaz Islamabad.",
   "Contact": "051-2806327-8",
   "lat": 33.6877114,
   "lng": 73.0317184
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "8-Ground Floor, Makka Plaza, BLock-D, PWD Housing Society Islamabad.",
   "Contact": "051-2806327-8",
   "lat": 33.7114388,
   "lng": 73.0588553
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Aklasc Plaza behind Babri Masjid, G-10 Markaz Islamabad.",
   "Contact": "051-2806327-8",
   "lat": 33.6770319,
   "lng": 73.0140678
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Shop# 01, Lower Ground Floor Shalimar Plaza, F-8 Markaz Isd.",
   "Contact": "051-2806327-8",
   "lat": 33.7116464,
   "lng": 73.0401764
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Shop no 6, (lower ground floor) Plot no 14, Street Commercial Avenue, Bahria Enclave, Islamabad",
   "Contact": "051-2806327-8",
   "lat": 33.6972589,
   "lng": 73.1022297
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Hall No. 3A & 6A Lower Ground Floor, Executive Complex , Plot No 14 G-8 Markaz , Islamabad",
   "Contact": "0333-2870124",
   "lat": 33.6318244,
   "lng": 73.0426765
 },
 {
   "Hospital Name": "Margalla Diagnostics & Clinics",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": " MDC, 1st Floor, Islamabad Corporate Centro, Golra Rd, Islamabad",
   "Contact": "0333-3058000",
   "lat": 33.6318288,
   "lng": 72.966073
 },

];

List<dynamic> peshawar = [
  {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Pak Medical Center, Khyber Bazaar, Shoba Bazaar, Peshawar",
   "Contact": "3408883249",
   "lat": 34.0063626,
   "lng": 71.5586647
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Abaseen Hospital, Dabagari Garden, Peshawar",
   "Contact": "",
   "lat": 34.0025448,
   "lng": 71.5580679
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Khattak Medical Centre Dabgari Garden Peshawar",
   "Contact": "0308-4379695",
   "lat": 34.0025537,
   "lng": 71.5580679
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Opposite Gyne & Emergency Block Lady Reading Hospital Peshawar",
   "Contact": "0335-1113209, 091-2580085",
   "lat": 34.010281,
   "lng": 71.5704455
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Shop# 05 Opposite KTH Doctor Hostel University Town Peshawar",
   "Contact": "0917087278",
   "lat": 33.9989647,
   "lng": 1.4703913
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "OPP HAYYATABAD MEDICAL COMPLEX DOCTOR PLAZA",
   "Contact": "03458402877",
   "lat": 33.9940481,
   "lng": 71.4346894
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Akbar Medical Center, Ramdas Chowk, Peshawar",
   "Contact": "",
   "lat": 34.0001979,
   "lng": 71.5574368
 },
 {
   "Hospital Name": "Rahila Research and Reference Lab (Pvt.) Ltd.",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "43 park road, University town. Peshawar",
   "Contact": "(0333-8599499)",
   "lat": 34.0036811,
   "lng": 71.5567852
 },
 {
   "Hospital Name": "Real Time PCR Diagnostics",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Ground Floor, G-30,Auqaf Plaza, Dabgari Garden Peshawar",
   "Contact": "0303-7770520",
   "lat": 34.0036816,
   "lng": 71.5577172
 },
 {
   "Hospital Name": "Real Time PCR Diagnostics",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "MF-92,First Floor,Pak Medical Center, Karachi Market, Khyber Bazar , Peshawar",
   "Contact": "0311-9980066",
   "lat": 34.0099208,
   "lng": 71.5625296
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "The Mall Tower Adjacent to Shaheen Chemist Mall Road Peshawar Cantt.",
   "Contact": "091-526 1066",
   "lat": 33.999173,
   "lng": 71.5171166
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Opp. Mission Hospital Tajammul Mansion Dabgari Road.",
   "Contact": "091-221 8663",
   "lat": 33.9981244,
   "lng": 71.4691793
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Phase 5-Hayatabad, Peshawar, Khyber Pakhtunkhwa",
   "Contact": "051-2806327-8",
   "lat": 33.9894359,
   "lng": 70.316752
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Swabi Main Bazaar NearJamal Medical Centre Opposite DHQ Hospital Khyber Pakhtunkhwa",
   "Contact": "051-2806327-8",
   "lat": 34.122281,
   "lng": 72.4638591
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Shamsi Rd, Mardan, Khyber Pakhtunkhwa",
   "Contact": "051-2806327-8",
   "lat": 34.1924453,
   "lng": 1.7593636
 },
];


List<dynamic> rawalpindi = [
   {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": " Family Plaza Shop#2 Opp: Gate#3 Holy Family Hospital Rawalpindi",
   "Contact": " 0345-8402876",
   "lat": 33.6420664,
   "lng": 73.0567131
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Shop No.1 Cantt Plaza  Commercial Market. Chaklala Scheme III. Rawalpindi",
   "Contact": " 0345-8402876",
   "lat": 33.5848468,
   "lng": 73.0869428
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Shop No O/1006/7 Ground Floor Opp: Benezir Bhutto Hospital Out Gate Main Murree Road Rawalpindi",
   "Contact": "3454015059",
   "lat": 33.6268811,
   "lng": 73.0673166
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Bahria Town Phase 7 Rawalpindi Opp DHA bridge Haroon Plaza 28-B Mini Commercial Extension",
   "Contact": "0340-555275",
   "lat": 33.5212039,
   "lng": 73.1010839
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Satellite Town Rawalpindi opposite Holy Family Hospital gate # 3",
   "Contact": "0345-8406745",
   "lat": 33.6420664,
   "lng": 73.0567131
 },
 {
   "Hospital Name": "Rahila Research and Reference Lab (Pvt.) Ltd",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "F881 Opp gate #3 Holi Family hospital 5th road Sattelite town.",
   "Contact": "0321-5308456",
   "lat": 33.6403643,
   "lng": 73.0580861
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "CHUNGI # 20  OPP MUNAWAR COLONY MAIN ADYALA ROAD",
   "Contact": "051-831 5380",
   "lat": 33.5476982,
   "lng": 73.0549351
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Civic center,  airport housing society  Gulzar-a-Quaid",
   "Contact": " 051-549 7153",
   "lat": 33.5477675,
   "lng": 73.021217
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Shop No 2  Plaza No 147 Civic Centre",
   "Contact": " 051-831 2096",
   "lat": 33.5487807,
   "lng": 73.122652
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Plot # 57  HB Commercial. Opp. Bahria Internation hospital",
   "Contact": "0300-077 1720",
   "lat": 33.4922862,
   "lng": 73.0653249
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "SHOP # GF-5 Raffay mall chor chowk main peshwar road RWP",
   "Contact": " 051-874 4430",
   "lat": 33.6070671,
   "lng": 72.7349209
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Plaza #55 jinah boulevard  Sector E dha phase 2 islamabad",
   "Contact": " 051-5419515",
   "lat": 33.5312401,
   "lng": 73.1562345
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Adjacent to Kidney Centre Opp Shifa Eye Trust Shadman Colony Main G.T ",
   "Contact": "051-831 6491",
   "lat": 33.5600375,
   "lng": 73.085102
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "72-C   Opposite Bilal Hospital Sadiqabad Rawalpindi",
   "Contact": " 051-843 1779",
   "lat": 33.6334419,
   "lng": 73.0763738
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "SHOP # P-1046-2  Perwaiz Plaza Opposite Ayub Medical Centre Main Siadpur Road",
   "Contact": " 051-8312094",
   "lat": 33.6295906,
   "lng": 73.0618832
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Kashmir Road Opp. Jahangir Restaurant Saddar Rawalpindi.",
   "Contact": "051-556 5484",
   "lat": 33.5991684,
   "lng": 73.0541659
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Shop#1 SMDC-II Plaza Main Soan Double Road Block A",
   "Contact": " 051-542 8144",
   "lat": 33.5665786,
   "lng": 73.151446
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Shop# 3  Basement Adnan Heights  Commercial Area  Chaklala Scheme 3 Chaklala Cantt. Rawalpindi",
   "Contact": "051-28063278",
   "lat": 33.5859734,
   "lng": 73.0857101
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Opp B.B Hospital Mallik Plaza Murree Road  Rawalpindi",
   "Contact": "051-28063278",
   "lat": 33.6301868,
   "lng": 73.0227666
 },
 
];

List<dynamic> faisalabad = [
   
  {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Dr. Habib Shah Chowk, Mandi Farooqabad.",
   "Contact": "0345-4100356",
   "lat": 31.7414904,
   "lng": 73.8262715
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Main Gulberg Road,Opposite National Hospital,Near Tabaq Restaurant Faisalabad.",
   "Contact": "041-2647722",
   "lat": 31.4219163,
   "lng": 73.0612414
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Akbarabad Chowk Near Allied Hospital Faisalabad",
   "Contact": "0345-8445046",
   "lat": 31.4439307,
   "lng": 73.0818665
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Saleemi Chowk, Satiana Road, Opp National Bank Faisalabad",
   "Contact": "041-8727555",
   "lat": 31.4249141,
   "lng": 73.0729645
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Susan Road, Madina Town, Faisalabad",
   "Contact": "0345-4998408",
   "lat": 31.4249141,
   "lng": 73.0729645
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Jinnah Clinic, Near Faisal Hospital, Canal Road, Faisalabad",
   "Contact": "0345-8402874",
   "lat": 31.405883,
   "lng": 73.066537
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Al-Moiz Diagnostic Center, Ghulamabad, Faisalabad",
   "Contact": "03458402874",
   "lat": 31.4395465,
   "lng": 73.012025
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Gojra Road, OPP Dsp Office, Sumandari Distt: Faisalabad.",
   "Contact": "041-3425586",
   "lat": 31.0625564,
   "lng": 72.9519636
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Prime Care Hospital, Madina Town, Faisalabad",
   "Contact": "0311-1456789",
   "lat": 31.4210679,
   "lng": 73.1131407
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "219 B Aziz Fatima Hospital Road Near Shalimar Hotel Gulistan Colony Faisalabad",
   "Contact": "041-8845051",
   "lat": 31.4260332,
   "lng": 73.0838426
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Opposite Pace College Near A-One Surgical Allied Hospital Faisalabad",
   "Contact": "041-2623355",
   "lat": 31.448202,
   "lng": 73.0466714
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Inside Green Pharmacy Near Ideal Bakery Susan Road Faisalabad",
   "Contact": "041-854 3355",
   "lat": 31.4202307,
   "lng": 73.0808005
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "339- B Near Doctor Plaza Adjacent Punjab Bank Satyana Road Faisalabad",
   "Contact": "041-8547070",
   "lat": 31.4038668,
   "lng": 73.0867173
 }
];



var markerIdd = [];
var latitude = [];
var longitude = [];

var title = [];//address
var city = [];
var name = [];
var contact =[];

String?nameL ;
String?addressL;
String?contactL;
String?cityL;
  
List<MarkerData> karachiLabs = [];
List<MarkerData> hyderabadLabs = [];
List<MarkerData> islamabadLabs = [];
List<MarkerData> peshawarLabs = [];
List<MarkerData> rawalpindiLabs = [];
List<MarkerData> faisalabadLabs = [];

void Karachi()async{
  for (var i=0;i<list1.length;i++) {
    markerIdd.add(list1[i]['City']);
    title.add(list1[i]['Address']);
    latitude.add(list1[i]['lat']);
    longitude.add(list1[i]['lng']);
    city.add(list1[i]['City']);
    name.add(list1[i]['Hospital Name']);
    contact.add(list1[i]['Contact']);
    karachiLabs.add(MarkerData(markerIdd[i],latitude[i], longitude[i],title[i],name[i],contact[i],city[i]));
  }
  nameL = name[0];
  addressL = title[0];
  contactL = contact[0];
  cityL = "Karachi";
  print("${karachiLabs} karachi labs");
  notifyListeners();
}

void Hyderabad()async{
  for (var i=0;i<hyderabad.length;i++) {
    markerIdd.add(hyderabad[i]['City']);
    title.add(hyderabad[i]['Address']);
    latitude.add(hyderabad[i]['lat']);
    longitude.add(hyderabad[i]['lng']);
    city.add(hyderabad[i]['City']);
    name.add(hyderabad[i]['Hospital Name']);
    contact.add(hyderabad[i]['Contact']);
    hyderabadLabs.add(MarkerData(markerIdd[i],latitude[i], longitude[i],title[i],name[i],contact[i],city[i]));
  }
   nameL = name[0];
  addressL = title[0];
  contactL = contact[0];
  cityL = "Hyderabad";
  print("${hyderabadLabs} hyderabad labs");
  notifyListeners();
}

void Islamabad()async{
  for (var i=0;i<islamabad.length;i++) {
    markerIdd.add(islamabad[i]['City']);
    title.add(islamabad[i]['Address']);
    latitude.add(islamabad[i]['lat']);
    longitude.add(islamabad[i]['lng']);
    city.add(islamabad[i]['City']);
    name.add(islamabad[i]['Hospital Name']);
    contact.add(islamabad[i]['Contact']);
    islamabadLabs.add(MarkerData(markerIdd[i],latitude[i], longitude[i],title[i],name[i],contact[i],city[i]));
  }
   nameL = name[0];
  addressL = title[0];
  contactL = contact[0];
  cityL = "Islamabad";
  print("${islamabadLabs} islamabad labs");
  notifyListeners();
}

void Peshawar()async{
  for (var i=0;i<peshawar.length;i++) {
    markerIdd.add(peshawar[i]['City']);
    title.add(peshawar[i]['Address']);
    latitude.add(peshawar[i]['lat']);
    longitude.add(peshawar[i]['lng']);
    city.add(peshawar[i]['City']);
    name.add(peshawar[i]['Hospital Name']);
    contact.add(peshawar[i]['Contact']);
    peshawarLabs.add(MarkerData(markerIdd[i],latitude[i], longitude[i],title[i],name[i],contact[i],city[i]));
  }
   nameL = name[0];
  addressL = title[0];
  contactL = contact[0];
  cityL = "Peshawar";
  print("${peshawarLabs} peshawar labs");
  notifyListeners();
  }

void Rawalpindi()async{
  for (var i=0;i<rawalpindi.length;i++) {
    markerIdd.add(rawalpindi[i]['City']);
    title.add(rawalpindi[i]['Address']);
    latitude.add(rawalpindi[i]['lat']);
    longitude.add(rawalpindi[i]['lng']);
    city.add(rawalpindi[i]['City']);
    name.add(rawalpindi[i]['Hospital Name']);
    contact.add(rawalpindi[i]['Contact']);
    rawalpindiLabs.add(MarkerData(markerIdd[i],latitude[i], longitude[i],title[i],name[i],contact[i],city[i]));
  }
   nameL = name[0];
  addressL = title[0];
  contactL = contact[0];
  cityL = "Rawalpindi";
  print("${rawalpindiLabs} rawalpindi labs");
  notifyListeners();
  }

void Faisalabad()async{
  for (var i=0;i<faisalabad.length;i++) {
    markerIdd.add(faisalabad[i]['City']);
    title.add(faisalabad[i]['Address']);
    latitude.add(faisalabad[i]['lat']);
    longitude.add(faisalabad[i]['lng']);
   city.add(faisalabad[i]['City']);
    name.add(faisalabad[i]['Hospital Name']);
    contact.add(faisalabad[i]['Contact']);
    faisalabadLabs.add(MarkerData(markerIdd[i],latitude[i], longitude[i],title[i],name[i],contact[i],city[i]));
  }
   nameL = name[0];
  addressL = title[0];
  contactL = contact[0];
  cityL = "Faisalabad";
  print("${faisalabadLabs} faisalabad labs");
  notifyListeners();
  }




















    var cityList =''' 
   [
    {
      "Hospital Name": "Aga Khan University Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Stadium Road",
      "Contact": "3493-0051",
      "lat": "24.8920106",
      "lng": 67.0725267
    },
    {
      "Hospital Name": "Aga Khan Hospital For Women-Karimabad",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Block-7, Shahra-e-Pakistan, F B Area",
      "Contact": "36823045 / 36323465",
      "lat": "24.9264081",
      "lng": 67.0621538
    },
    {
      "Hospital Name": "Aga Khan Maternity Home-Garden",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Gold Street, Garden East",
      "Contact": "3225-0966 / 0522, +92 21 3225 6903 ext. 7468",
      "lat": "24.8830164",
      "lng": 66.9652977
    },
    {
      "Hospital Name": "Aga Khan Maternity Home-Kharadar",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Atmaram Pritam Das Road, Kharadar",
      "Contact": "32526315/32524618(EXT 318)",
      "lat": "24.8547322",
      "lng": 66.993899
    },
    {
      "Hospital Name": "Agha Khan University Health Services",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "G-69, Block-7, Kehkashan Clifton.",
      "Contact": "35837965-86",
      "lat": "24.8132094",
      "lng": 67.0122548
    },
    {
      "Hospital Name": "LIAQUAT NATIONAL HOSPITAL",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "NATIONAL STADIUM ROAD KARACHI.",
      "Contact": "4412712 -4412811 , (021) 111 456 456 3441 2728/2361 sohail: 03422049188",
      "lat": "24.9014931",
      "lng": 67.0431272
    },
    {
      "Hospital Name": "Ziauddin Hospital - Clifton",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Block-6, Scheme-5, Clifton",
      "Contact": "35862937-9 Ext 251",
      "lat": "24.8172531",
      "lng": 66.9373564
    },
    {
      "Hospital Name": "Ziauddin Hospital - Kemari",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Plot # 33, Behind KPT Hospital, Kemari",
      "Contact": "285-1881-5",
      "lat": "24.8258079",
      "lng": 66.9804167
    },
    {
      "Hospital Name": "Ziauddin Hospital - North",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "North Nazimabad.",
      "Contact": "664-8237-8-9 Ext:503/504",
      "lat": "24.9246927",
      "lng": 67.0104979
    },
    {
      "Hospital Name": "Ziauddin Cancer Hospital - North",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Block B St-16, North Nazimabad, Karachi",
      "Contact": "021-36648237-9",
      "lat": "24.9246975",
      "lng": 67.0433281
    },
    {
      "Hospital Name": "Ziauddin Hospital - Nazimabad",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Block B St-16, North Nazimabad, Karachi",
      "Contact": "021-36648237-9",
      "lat": "24.9246975",
      "lng": 67.0433281
    },
    {
      "Hospital Name": "National Medical Centre (NMC)",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Phase-1, DHA (Main Korangi Road)",
      "Contact": "538-0001Ext 375, (021) 111 222 662",
      "lat": "24.8466953",
      "lng": 67.0536281
    },
    {
      "Hospital Name": "Chiniot General Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "ST-1/3, Sector 41-B, Korangi Township, Karachi",
      "Contact": "021-35063443",
      "lat": "24.8236676",
      "lng": 67.1411127
    },
    {
      "Hospital Name": "Hashmanis Hospital - Numaish",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "JM-75, Jacob Lines OFF M.A Jinnah Road",
      "Contact": "32780329-35 (Kiran Numaish 0310-2326413) (021) 32781409",
      "lat": "24.8698079",
      "lng": 67.0324986
    },
    {
      "Hospital Name": "Hashmanis Hospital - Clifton",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "G-18, Chaudry Khaliq-uz-Zaman Road, Block 8 Clifton",
      "Contact": "35866042-43",
      "lat": "24.8698865",
      "lng": 66.9996677
    },
    {
      "Hospital Name": "Hashmanis Hospital - Gulistan-e-Jauhar",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "AG-10, Farhan Heaven, OPP KESC Office, Gulistan-e-Jauhar",
      "Contact": "34664601",
      "lat": "24.9013658",
      "lng": 66.9863483
    },
    {
      "Hospital Name": "Hashmanis Hospital - North Karachi",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "ST-41/1 sector 11/I behind Salim Centre near Kundun Lawn North Karachi",
      "Contact": "0213-6905876",
      "lat": "24.9785686",
      "lng": 67.0631613
    },
    {
      "Hospital Name": "Hashmanis Hospital - Ranchore Line",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Jinnah Street, Near Sabri Masjid, Ranchore Line, Karachi",
      "Contact": "021-32781124",
      "lat": "24.8657225",
      "lng": 67.0051219
    },
    {
      "Hospital Name": "Hashmanis Hospital - Lucky One Mall",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Rashid Minhas road, karachi",
      "Contact": "021-32781124",
      "lat": "24.9318173",
      "lng": 67.0832028
    },
    {
      "Hospital Name": "Tabba Heart Institute",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "ST-01, Block-2, F. B. Area (opposite Noori Masjid)",
      "Contact": "111-844-844 / 36334215-18 Ext 628",
      "lat": "24.9188042",
      "lng": 67.0637481
    },
    {
      "Hospital Name": "Burhani Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Tayabjee Road, Gari Khata",
      "Contact": "263-3038 / 2556",
      "lat": "24.8529066",
      "lng": 67.0078681
    },
    {
      "Hospital Name": "Mamji Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "C-19, Block-17, Federal B Area",
      "Contact": "6804666-777",
      "lat": "24.9386941",
      "lng": 67.0752816
    },
    {
      "Hospital Name": "Orthopadic & Medical Institute (OMI)",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "89/1, Depot Lines.",
      "Contact": "+92 21 32258075 - 79",
      "lat": "24.8259241",
      "lng": 67.005406
    },
    {
      "Hospital Name": "Orthopadic & Medical Institute (OMI) DHA BRANCH",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "DHA Medical Centre, 10th St., Rahat DHA Phase 6, Karachi.",
      "Contact": "021-111-OMI-111",
      "lat": "24.8259241",
      "lng": 67.005406
    },
    {
      "Hospital Name": "TO Clinic",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "ST-1,Block-6,Gulshan-e-Iqbal, Near Gulshan Chowrangi",
      "Contact": "92-21-34989005",
      "lat": "24.9246913",
      "lng": 67.0901983
    },
    {
      "Hospital Name": "Shamsi Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Shamsi Cooperative Society, Wireless Gate",
      "Contact": "34601161",
      "lat": "24.8795722",
      "lng": 67.168978
    },
    {
      "Hospital Name": "National Institute of Cardiovascular Diseases - Jinnah",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Rafiqi (H.J) Shaheed Road? Karachi 75510",
      "Contact": "(021) 99201271",
      "lat": "24.8535541",
      "lng": 67.0374525
    },
    {
      "Hospital Name": "Sir Syed Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Qayyumabad Rd, Karachi",
      "Contact": "(021) 35374095",
      "lat": "24.8294028",
      "lng": 67.0769942
    },
    {
      "Hospital Name": "Hamdrad University Hospital (Taj Medical Complex)",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Main M.A. Jinnah Road,",
      "Contact": "32782768",
      "lat": "24.8679581",
      "lng": 66.96044
    },
    {
      "Hospital Name": "PATEL HOSPITAL",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "ST 18 BLOCK-4 GULSHAN-E-IQBAL KARACHI.",
      "Contact": "4968660-61, 4816915-18,111-174-174",
      "lat": "24.9353561",
      "lng": 67.0949502
    },
    {
      "Hospital Name": "Saifee Hospital Trust",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "St-1, Block-F, North Nazim Abad, Karachi",
      "Contact": "021-36670695-96 / 021-36789400 Ext 105 (021-36784900)",
      "lat": "24.9312783",
      "lng": 67.0341595
    },
    {
      "Hospital Name": "Habib medical centre",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Karima bad",
      "Contact": "9221-6344787",
      "lat": "24.9482868",
      "lng": 67.0240467
    },
    {
      "Hospital Name": "Memon Medical Institute Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Hyder Buksh Gabol Road, Safoora Chowrangi, K.D.A., Scheme 33? Karachi",
      "Contact": "(021) 34691147",
      "lat": "24.948464",
      "lng": 66.971516
    },
    {
      "Hospital Name": "Kutiyana Memon Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Aga Khan / G Allana Road, Karachi",
      "Contact": "32315376-7,32313835-6-7",
      "lat": "24.8520337",
      "lng": 66.9911923
    },
    {
      "Hospital Name": "TABBA KIDNEY INSTITUTE",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "ST-26, Block-7, Federal 'B' Area, Karachi, Pakistan.",
      "Contact": "021-36334215-18",
      "lat": "24.923261",
      "lng": 67.0635844
    },
    {
      "Hospital Name": "Akhtar Eye Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Block-5, Gulshan-e-Iqbal, Rashid Minhas Road",
      "Contact": "34963801/34813368 0321-8242027,03008213305",
      "lat": "24.9225005",
      "lng": 67.0900877
    },
    {
      "Hospital Name": "Al-Ain Institute Of Eye Diseases",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Sharah-e-Quaideen, PECHS",
      "Contact": "34556151",
      "lat": "24.8614465",
      "lng": 67.0561826
    },
    {
      "Hospital Name": "Clifton Kidney & General Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "F-17/2, Rojhan Street, Block 5, Clifton Karachi",
      "Contact": "35837965",
      "lat": "24.817505",
      "lng": 67.0207743
    },
    {
      "Hospital Name": "kharadar General Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Agha Khan Road, Kharadar",
      "Contact": "32510113",
      "lat": "24.8536522",
      "lng": 66.9937386
    },
    {
      "Hospital Name": "Korangi Landhi Medical Centre",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Sector E-35, Main Road, Korangi-5",
      "Contact": "505-8717",
      "lat": "24.828423",
      "lng": 67.1588015
    },
    {
      "Hospital Name": "Asif Eye Hospital (Dha)",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "65-C, 24th Commercial Street, Phase II (Ext.) DHA",
      "Contact": "35385166-35451566",
      "lat": "24.8309757",
      "lng": 67.0007488
    },
    {
      "Hospital Name": "Advance Eye Clinic",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "17-C/1, Block 6, PECHS,",
      "Contact": "34540999",
      "lat": "24.860145",
      "lng": 67.0643765
    },
    {
      "Hospital Name": "Advance Radiology Clinic",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Behind Hamdard University Hospital",
      "Contact": "2783536 / 2783535 / 2786500",
      "lat": "24.8681187",
      "lng": 67.0311059
    },
    {
      "Hospital Name": "Moazzam Medical Center",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "N-211, Sector-35/C, Korangi # 31/2",
      "Contact": "021-35075211",
      "lat": "4.8720968",
      "lng": 67.0590628
    },
    {
      "Hospital Name": "HillPark General Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "S.N.C.C. 3/4, Block #3 Main Shaheed-e-Millat Road",
      "Contact": "34538563, : 9221-4538563 / 4538560 / 4538561 / 4538562",
      "lat": "24.8741044",
      "lng": 67.0715601
    },
    {
      "Hospital Name": "Asghar General Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "SD-23 Block 'B'. North Nazimabad.",
      "Contact": "36642389",
      "lat": "24.9252532",
      "lng": 66.9991801
    },
    {
      "Hospital Name": "Nehal Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "26, Kala Board, Malir, Township",
      "Contact": "4404079 / 4506615",
      "lat": "24.8825501",
      "lng": 67.1800057
    },
    {
      "Hospital Name": "Ashfaq Memorial Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "SB-9, 13/C, Main University Road, Gulshan-e-Iqbal, Karachi",
      "Contact": "021-34822261",
      "lat": "24.9092165",
      "lng": 67.0824091
    },
    {
      "Hospital Name": "Life Care Consultant Clinics",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "18-C, Mezzanine Floor, 21 East St, PH1, DHA, Off- Korangi Road, Karachi",
      "Contact": "35396808",
      "lat": "24.8360869",
      "lng": 67.0687799
    },
    {
      "Hospital Name": "Medicare cardiac and general hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Shaheed e Millat road",
      "Contact": "021-34931886-9,",
      "lat": "24.8810862",
      "lng": 67.0612727
    },
    {
      "Hospital Name": "CREEK GENERAL HOSPITAL",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "ibrahim haidri chowk, korangi , karachi",
      "Contact": "0346-8280072 and 0346-8280073",
      "lat": "24.815075",
      "lng": 67.1285722
    },
    {
      "Hospital Name": "UNITED HOSPITAL (PLASTIC SURGERY AND GENERAL HOSPITAL)",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "main shaheed-e-millat road, karachi",
      "Contact": "0322-8280222 and 0322-8280444 and 0322-8280555",
      "lat": "24.8738259",
      "lng": 67.0723215
    },
    {
      "Hospital Name": "Zubaida medical centre",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Mohd ali society",
      "Contact": "3002017861",
      "lat": "24.8832351",
      "lng": 67.0799587
    },
    {
      "Hospital Name": "Halim hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "North Nazimabad.",
      "Contact": "(021) 36647189",
      "lat": "24.8700416",
      "lng": 67.353185
    },
    {
      "Hospital Name": "Al-Hadeed Medical Center",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Gulshan e Hadeed Phase 1, Karachi",
      "Contact": "(021) 34713800",
      "lat": "24.9346961",
      "lng": 67.0313782
    },
    {
      "Hospital Name": "Shah Medical centre",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "C-6 Block -C North Nazimabad Near Asghar ali shah stadium",
      "Contact": "021-36722382-3",
      "lat": "24.9346961",
      "lng": 67.0313782
    },
    {
      "Hospital Name": "Hafiz Medical Center",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "L-80, Sector 32-E, Nasir Jump, Korangi Road KARACHI",
      "Contact": "0331-2404815,0345-6275030, 03112032531 ptcl: 35120541 adil",
      "lat": "24.823444",
      "lng": 67.0545764
    },
    {
      "Hospital Name": "Khalid Eye Clinic",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "4-F, 10/5, Minhaj Ghori Rd, Karachi",
      "Contact": "(021) 36602527",
      "lat": "24.8237642",
      "lng": 66.9495101
    },
    {
      "Hospital Name": "LIFE LINE HOSPITAL KARACHI",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "D-14, Block B, North Nazimabad",
      "Contact": "021- 36646588, 021- 36646733",
      "lat": "24.9289614",
      "lng": 67.0339963
    },
    {
      "Hospital Name": "Razia Medical Complex",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Road No 7. 1/2, Commercial Area, Cattle Colony, Landhi, Bin Qasim, Karachi. Pakistan",
      "Contact": "3312020307",
      "lat": "24.8363516",
      "lng": 67.261044
    },
    {
      "Hospital Name": "Medicenter General Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "78-L, Ghazali Rd, PECHS 2, Karachi, Sindh",
      "Contact": "(021) 34558309 (02134315651 CORPORATE ANWAR)",
      "lat": "24.8709161",
      "lng": 67.0504229
    },
    {
      "Hospital Name": "Park Lane Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Old Clifton, Shahra-e-Iran, Opp. British High Commission, Block 5, Clifton, Karachi.",
      "Contact": "(021) 111 222 911",
      "lat": "24.81671",
      "lng": 67.0292528
    },
    {
      "Hospital Name": "Darul Shifa (Khumeni) Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "25/6 Raju House St, Jaffer e Tayar Society F South Jafar e Tayyar, Karachi, Karachi City, Sindh",
      "Contact": "021-34405176, 34405177, 34408390, 34508390, Mobile : 0300-8250643",
      "lat": "24.8861695",
      "lng": 67.1928176
    },
    {
      "Hospital Name": "Bay View Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "A, 205 Saba Avenue, Zone A Phase 8 Defence Housing Authority, Karachi, Karachi City, Sindh 75500",
      "Contact": "(021) 35246237",
      "lat": "24.7797021",
      "lng": 67.0630255
    },
    {
      "Hospital Name": "ALTAMASH HOSPITAL",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "ST-9/A, Block 1, Clifton, KARACHI.",
      "Contact": "(0092- 21) 3587 2000 / (0092- 21) 3582 1955-7",
      "lat": "24.8153165",
      "lng": 67.0003486
    },
    {
      "Hospital Name": "Lady Dufferin Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Chand Bibi Road, adhumal oodharam quarter, Karachi",
      "Contact": "021-32732606",
      "lat": "24.8582662",
      "lng": 67.005971
    },
    {
      "Hospital Name": "RIMS Trauma Hospital (PECHS)",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "8/1 & 1/4, Block 6, PECHS, Near Nursery Flyover Karachi",
      "Contact": "021-34145151-53 Emai : info@rims.org.pk",
      "lat": "24.8570702",
      "lng": 67.0589756
    },
    {
      "Hospital Name": "RIMS Trauma Hospital (Al- Khaleej Tower)",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "10th floor Al-Khaleej Tower, near Medicare Clinic, Main shaheed-e-Millat Road, Bahadurabad, Karachi",
      "Contact": "021-34145151-53 Emai : info@rims.org.pk",
      "lat": "24.8583448",
      "lng": 66.9731401
    },
    {
      "Hospital Name": "Darul Sehat Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "St-19, KDA Scheme? Abul Asar Hafeez Jalandhari Rd, Block 15 Gulistan-e-Johar, Karachi,",
      "Contact": "021-111-300-999",
      "lat": "24.9143418",
      "lng": 67.1249783
    },
    {
      "Hospital Name": "PAK INTERNATIONAL HOSPITAL KARACHI",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "39-C, 22nd, East St, D.H.A. Phase 1 Sector A Defence Housing Authority, Karachi",
      "Contact": "021-35310671",
      "lat": "24.8359854",
      "lng": 67.0689355
    },
    {
      "Hospital Name": "Ayesha General Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "C-50 Phase 2? Side Rd, Gulshan e Hadeed Phase 3 Karachi",
      "Contact": "021-34716608",
      "lat": "24.8664982",
      "lng": 67.3556012
    },
    {
      "Hospital Name": "National Institute of Cardiovascular Diseases - Lyari",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Liyari general hiospital, rangiwara, karachi",
      "Contact": "(021) 99201271",
      "lat": "24.8710757",
      "lng": 66.984671
    },
    {
      "Hospital Name": "Ahmed Medical Complex & Maternity Home",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Plot No C-17, Pakistan Ave, Block 13, Federal B Area, Karachi",
      "Contact": "(021) 36361011",
      "lat": "24.9348588",
      "lng": 67.0027681
    },
    {
      "Hospital Name": "Bilal Medical Center",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Plot # 61 / 1 Star gate near airport, shahrah-e-faisal, Karachi",
      "Contact": "0301-8220247 Raza Ali",
      "lat": "24.8866473",
      "lng": 67.1573084
    },
    {
      "Hospital Name": "Cancer Foundation Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Block 9 Gulshan-e-Iqbal, Karachi, Karachi City, Sindh",
      "Contact": "0345-2138703 Ifraheem",
      "lat": "24.9126314",
      "lng": 7.0907921
    },
    {
      "Hospital Name": "Khyber Hospital - Landhi",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "H # 1, C/A, Gulshan-e-Askari Main Road, Qazzafi Town Rd, Qaddafi Town Landhi Town, Karachi",
      "Contact": "0345-0147746 Dr. Farooq",
      "lat": "24.8474442",
      "lng": 67.2251666
    },
    {
      "Hospital Name": "Life Care Hospital & Maternity home",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Jamal e Ibrahim Housing Society, Karachi",
      "Contact": "0321-8931715 Irfan",
      "lat": "24.9143418",
      "lng": 67.1249783
    },
    {
      "Hospital Name": "Al-Khyber General Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "1st floor, 226/E, A.I line Dawood pota road, saddar, karachi.",
      "Contact": "0333-3058000 Tariq Shah",
      "lat": "24.9657157",
      "lng": 66.8877435
    },
    {
      "Hospital Name": "Hussaini Labs",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Plot # ST-02, Block T, Qalandaria Chowk, Opposite Talib Chaman Park, North Nazimabad Karachi",
      "Contact": "0300-2254112 Asad",
      "lat": "24.9593196",
      "lng": 67.0471903
    },
    {
      "Hospital Name": "Dr. Mehdi A. Manji Lab",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "105-L? Sharah-e-Quaideen Service Rd, Block 2 PECHS, Karachi, Karachi City, Sindh",
      "Contact": "021-34555952 Shahnaz",
      "lat": "24.8678504",
      "lng": 67.0501115
    },
    {
      "Hospital Name": "Karachi Laboratory Diagnostic Centre",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Delhi Mercantile Medical Complex Building Siraj-ud-Duala Road, Off Shaheed-e-Millat Rd, Darul Aman Society PECHS, Karachi",
      "Contact": "0336-4444817 Muhammad Ali Abbas",
      "lat": "24.8761246",
      "lng": 67.0647629
    },
    {
      "Hospital Name": "Rahila Lab",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "65 B/1, Mohammad Ali Housing Socity near Kaybees. Opp. Bilal Masjid, Karachi,",
      "Contact": "0335-2559598 Dr. Sohaib",
      "lat": "24.8904159,",
      "lng": 67.0412749
    },
    {
      "Hospital Name": "Sindlab",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Z-74 Tariq Rd, Delhi Mercantile Society Delhi CHS PECHS, Karachi",
      "Contact": "0321-2425370 Nauman",
      "lat": "24.8777819",
      "lng": 67.0614582
    },
    {
      "Hospital Name": "JP CT Scan & Diagnostic Center",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Kiyani Shaheed Rd, Saddar Karachi,",
      "Contact": "0321-3368043 Asim",
      "lat": "24.867201",
      "lng": 6.9893852
    },
    {
      "Hospital Name": "Real Time PCR Diagnostics",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Ground Floor, G-30,Auqaf Plaza, Dabgari Garden Peshawar",
      "Contact": "0332-6762736 Fatima Anjum",
      "lat": "34.0036772",
      "lng": 71.5577172
    },
    {
      "Hospital Name": "Etmad Medical Centre",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Giga Masjid? Plot no.501, Poonawaala homes near ismail? Jamshed Rd, Shikarpur Colony, Karachi,",
      "Contact": "Muhammad Irfan",
      "lat": "24.8832969",
      "lng": 67.0466546
    },
    {
      "Hospital Name": "Mominabad General Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Azad Nagar Sector 3 Sindh Industrial Trading Estate, Karachi",
      "Contact": "0346-3283893 Dr. Imran",
      "lat": "24.9265625",
      "lng": 66.9947488
    },
    {
      "Hospital Name": "National General Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "National Hwy 5, Radio Pakistan Colony Bin Qasim Town, Karachi.",
      "Contact": "0300-8929709 Shahid",
      "lat": "24.8548594",
      "lng": 67.223488
    },
    {
      "Hospital Name": "Al Rayyaz Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "St-24, Sector 11/B, North Karachi, Sector 11 B North Karachi Twp, Karachi",
      "Contact": "021-36907697",
      "lat": "24.975158",
      "lng": 67.0624093
    },
    {
      "Hospital Name": "Mumtaz Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Notth Nazimabad",
      "Contact": "0344-2878810 Mohsin",
      "lat": "24.9160804",
      "lng": 67.0824906
    },
    {
      "Hospital Name": "Remedial Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Notth Nazimabad",
      "Contact": "0346-3252110 Imran",
      "lat": "24.9456901",
      "lng": 67.0471784
    },
    {
      "Hospital Name": "AL-HAMD MEDICAL CENTRE",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "MC-747,Green Town,Opp Farooqi Masjid Shah Faisal Colony, Karachi",
      "Contact": "0334-7302210",
      "lat": "24.8796961",
      "lng": 67.0886516
    },
    {
      "Hospital Name": "FAIZ REHMAN HOSPITAL",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "METROVILLE # 1 SITE PLOT #E.28 TO E.31 KARACHI",
      "Contact": "0314-2224456 Hidayat Ur Rehman",
      "lat": "24.9041721",
      "lng": 66.9752057
    },
    {
      "Hospital Name": "Dr Fasih's Ent And General Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "A/28 Malir Kalaboard (Opp Saudabad Police Station)",
      "Contact": "34503754",
      "lat": "24.88441",
      "lng": 67.1822541
    },
    {
      "Hospital Name": "Hamdard Hospital Naimat Begum Mother & Child Care Unit",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Block 3 Nazimabad, Karachi, Karachi City, Sindh 74600",
      "Contact": "(021) 36614191",
      "lat": "24.9127333",
      "lng": 67.026257
    },
    {
      "Hospital Name": "Al-Wasay Medical Centre",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "FL-1, B2, Block-6, Gulshan-E-Iqbal",
      "Contact": "0335-1328619",
      "lat": "24.9250625",
      "lng": 67.0909988
    },
    {
      "Hospital Name": "Bahria International Hospital - Karachi",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Gadap Town, Karachi, Karachi City, Sindh",
      "Contact": "M. Yasir 0333-5995335",
      "lat": "25.0136814",
      "lng": 67.3086522
    },
    {
      "Hospital Name": "NIBD Hospital - Gulshan",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "ST 2/A Block 17 Gulshan-e-Iqbal KDA Scheme 24 Karachi",
      "Contact": "0331-2530670 Najam-Ul-Hassan zaidi",
      "lat": "24.8976787",
      "lng": 67.0763741
    },
    {
      "Hospital Name": "NIBD Hospital - PECHS",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Pl. No. Special D-3, Block 6? Block 6 PECHS, Karachi,",
      "Contact": "(021) 34321339",
      "lat": "24.8561045",
      "lng": 67.064813
    },
    {
      "Hospital Name": "NIBD Lab",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Karachi",
      "Contact": "(021) 111 120 140",
      "lat": "24.8560861",
      "lng": 66.9969614
    },
    {
      "Hospital Name": "Dr. Essa Laboratory",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "B-122 Blue building? Block H North Nazimabad Town, Karachi",
      "Contact": "(021) 111 786 986",
      "lat": "24.9409584",
      "lng": 67.0472474
    },
    {
      "Hospital Name": "Pro Lab Diagnostic Centre",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Unit # 1, 165-N Building, Khayaban-e-Muslim, D.H.A Phase 6 Muslim Commercial Area Karachi",
      "Contact": "0302-2835590 Adnan Wahedi",
      "lat": "24.819387",
      "lng": 67.0196943
    },
    {
      "Hospital Name": "Sehatmand Zindagi",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "1 Tabish Dehlavi Road, Block 3 Nazimabad, Karachi, Karachi City, Sindh",
      "Contact": "(021) 36617404",
      "lat": "24.9189506",
      "lng": 67.0286292
    },
    {
      "Hospital Name": "Imam Zain-ul-Abedien Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "C/ 42-43, Rizvia Society Karachi, Karachi City, Sindh",
      "Contact": "021-36608991-3 Junaid",
      "lat": "24.8998208",
      "lng": 67.026864
    },
    {
      "Hospital Name": "C Lab Diagnostics - Karachi",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "C-29 & C-30, Prince complex, Frere Town, Adj with PSO Head Office, Karachi",
      "Contact": "021-99332099",
      "lat": "24.863936",
      "lng": 67.0115462
    },
    {
      "Hospital Name": "AL KHAIR TEACHING HOSPITAL",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Main super highway, Gulzar-e-Hijri Gulzar E Hijri Scheme 33, Karachi",
      "Contact": "0300-2304897",
      "lat": "25.0231807",
      "lng": 66.8184905
    },
    {
      "Hospital Name": "Dr. Yawar Zaman (DYZ) Eye Hospital - Karachi",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "187-B, P.E.C.H.S Block 2 Block 2 PECHS, Karachi, Karachi City, Sindh",
      "Contact": "(021) 34531810",
      "lat": "24.8609116",
      "lng": 67.0572009
    },
    {
      "Hospital Name": "Children's Hospital - Karachi",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Street 2/2? Block 5 Gulshan-e-Iqbal, Karachi",
      "Contact": "(021) 34999181",
      "lat": "24.9085914",
      "lng": 67.0288532
    },
    {
      "Hospital Name": "Shaukat Khanum Diagnostic Centre Karachi",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Plot DDCH1, 1st Street Phase VII? Extension Tariq Commercial Area Phase 7 Ext Defence Housing Authority, Karachi,",
      "Contact": "(021) 35318513",
      "lat": "24.8220748",
      "lng": 67.0624005
    },
    {
      "Hospital Name": "Al Hamza General Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "C-12, Bock D Block D North Nazimabad Town, Karachi, karachi",
      "Contact": "(021) 36686464",
      "lat": "24.9448118",
      "lng": 67.0420573
    },
    {
      "Hospital Name": "Anklesaria Eye Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Madina Rd, Parsi Colony Parsi Colony Saddar, Karachi, Karachi",
      "Contact": "(021) 32250387",
      "lat": "24.8727072",
      "lng": 67.0289273
    },
    {
      "Hospital Name": "Anklesaria Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Aga Khan III Rd (Garden Road), near Makki Masjid? Preedy Quarters Karachi, Karachi",
      "Contact": "(021) 32720371",
      "lat": "24.8669985",
      "lng": 67.0192762
    },
    {
      "Hospital Name": "RMA General Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "18-C, 2nd & 3rd Floor, 21st East Street, Phase-I, DHA, Karachi-75500.",
      "Contact": "021-35396811",
      "lat": "24.836082",
      "lng": 67.0687799
    },
    {
      "Hospital Name": "FM General Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Usmania Society Nazimabad A Rd, Noorani Mohalla Karachi, Karachi City, Sindh",
      "Contact": "3219244572",
      "lat": "24.9273924",
      "lng": 66.9515852
    },
    {
      "Hospital Name": "Pak Onco Care (Cancer Treatment Center)",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "B-253? Block 5 Gulshan-e-Iqbal, Karachi",
      "Contact": "(021) 34980057",
      "lat": "24.9235151",
      "lng": 67.0886016
    },
    {
      "Hospital Name": "Ismat Eye Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "B-376 Karachi City, Block 6 Gulshan-e-Iqbal, Karachi.",
      "Contact": "3422413976",
      "lat": "24.9262787",
      "lng": 67.0936444
    },
    {
      "Hospital Name": "Dr Aisha's Health Vision Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Bahadurabad Center, 159 Block-3, Sirajudaula Road? Sheikh Abdul Tawab Rd, Khokan CHS, Karachi",
      "Contact": "(021) 34924424",
      "lat": "24.8840091",
      "lng": 67.0706603
    },
    {
      "Hospital Name": "Rajput Bandhani Medical Centre",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "2/ 210 - A big Plot, Shahfaisal Colony, Block 2, Karachi.",
      "Contact": "021-34591122-33",
      "lat": "24.878329",
      "lng": 67.1152291
    },
    {
      "Hospital Name": "Sambrose Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "D-177 Sharah-e-Humayun, Federal B Area Block 4 Gulberg Town, Karachi",
      "Contact": "(021) 36806624",
      "lat": "24.9205763",
      "lng": 67.0493751
    },
    {
      "Hospital Name": "Asif Eye Hospital (Bahadurabad)",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "apartment 390, M6, Mezzanine floor, Westland, 3 Alamgir Rd, Bahadurabad Karachi",
      "Contact": "(021) 34937064",
      "lat": "24.8804955",
      "lng": 67.0682036
    },
    {
      "Hospital Name": "Rahim Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Water Pump, Block 13, F.B Area, Karachi.",
      "Contact": "0333-1268764 Ashfaq Ahmed",
      "lat": "24.9389335",
      "lng": 67.0715805
    },
    {
      "Hospital Name": "Infinity Eye Care Centre",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Suite # 05, Ground Floor, Clifton Garden # 1, Block # 3, Clifton, Karachi.",
      "Contact": "021-35865220-21 / 0344-2593661",
      "lat": "24.8140002",
      "lng": 67.0212259
    },
    {
      "Hospital Name": "Mehmooda Begum Medical Centre",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Main korangi road, Korangi # 1, Gulzar Colony Sector 32B, Korangi - Karachi",
      "Contact": "0312-1110960 I 0332-2900090 - Waqas Javed",
      "lat": "24.8219534",
      "lng": 67.1295262
    },
    {
      "Hospital Name": "Care & Cure Hospital",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "M-13, Mezzanine Floor, APWA Complex, Near Makki Masjid, Garden Road, Karachi",
      "Contact": "0315-256 2112 / 3 2253383-4",
      "lat": "24.8683791",
      "lng": 67.0209529
    },
    {
      "Hospital Name": "Murshid Hospital & Health Care Centre",
      "City": "Karachi",
      "Province": "Sindh",
      "Address": "Hub River Road, Mujahidabad, Karachi",
      "Contact": "0300-212-9180, +92 346 8215214 | +92 346 8215213 | +92 346 8223320 | +92 302 8282400",
      "lat": "24.9266814",
      "lng": 66.94341
    },
     {
      "Hospital Name": "ittefaq hospital",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Near H-Block Model Town",
      "Contact": "0300-4153635, (042) 111 770 000",
      "lat": 31.4756386,
      "lng": 74.3355403
    },
    {
      "Hospital Name": "Fatima Memorial Hospital",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Shadman Road.",
      "Contact": "042-7561234 (042) 111 555 600",
      "lat": 31.5357895,
      "lng": 74.325824
    },
    {
      "Hospital Name": "Shalamar Hospital",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Shalimar Link Road, Moghalpura, Lahore.",
      "Contact": "042-111 205 205 (03334910278) Nadeem, 03004899105 (TAIRIQ)",
      "lat": 31.5751184,
      "lng": 74.3454591
    },
    {
      "Hospital Name": "Family Hospital Lahore",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "4 - Mozang Road.",
      "Contact": "723-3915-6",
      "lat": 31.5610499,
      "lng": 74.3104867
    },
    {
      "Hospital Name": "National Hospital and Medical Centre NHMC",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "L' Block, LCCHS",
      "Contact": "111-17-18-19",
      "lat": 31.4846293,
      "lng": 74.3951636
    },
    {
      "Hospital Name": "Fauji Foundation Hospital",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Bedian Road, Lahore Cantt.",
      "Contact": "042-99220291, (0322-4341622) ALLAH DITTA",
      "lat": 31.4986195,
      "lng": 74.378237
    },
    {
      "Hospital Name": "Saira Memorial Hospital",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Civic Centre, Model Town Extension.",
      "Contact": "0425162546-9; 5168033",
      "lat": 31.4811192,
      "lng": 74.3099677
    },
    {
      "Hospital Name": "Iqra Medical Complex",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "5-A, Johar Town, Garden Town.",
      "Contact": "042-35173800",
      "lat": 31.4685237,
      "lng": 74.3025511
    },
    {
      "Hospital Name": "Cavillary Hospital",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "44-45 Cavalry Ground.",
      "Contact": "042-6652116",
      "lat": 31.5012655,
      "lng": 74.3670741
    },
    {
      "Hospital Name": "Farooq Hospital Lahore",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "2,3 ASIF BLOCK; MAIN BOULEVARD ALLAMA IQBAL TOWN LAHORE",
      "Contact": "042-37845521, 04237813471",
      "lat": 31.4651231,
      "lng": 74.233569
    },
    {
      "Hospital Name": "FAROOQ HOSPITAL (WEST WOOD BRANCH)",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "MAIN CANAL ROAD OPP. METRO CASH & CARY, THOKAR NIAZ BAIG",
      "Contact": "042-37498550 - 042-37808852, (042) 37498596, 0345-4052053 SHOIB,",
      "lat": 31.4652236,
      "lng": 74.2336956
    },
    {
      "Hospital Name": "Omar Hospital & Cardiac Centre",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Jail Road Lahore",
      "Contact": "Mobile:- 0322-4797731 UAN:- 111-111-127",
      "lat": 31.5370069,
      "lng": 74.3336607
    },
    {
      "Hospital Name": "Hamza Hospital",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "21 Shama Road, Rasool Park, Ichhra,",
      "Contact": "042-37501597",
      "lat": 31.5407259,
      "lng": 74.3117217
    },
    {
      "Hospital Name": "Khair un Nisa Hospital Foundation",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "12-Sunflower Society, J1 Block, Johar Town,",
      "Contact": "042-5166017",
      "lat": 31.4742559,
      "lng": 74.3042242
    },
    {
      "Hospital Name": "Wazir Hospital",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Butt Chowk, C-1, Township, Lahore",
      "Contact": "042-35123184. 042-35155746",
      "lat": 31.4425507,
      "lng": 74.2939217
    },
    {
      "Hospital Name": "FARAN HOSPITAL",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "69/C, Abdali Road, Islampura, Lahore, Pakistan.",
      "Contact": "0331-4872564 (042) 37153824",
      "lat": 31.5665864,
      "lng": 74.2887199
    },
    {
      "Hospital Name": "Hafeez Eye Centre",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Sunflower Housing Society",
      "Contact": "3004040730",
      "lat": 31.5667181,
      "lng": 74.2208684
    },
    {
      "Hospital Name": "Niazi Hospital",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Johar Town, Third Roundabout.",
      "Contact": "3336784360",
      "lat": 31.4694641,
      "lng": 74.2977264
    },
    {
      "Hospital Name": "Horizon Hospital",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "403,404,436 Block D II M.A Johar Town Lahore",
      "Contact": "042-35401620-28",
      "lat": 31.4587886,
      "lng": 74.2854024
    },
    {
      "Hospital Name": "Al Razi Family hospital / Al Razi Health Care",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "2c2 MM Alam Road Opp Pizza hut Lahore",
      "Contact": "0313-4769902",
      "lat": 31.5125606,
      "lng": 74.3484426
    },
    {
      "Hospital Name": "Aadil Hospital",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Mezanine Floor, Main Bolevard, Defence (L.C.C.H.S) LAHORE",
      "Contact": "042-36667272-4",
      "lat": 31.4887761,
      "lng": 74.3782891
    },
    {
      "Hospital Name": "Akram Medical Complex",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "2-B, Main Gulberg Ayesha Siddiqua Road.",
      "Contact": "042-3571082 042-35710400",
      "lat": 31.5333005,
      "lng": 74.3418598
    },
    {
      "Hospital Name": "Burewala Hospital",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Lahore Rd, Burewala, Vehari, Punjab",
      "Contact": "3244176987",
      "lat": 30.1628193,
      "lng": 72.6839587
    },
    {
      "Hospital Name": "Masood Hospital Lahore",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "99, Garden Block Garden Town, Lahore, Punjab 54600",
      "Contact": "(042) 111 627 663 (0321-4336278 Sultan Altmash Manager Corporate Affairs)",
      "lat": 31.5053072,
      "lng": 74.3281936
    },
    {
      "Hospital Name": "Ihsan Mumtaz hospital, lahore",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "71-E, Johar Town, Shaukat Ali Road",
      "Contact": "042-3520210 , 0321-4348221",
      "lat": 31.4748178,
      "lng": 74.2993599
    },
    {
      "Hospital Name": "Raza Medical Complex",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "OPP. Punjab Institute of cardiology, near KFC, Jail road, Lahore",
      "Contact": "042-35970770, 0301-8484643, 0321-4366873 Shahzad Ahmed",
      "lat": 31.537582,
      "lng": 74.334512
    },
    {
      "Hospital Name": "Life Hospital Lahore",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Maraka Canal Road Near (Main Gate, Aa Block Sector D Bahria Town, Lahore",
      "Contact": "042-35453891",
      "lat": 31.380276,
      "lng": 74.1651465
    },
    {
      "Hospital Name": "Zia Hospital - Lahore",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Main Ferozepur Road, Ideal Garden Opp, Awan Market, Lahore",
      "Contact": "042-35922701",
      "lat": 31.4355221,
      "lng": 74.3534226
    },
    {
      "Hospital Name": "Sherazi Medical Center",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Near Sitara- e- hilal sheel petrol pump, new toll plaza, G.T road, Rana town, shahdara, Lahore",
      "Contact": "0301-0521100 / 0301-0531100",
      "lat": 31.7835953,
      "lng": 74.0051578
    },
    {
      "Hospital Name": "Qasam Sindhu Hospital",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "7 Abbaseen Ave, Block H1 Block H 1 Wapda Town Phase 1 WAPDA Town, Lahore,",
      "Contact": "0300-0775537 Shahbaz",
      "lat": 31.4324115,
      "lng": 74.2610289
    },
    {
      "Hospital Name": "Chughtai Labs",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "7 Jail Road, Main Gulberg, Lahore, Punjab",
      "Contact": "311145678",
      "lat": 31.5350384,
      "lng": 74.3412947
    },
    {
      "Hospital Name": "Ghurki Trust Teaching Hospital - Lahore",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "GT RD-Burki Rd Link? Band Road? Jallo More Lahore,",
      "Contact": "042-111-348-348",
      "lat": 31.5895708,
      "lng": 74.4999987
    },
    {
      "Hospital Name": "Mid City Hospital - Lahore",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Opposite Kinaird College? 3-A? Jail Road, side road, Shadman II Shadman 2 Shadman, Lahore",
      "Contact": "042-111 643 289",
      "lat": 31.5375145,
      "lng": 74.3351779
    },
    {
      "Hospital Name": "Amanat Eye Hospital - Lahore",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "78-E/1 Main Boulevard, Block E1 Block E 1 Gulberg III, Lahore",
      "Contact": "0335-5011162 shirin",
      "lat": 31.5172292,
      "lng": 74.3417651
    },
    {
      "Hospital Name": "OMC HOSPITAL",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Shadman 2, Shadman, Lahore, Punjab, Service Rd, Lahore",
      "Contact": "(042) 35407172",
      "lat": 31.5365942,
      "lng": 74.3366695
    },
    {
      "Hospital Name": "Faisal Hospital Faisal Town Lahore",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "23 B, Faysal Town, Abul-ul-Asphani Road? Lahore",
      "Contact": "(042) 35167251",
      "lat": 31.48598,
      "lng": 74.3028964
    },
    {
      "Hospital Name": "Chaudhry Muhammad Akram Teaching & Research Hospital",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "17 KM Off Main Raiwind Road(Araiyaan Pind) Lahore",
      "Contact": "042-38104222",
      "lat": 31.3331992,
      "lng": 74.234711
    },
    {
      "Hospital Name": "Al-Khidmat Teaching Mansoorah hospital",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Near Multan Chungi Multan Road., Lahore",
      "Contact": "0333-4111620, 0423-5419510, 0322-4031152",
      "lat": 31.4921525,
      "lng": 74.2623523
    },
    {
      "Hospital Name": "Heart & Medical Centre",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "1-A/1 Guldasht Town, Zarar Shaheed road, Lahore Cantt.",
      "Contact": "042-36639112-113 / Brg. Dr. Shakeel Afridi 0334-6639111",
      "lat": 31.5446522,
      "lng": 74.4174385
    },
    {
      "Hospital Name": "Bahria International Hospital - Mohlanwal Lahore",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Takbeer Block Sector B Bahria Town, Lahore, Punjab",
      "Contact": "(042) 111 296 297",
      "lat": 31.3877996,
      "lng": 74.1855228
    },
    {
      "Hospital Name": "Bahria International Hospital - Ochard Lahore",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Takbeer Block Sector B Bahria Town, Lahore, Punjab",
      "Contact": "(042) 111 296 297",
      "lat": 31.3879316,
      "lng": 74.1176713
    },
    {
      "Hospital Name": "NIBD Hospital - Lahore",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Lahore",
      "Contact": "3001116423",
      "lat": 31.4588584,
      "lng": 74.2853313
    },
    {
      "Hospital Name": "Kishwer Sultana Hospital Lahore",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Township Block 2 Twp Sector C 2 Lahore",
      "Contact": "0316-4985080 Dr. Zeeshan",
      "lat": 31.44282,
      "lng": 74.2924477
    },
    {
      "Hospital Name": "Mafazatul Hayat Hospital - Lahore",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "3.5Km, Chungi Amar Sidhu, Defence Road (Chandrai) Lahore, Race Course Town, Lahore",
      "Contact": "0306-0977584 Haseeb",
      "lat": 31.4251754,
      "lng": 74.3350004
    },
    {
      "Hospital Name": "Sarwat Anwar Medical Complex - Lahore",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "New Garden Town Lahore",
      "Contact": "042-35869265",
      "lat": 31.496892,
      "lng": 74.2849976
    },
    {
      "Hospital Name": "Surayya Azeem Hospital - Lahore",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Chowk Chauburji? Bahawalpur Rd, Mozang Chungi, Lahore, Punjab",
      "Contact": "(042) 37120003",
      "lat": 31.5538213,
      "lng": 74.3036552
    },
    {
      "Hospital Name": "Shaukat Khanum Diagnostic Centre Jail Road Lahore",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "G? 89 Jail Rd, G.O.R. - I, Lahore, Punjab",
      "Contact": "(042) 35905000",
      "lat": 31.5382759,
      "lng": 74.3352871
    },
    {
      "Hospital Name": "Shaukat Khanum Diagnostic Centre Liberty Lahore",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "E, UCH-Liberty 2, 1 Main Blvd Gulberg, Commercial Area Gulberg III, Lahore, Punjab",
      "Contact": "(042) 35905000",
      "lat": 31.5383488,
      "lng": 74.3024563
    },
    {
      "Hospital Name": "Shaukat Khanum Memorial Cancer Hospital & Research Center Lahore",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "7A?? Khayaban-e-Firdousi, Block R3 Block R 3 M.A Johar Town, Lahore, Punjab",
      "Contact": "(042) 35905000",
      "lat": 31.4484851,
      "lng": 74.2015732
    },
    {
      "Hospital Name": "SHAMIM HOSPITAL (LAHORE)",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Faisalabad Road, Near Z.F.Z kot Abdul Malik main Shekhupura Road, Punjab.",
      "Contact": "0332-8497925 Abid",
      "lat": 31.4794683,
      "lng": 74.2938964
    },
    {
      "Hospital Name": "Iffat Anwar Medical Complex",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Awaisia Housing Society Park # 16, College Road Near Ghazi Chowk, Lahore",
      "Contact": "0321-4455811, 0345-8477000, 042-35183595-96 - Shahzad Anwar",
      "lat": 31.4379007,
      "lng": 74.2863685
    },
    {
      "Hospital Name": "Ever Care Hospital",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "D - I Commercial, Nespak Employees Cooperative Housing Society, Lahore - Punjab",
      "Contact": "042-111-227-333 (Extension 1239)",
      "lat": 31.437608,
      "lng": 74.2793699
    },
    {
      "Hospital Name": "Ali Children Surgical Hospital & Maternity Home",
      "City": "Lahore",
      "Province": "Punjab",
      "Address": "Manga Mandi Chowk, Multan Road, Lahore",
      "Contact": "Cell: 0336-4700457 / Office: 042-35383800",
      "lat": 31.3001027,
      "lng": 73.7901094
    },
     {
      "Hospital Name": "Qari Hospital",
      "City": "Okara",
      "Province": "Punjab",
      "Address": "18-Nawab Colony, Girls College Road, Okara,",
      "Contact": "442514660 (044) 2523154",
      "lat": 30.8145711,
      "lng": 73.445293
    },
    {
      "Hospital Name": "Al Madina Hospital",
      "City": "Okara",
      "Province": "Punjab",
      "Address": "Canal Rd Husnain Arcade Renala Khurd Idt Okara",
      "Contact": "044-2635200-03006979966",
      "lat": 30.8147043,
      "lng": 73.3774414
    },
    {
      "Hospital Name": "City Hospital Okara",
      "City": "Okara",
      "Province": "Punjab",
      "Address": "Khan,Colony Stop, Faisalabad Road, Okara",
      "Contact": "044-2510073, 0317-0775577, 0315-7179267",
      "lat": 30.8277162,
      "lng": 73.4162137
    },
    {
      "Hospital Name": "ABDULLAH GENRAL HOSPITAL OKARA",
      "City": "Okara",
      "Province": "Punjab",
      "Address": "G.T ROAD OKARA (PAKISTAN)",
      "Contact": "0345-7535374 Alam Sher",
      "lat": 30.8209509,
      "lng": 73.4777032
    },
    {
      "Hospital Name": "Mumtaz Maternity & Surgical Hospital - Okara",
      "City": "Okara",
      "Province": "Punjab",
      "Address": "people Colony, G.T Road, Okara",
      "Contact": "0300-9632417 Dr. Jameel",
      "lat": 30.8097381,
      "lng": 73.4447854
    },
     {
      "Hospital Name": "Ali Medicare Hospital - Mirpurkhas",
      "City": "Mirpur Khas",
      "Province": "Sindh",
      "Address": "Umerkot Road, Adam Town, M?rpur Kh?s,",
      "Contact": "(0233) 823047",
      "lat": 29.5529567,
      "lng": 66.5375278
    },
    {
      "Hospital Name": "National Institute of Cardiovascular Diseases - Nawabashah",
      "City": "Nawabshah",
      "Province": "Sindh",
      "Address": "peoples medical college hsopital, shaheed benazirabad civil hospital road, nawabshah",
      "Contact": "(021) 99201271",
      "lat": 26.258107,
      "lng": 68.3691248
    },
    {
      "Hospital Name": "Sukkur Hospital",
      "City": "Sukkur",
      "Province": "Sindh",
      "Address": "Opp Eid Gah Near DIG Office, Sukkur.",
      "Contact": "071-5615922",
      "lat": 27.7087376,
      "lng": 68.8290044
    },
    {
      "Hospital Name": "National Institute of Cardiovascular Diseases - Sukkur",
      "City": "Sukkur",
      "Province": "Sindh",
      "Address": "Indus Hwy, Sukkur, Dadu District, Sindh 65200",
      "Contact": "(021) 99201271",
      "lat": 27.7026572,
      "lng": 68.8321048
    },
    {
      "Hospital Name": "Sukkur CT & Infertility Centre",
      "City": "Sukkur",
      "Province": "Sindh",
      "Address": "MVV3+3XX, Barrage Colony, Sukkur, Sindh",
      "Contact": "(071) 5805306",
      "lat": 27.6927394,
      "lng": 68.8527892
    },
    {
      "Hospital Name": "Suleman Roshan Medical College Hospital - Tando Adam",
      "City": "Tando Adam",
      "Province": "Sindh",
      "Address": "Tando Adam Bypass? Tando ?dam, Sanghar, Sindh",
      "Contact": "023-5572272",
      "lat": 25.7456053,
      "lng": 68.6319761
    },
    {
      "Hospital Name": "National Institute of Cardiovascular Diseases - Tando M. Khan",
      "City": "Tando Muhammad Khan",
      "Province": "Sindh",
      "Address": "Shaheed Mohtarma benazirabad Bhuttp cardiac care hospital, hyderabad badin road, Tando Muhammad Khan",
      "Contact": "(021) 99201271",
      "lat": 25.136555,
      "lng": 68.5318866
    },
    {
      "Hospital Name": "Owais Hospital",
      "City": "Kashmore",
      "Province": "Sindh",
      "Address": "Bear Haq Bahoo sultan publick school, Soomra Mohalla, Kashmore.",
      "Contact": "0333-7362583 Khair Muhammad Somro",
      "lat": 28.4332663,
      "lng": 69.5746332
    },
    {
      "Hospital Name": "National Institute of Cardiovascular Diseases - Khairpur",
      "City": "Khairpur",
      "Province": "Sindh",
      "Address": "banarascolony, khairpur, sindh",
      "Contact": "(021) 99201271",
      "lat": 28.4404399,
      "lng": 69.5984308
    },
    {
      "Hospital Name": "National Institute of Cardiovascular Diseases - Larkana",
      "City": "Larkana",
      "Province": "Sindh",
      "Address": "Department of Cardiology, Civil Hospital VIP Road, 77150, VIP Rd, Larkana, Sindh",
      "Contact": "(021) 99201271",
      "lat": 27.5548804,
      "lng": 67.9282372
    },
    {
      "Hospital Name": "City Hospital - Larkana",
      "City": "Larkana",
      "Province": "Sindh",
      "Address": "Shah Nawaz Bhutto Rd, Larkana, Sindh",
      "Contact": "0333-7199447 Riaz",
      "lat": 27.5598687,
      "lng": 68.1953718
    },
    {
      "Hospital Name": "National Institute of Cardiovascular Diseases - Mithi",
      "City": "Mithi",
      "Province": "Sindh",
      "Address": "near DHQ Hospital, Mithi Sindh Mithi PK 69230? Islamkot Road, Mithi, Tharparkar, Sindh",
      "Contact": "(021) 99201271",
      "lat": 27.5548851,
      "lng": 68.2061999
    },
    {
      "Hospital Name": "National Institute of Cardiovascular Diseases - Sehwan",
      "City": "Sehwan",
      "Province": "Sindh",
      "Address": "Sayed Abdullah Shah Institute of Medical Sciences, Sehw?n, Jamshoro, Sindh 76140",
      "Contact": "(021) 99201271",
      "lat": 26.2762095,
      "lng": 66.8156933
    },
    {
      "Hospital Name": "Mahmood Hospital - Sanghar",
      "City": "Sanghar",
      "Province": "Sindh",
      "Address": "Chotiarion Road, Dr Mehmood Colony, Sanghar, Sindh",
      "Contact": "0301-3817385",
      "lat": 26.0446872,
      "lng": 68.9399907
    },
    {
      "Hospital Name": "Ali Clinic & Hospital",
      "City": "Bahawalnagar",
      "Province": "Punjab",
      "Address": "Jail Road Bahwalnagar",
      "Contact": "063-2274890",
      "lat": 30.0009328,
      "lng": 72.1411282
    },
    {
      "Hospital Name": "Husnain Surgical Hospital",
      "City": "Bahawalnagar",
      "Province": "Punjab",
      "Address": "G- Block Chishtian, Bahawalnagar District",
      "Contact": "063-2503412, 0302-7800131 Dr. Javaid Aslam",
      "lat": 29.7965946,
      "lng": 72.8622729
    },
    {
      "Hospital Name": "Allied Surgical Hospital",
      "City": "Dera Ghazi Khan",
      "Province": "Punjab",
      "Address": "Street # 4, Balakh Sarwar City DG KHAN",
      "Contact": "0300-7763679 Dr Muzaffar Farooq, 064-2466225",
      "lat": 30.047159,
      "lng": 70.6360402
    },
    {
      "Hospital Name": "Al-shifa Surgical Hospital DG khan",
      "City": "Dera Ghazi Khan",
      "Province": "Punjab",
      "Address": "Jampur Rd, Fareed Abad D G Khan, Dera Ghazi Khan, Punjab",
      "Contact": "0330 6479584, 0331-7343145 inayat ullah",
      "lat": 30.0483553,
      "lng": 70.6365463
    },
    {
      "Hospital Name": "Gondal Medical Complex",
      "City": "Gujranwala",
      "Province": "Punjab",
      "Address": "Hospital Road, Gujranwala",
      "Contact": "055-3258403 / 3251056",
      "lat": 32.1668268,
      "lng": 74.1896083
    },
    {
      "Hospital Name": "salamat hospital and health care",
      "City": "Gujranwala",
      "Province": "Punjab",
      "Address": "126 Circular Rd, Block D? Satellite Town? Gujranwala",
      "Contact": "055-3258497-3734666-03018740741",
      "lat": 32.1635271,
      "lng": 74.2068338
    },
    {
      "Hospital Name": "Cheema Heart & General Hospital - Gujranwala",
      "City": "Gujranwala",
      "Province": "Punjab",
      "Address": "Mian ziaul haq road, near lords hotel, district courts, Gujranwala, Pakistan",
      "Contact": "055-3255959, 0302-8646444 Email: cheemaheartcomplex@gmail.com",
      "lat": 32.1681174,
      "lng": 74.1927457
    },
    {
      "Hospital Name": "Chaudhry Hospital Gujranwala",
      "City": "Gujranwala",
      "Province": "Punjab",
      "Address": "Ghulam Dastagir Khan Rd, Gujranwala",
      "Contact": "Ph: 055-3735211 (055) 3253901 Cell: 0303-700-4487",
      "lat": 32.168003,
      "lng": 74.2011411
    },
    {
      "Hospital Name": "Central Hospital - Gujranwala",
      "City": "Gujranwala",
      "Province": "Punjab",
      "Address": "Grand Trunk Rd, Jinnah Colony, Gujranwala, Punjab",
      "Contact": " (055) 4277072",
      "lat": 32.1322365,
      "lng": 74.1916894
    },
    {
      "Hospital Name": "Winner Health Care Gujranwala",
      "City": "Gujranwala",
      "Province": "Punjab",
      "Address": "A-153 B Block, A-1 Block Block 1 Phase A Wapda Town, Gujranwala,",
      "Contact": "(055) 4800025",
      "lat": 32.0940005,
      "lng": 74.1855413
    },
    {
      "Hospital Name": "Mian Sharif Hospital - Gujranwala",
      "City": "Gujranwala",
      "Province": "Punjab",
      "Address": "20, Ali Park Fareed Town Kashmir Road Near Dera Chaudhry Jamshed? Fareed Town, Gujranwala",
      "Contact": "(055) 4552119",
      "lat": 32.1532744,
      "lng": 74.2125467
    },
    {
      "Hospital Name": "Medcare Hospital - Gujranwala",
      "City": "Gujranwala",
      "Province": "Punjab",
      "Address": "Gill Rd, Civil Lines, Gujranwala,",
      "Contact": "(055) 3732032",
      "lat": 32.1772033,
      "lng": 74.187594
    },
    {
      "Hospital Name": "Niazi Memorial Hospital",
      "City": "Gujranwala",
      "Province": "Punjab",
      "Address": "D.C Road, Gujranwala",
      "Contact": "055-3856686",
      "lat": 26.2762095,
      "lng": 66.8156933
    },
    {
      "Hospital Name": "Gujrat hospital",
      "City": "Gujrat",
      "Province": "Punjab",
      "Address": "Bhimber Road Gujrat",
      "Contact": "053-3605173-76",
      "lat": 32.5958936,
      "lng": 74.0774577
    },
    {
      "Hospital Name": "City Hospital Gujrat",
      "City": "Gujrat",
      "Province": "Punjab",
      "Address": "Jail Road? Jail Road Area, Gujrat, Punjab",
      "Contact": "(053) 3608186",
      "lat": 32.5909031,
      "lng": 74.0723121
    },
    {
      "Hospital Name": "Ikram Hospital - Gujrat",
      "City": "Gujrat",
      "Province": "Punjab",
      "Address": "Bhimber Rd, Gujrat,",
      "Contact": "053-3605377 Bilal",
      "lat": 32.5956233,
      "lng": 74.0770984
    },
    {
      "Hospital Name": "Shazia Maternity Hospital",
      "City": "Gujrat",
      "Province": "Punjab",
      "Address": "Gulberg Colony, Gujrat",
      "Contact": "0336-6876823 Muhammad Ejaz",
      "lat": 32.5956953,
      "lng": 74.0442676
    },
    {
      "Hospital Name": "Latif Hospital - Harappa",
      "City": "Harappa",
      "Province": "Punjab",
      "Address": "Harappa, Sahiwal District",
      "Contact": "0345-4504106",
      "lat": 30.5956833,
      "lng": 72.9100766
    },
    {
      "Hospital Name": "Christian Hospital (Nancy Full Wood Hospital)",
      "City": "Sahiwal",
      "Province": "Punjab",
      "Address": "Mission Chowk, High Street, Sahiwal",
      "Contact": "92-40-4224858",
      "lat": 30.6704077,
      "lng": 73.1034501
    },
    {
      "Hospital Name": "Medicare Hospital - Attock",
      "City": "Attock",
      "Province": "Punjab",
      "Address": "Kamra Road? Attock",
      "Contact": "0343-5017811",
      "lat": 33.796666,
      "lng": 72.3418315
    },
    {
      "Hospital Name": "Dhillon Surgical Complex - Burewala",
      "City": "Burewala",
      "Province": "Punjab",
      "Address": "Multan Road, Gulshan-e-Rehman Burewala",
      "Contact": "0300-6999130",
      "lat": 30.1586902,
      "lng": 72.6656093
    },
    {
      "Hospital Name": "Capital Health Hospital Chakwal",
      "City": "Chakwal",
      "Province": "Punjab",
      "Address": "Bhoun Rd, near Islamia Chowk, Chakwal, Punjab",
      "Contact": "(0543) 551122",
      "lat": 32.9306008,
      "lng": 72.8521737
    },
    {
      "Hospital Name": "Afzal Hospital - Jehlum",
      "City": "Jehlum",
      "Province": "Punjab",
      "Address": "Old G T Rd, Machine Mohalla No.3 Machine Mohalla 3, Jhelum",
      "Contact": "(0544) 624646",
      "lat": 32.9416486,
      "lng": 73.7175795
    },
    {
      "Hospital Name": "Qadir Ali Hospital - Layyah",
      "City": "Layyah",
      "Province": "Punjab",
      "Address": "Kutchehry Road, near General Bus Stand, Layyah,",
      "Contact": "(0606) 410096",
      "lat": 30.9711739,
      "lng": 70.9605619
    },
    {
      "Hospital Name": "Abid Hospital",
      "City": "Mian Channu",
      "Province": "Punjab",
      "Address": "Near Chungi Tulamba Road, Mian Channu",
      "Contact": "0334-6232113",
      "lat": 31.6961043,
      "lng": 70.4752857
    },
    {
      "Hospital Name": "Madina Hospital & Maternity Home",
      "City": "Pattoki",
      "Province": "Punjab",
      "Address": "Ghala Mandi Road Pattoki Distt. Kasur",
      "Contact": "0300-0509175",
      "lat": 31.666187,
      "lng": 70.4751662
    },
    {
      "Hospital Name": "AL-REHMAT HOSPITAL, RAHIM-YAR-KHAN",
      "City": "Rahim Yar Khan",
      "Province": "Punjab",
      "Address": "Near chowk Pathanistan Shahbaz pur Road Rahim Yar Khan",
      "Contact": "0301-7633423-0302-7800131",
      "lat": 28.4225071,
      "lng": 70.2914562
    },
    {
      "Hospital Name": "Lala Medical complex",
      "City": "Rahim Yar Khan",
      "Province": "Punjab",
      "Address": "Airport road, Rahim Yar Khan",
      "Contact": "068-5878300 (contact person: dr javid)",
      "lat": 28.4130439,
      "lng": 70.2981964
    },
    {
      "Hospital Name": "NOUMAN MEDICAL CENTRE (LIFECARE MEDICAL CENTRE)",
      "City": "Rahim Yar Khan",
      "Province": "Punjab",
      "Address": "K-72/A, khawaja banglows, Abbasia Town, Near darbar baba Dilbar Shah, rahim yar khan, pakistan",
      "Contact": "0302-7800131, 0331-7800131 lifecarehospital56@gmail.com",
      "lat": 28.4130672,
      "lng": 70.2916303
    },
    {
      "Hospital Name": "Al-Saeed Medical Complex",
      "City": "Rahim Yar Khan",
      "Province": "Punjab",
      "Address": "Khanpur Rd? Rahim Yar Khan, Punjab",
      "Contact": "(068) 5888555",
      "lat": 28.4335018,
      "lng": 70.3401783
    },
    {
      "Hospital Name": "Darul Barkat Hospital Sheikhupura",
      "City": "Sheikhupura",
      "Province": "Punjab",
      "Address": "Younus Shaheed Road, Near St. Merry School, Civil Line, Sheikupura",
      "Contact": "056-3787445,3787446, 3793946",
      "lat": 31.7107696,
      "lng": 73.9716325
    },
    {
      "Hospital Name": "Siddique Hospital Sheikhupura",
      "City": "Sheikhupura",
      "Province": "Punjab",
      "Address": "Near policy station city B division, sargodha road, Sheikhupura",
      "Contact": "056-3781008, 056-3780018, Mob : 0331-8400517",
      "lat": 31.7133995,
      "lng": 73.9718223
    },
    {
      "Hospital Name": "Shakir Surgical Hospital and Fatima Medical Center",
      "City": "Sheikhupura",
      "Province": "Punjab",
      "Address": "Lahore Rd, Mohalla Hanjran Wala, Sheikhupura, Punjab",
      "Contact": "056-3547500 / 0300-8844744 Saleem",
      "lat": 31.7121193,
      "lng": 73.991626
    },
    {
      "Hospital Name": "Khadija poly clinic",
      "City": "Sheikhupura",
      "Province": "Punjab",
      "Address": "College Road, Sheikhupura, Punjab",
      "Contact": "0333-4405649",
      "lat": 31.7120323,
      "lng": 73.9664895
    },
    {
      "Hospital Name": "Luqman Medical Centre",
      "City": "Sheikhupura",
      "Province": "Punjab",
      "Address": "Civil Lines, Sheikhupura, Punjab",
      "Contact": "(056) 3610800",
      "lat": 31.7137866,
      "lng": 73.9707555
    },
    {
      "Hospital Name": "Al Syed Hospital",
      "City": "Taxila",
      "Province": "Punjab",
      "Address": "Ahata Farooqia Road, Taxila",
      "Contact": "051-4560148",
      "lat": 33.8014064,
      "lng": 72.8176815
    },
    {
      "Hospital Name": "Al-Abbas Hospital - Taxilla",
      "City": "Taxila",
      "Province": "Punjab",
      "Address": "GT Rd, Taxila, Punjab",
      "Contact": "0321-5050484 Muhammad Ashfaq",
      "lat": 33.7385659,
      "lng": 72.7926522
    },
    {
      "Hospital Name": "Al Elaaj Hospital",
      "City": "Wah Cantt",
      "Province": "Punjab",
      "Address": "House #60/A-1, Lane #2, Lala Rukh, Wah Cantt.",
      "Contact": "051-4531904",
      "lat": 33.7886554,
      "lng": 72.7212895
    },
    {
      "Hospital Name": "Umer Hospital",
      "City": "Wah Cantt",
      "Province": "Punjab",
      "Address": "B-193, Minar Road Lalarukh, Wah Cantt.",
      "Contact": "51.5145116",
      "lat": 33.7850448,
      "lng": 72.5833886
    },
    {
      "Hospital Name": "City Hospital - Wah Cantt",
      "City": "Wah Cantt",
      "Province": "Punjab",
      "Address": "Makki Street, Wah, Rawalpindi",
      "Contact": "051-4539242 Afshan Bilal Kiyani",
      "lat": 33.7882373,
      "lng": 72.723702
    },
    {
      "Hospital Name": "Kamran Surgical & Gynae Hospital - Hafizabad",
      "City": "Hafizabad",
      "Province": "Punjab",
      "Address": "Gujranwala Rd, Qadirabad, Hafizabad, Punjab",
      "Contact": "0300-6526014 Dr. Kamran",
      "lat": 32.073384,
      "lng": 73.9718223
    },
    {
      "Hospital Name": "Obaid Noor Hospital",
      "City": "Mianwali",
      "Province": "Punjab",
      "Address": "Gulberg Mianwali, City District, Mianwali, Pakistan",
      "Contact": "0459-235325",
      "lat": 32.5753307,
      "lng": 71.542109
    },
    {
      "Hospital Name": "Munir Hospital",
      "City": "Sargodha",
      "Province": "Punjab",
      "Address": "700-A, Satellite Town, Sargodha, Pakistan",
      "Contact": "048-3210035-36-37",
      "lat": 32.0710842,
      "lng": 72.6982019
    },
    {
      "Hospital Name": "Niazi Medical Complex - Sargodha",
      "City": "Sargodha",
      "Province": "Punjab",
      "Address": "Railway Road? Sargodha, Punjab",
      "Contact": "(048) 3727146",
      "lat": 32.0803139,
      "lng": 72.6753362
    },
    {
      "Hospital Name": "Khalida Memorial Hospital - Sialkot",
      "City": "Sialkot",
      "Province": "Punjab",
      "Address": "Overhead Bridge? Cantt Road, near Jinnah Stadium, Jinnah Park Colony No. 2 Jinnah Park Colony No 2, Sialkot, Punjab",
      "Contact": "0332-9999218 Umar Farooq",
      "lat": 32.5033543,
      "lng": 74.5498431
    },
    {
      "Hospital Name": "Islamia Hospital - Chiniot",
      "City": "Chiniot",
      "Province": "Punjab",
      "Address": "P.O Box # 35400,Noghaza Road, Chiniot",
      "Contact": "047- 63 34 189 / 0300- 66 44 566",
      "lat": 31.7193104,
      "lng": 72.976175
    },
    {
      "Hospital Name": "National Hospital",
      "City": "Vehari",
      "Province": "Punjab",
      "Address": "28QW+W4H, Cotton Colony Vehari, Punjab",
      "Contact": "0333-6261361 Dr. Nasir Hanif",
      "lat": 30.0398294,
      "lng": 72.3431734
    },
    {
      "Hospital Name": "Umar Hospital",
      "City": "Nankana Sahib",
      "Province": "Punjab",
      "Address": "Near Qaba Chowk, 241 Z, Housing Colony, Nankana Sahib",
      "Contact": "(056) 3540550",
      "lat": 31.4351605,
      "lng": 73.0778669
    },
    {
      "Hospital Name": "CHRISTIAN HOSPITAL",
      "City": "Quetta",
      "Province": "Balochistan",
      "Address": "Mission Road, Quetta, Balochistan, Pakistan",
      "Contact": "9281-2842697",
      "lat": 30.6704031,
      "lng": 73.0706199
    },
    {
      "Hospital Name": "Valley Medical Complex",
      "City": "Abbottabad",
      "Province": "KPK",
      "Address": "Main Mansehra Road,Mirpur, Abbottabad",
      "Contact": "0992-385419-20",
      "lat": 34.2110491,
      "lng": 73.2400104
    },
    {
      "Hospital Name": "Jinnah International Hospital Abbotabad",
      "City": "Abbottabad",
      "Province": "KPK",
      "Address": "Murree Rd, Nawan Shehr Town, Abbottabad, Khyber Pakhtunkhwa",
      "Contact": "(0992) 391443",
      "lat": 34.1604498,
      "lng": 73.2608183
    },
    {
      "Hospital Name": "Sami Medical Center Abbottabad",
      "City": "Abbottabad",
      "Province": "KPK",
      "Address": "Main Mansehra Road Opp Brother C.N.G Kalapul Abbottabad",
      "Contact": "0992-406677",
      "lat": 34.2118035,
      "lng": 73.2398448
    },
    {
      "Hospital Name": "Chinar Hospital - Abbottabad",
      "City": "Abbottabad",
      "Province": "KPK",
      "Address": "Musa Zai Colony, Abbottabad, Khyber Pakhtunkhwa",
      "Contact": "0992-381511 Fahim",
      "lat": 34.2150371,
      "lng": 73.2414025
    },
    {
      "Hospital Name": "Rehmania Hospital & Abida Maternity Home",
      "City": "Dera Ismail Khan",
      "Province": "KPK",
      "Address": "Near Town Hall D.I. Khan",
      "Contact": "0300-9094001",
      "lat": 34.14621,
      "lng": 73.2134052
    },
    {
      "Hospital Name": "Mehar General Hospital - Haripur",
      "City": "Haripur",
      "Province": "KPK",
      "Address": "GPO Road Dak-Khana Rd, Mohalla Qadeem, Har?pur, Haripur",
      "Contact": "0315-1501152 Shakeel",
      "lat": 33.9960129,
      "lng": 72.9297417
    },
    {
      "Hospital Name": "Shifa Hospital - Swat",
      "City": "Swat",
      "Province": "KPK",
      "Address": "Opp Central Hospital, saidu sharif, Swat.",
      "Contact": "(0946) 712482",
      "lat": 34.7543338,
      "lng": 72.3528315
    },
    {
      "Hospital Name": "Sehhat Foundation Hospital - Gilgit",
      "City": "Gilgit",
      "Province": "Gilgit",
      "Address": "Karakoram Hwy, Danyor, Gilgit-Baltistan",
      "Contact": "0300-8253357",
      "lat": 35.9125845,
      "lng": 74.3828809
    },
    {
      "Hospital Name": "Noor Memorial Hospital - Muzaffarabad",
      "City": "Muzaffarabad",
      "Province": "Azad Kashmir",
      "Address": "Mian Mohammad Rd, New Mirpur City, Azad Jammu and Kashmir",
      "Contact": "0311-8384786 Muhammad Akram",
      "lat": 33.5167657,
      "lng": 73.8985483
    },
    {
      "Hospital Name": "Zafar Hospital & Maternity Home",
      "City": "Jhelum",
      "Province": "Punjab",
      "Address": "GT Road Dina, District Jhelum.",
      "Contact": "0544-631992",
      "lat": 30.669018,
      "lng": 72.96851
    },
    {
      "Hospital Name": "Siddique Medical Complex",
      "City": "Bhakkar",
      "Province": "Punjab",
      "Address": "Khansar Road, Lodhra Chowk, Bhakkar - Punjab",
      "Contact": "0453-510185",
      "lat": 31.6275336,
      "lng": 70.5177713
    },
    {
      "Hospital Name": "Allama Iqbal Hospital",
      "City": "Haripur",
      "Province": "KPK",
      "Address": "Shakar Shah Road, Mohallah Ferozpura, Harbor Haripur, Khyber Pakhunthwa",
      "Contact": "0995-627555",
      "lat": 31.6128769,
      "lng": 68.5541949
    },
    {
      "Hospital Name": "Aga Khan Medical Centre- Booni",
      "City": "Chitral",
      "Province": "KPK",
      "Address": "77FH+9X2, Booni, Chitral, Khyber Pakhtunkhwa",
      "Contact": "0943-470116",
      "lat": 36.2733911,
      "lng": 67.7974549
    },
    {
      "Hospital Name": "Aga Khan health services- thq Garamchashma",
      "City": "Chitral",
      "Province": "KPK",
      "Address": "W97F+RW2, KKH, Danyor, Gilgit-Baltistan",
      "Contact": "0943-412633",
      "lat": 37.221334,
      "lng": 70.4562503
    },
    {
      "Hospital Name": "Aga Khan Extended Family Health Centre",
      "City": "Gilgit",
      "Province": "KPK",
      "Address": "W953+9JG, Jutial, Gilgit, Gilgit-Baltistan, Jutial, Gilgit, Gilgit-Baltistan",
      "Contact": "058114 (81149)",
      "lat": 36.1007695,
      "lng": 73.9308044
    },
    {
      "Hospital Name": "Aga Khan Extended Family Health Centre",
      "City": "Gilgit",
      "Province": "KPK",
      "Address": "Gilgit Baltistan",
      "Contact": "058114 (81149)",
      "lat": 36.1945213,
      "lng": 73.8569491
    },
    {
      "Hospital Name": "Aga Khan Medical Centre",
      "City": "Gilgit",
      "Province": "KPK",
      "Address": "W9M8+MXC, Nomal - Gilgit Rd, Chilmish Das, Gilgit-Baltistan",
      "Contact": "058114 (81149)",
      "lat": 35.9342006,
      "lng": 74.3651941
    },
    {
      "Hospital Name": "Aga Khan Medical Centre, Gilgit",
      "City": "Gilgit",
      "Province": "KPK",
      "Address": "Gilgit Baltistan",
      "Contact": "058114 (81149)",
      "lat": 35.7884325,
      "lng": 73.6913224
    },
    {
      "Hospital Name": "Aga Khan Health Services, Pakistan",
      "City": "Gilgit",
      "Province": "KPK",
      "Address": "Gilgit Baltistan",
      "Contact": "058114 (81149)",
      "lat": 35.7884325,
      "lng": 73.6913224
    },
    {
      "Hospital Name": "The Aga Khan Family Health Centre",
      "City": "Sargodha",
      "Province": "Punjab",
      "Address": "Main Satellite Town Road 40/A Ground Floor, Near Al-Abbas Hospital, Satellite Town, Sargodha, Punjab 40100",
      "Contact": "(048) 3217642",
      "lat": 32.0822637,
      "lng": 72.6845236
    },
    {
      "Hospital Name": "The Aga Khan Family Health Centre",
      "City": "Pind Dadan Khan",
      "Province": "Punjab",
      "Address": "Kareem Abad Mohalla Subhanian, Pind Dadan Khan, Jhelum, Punjab, Pakistan",
      "Contact": "111-911-911",
      "lat": 32.0719712,
      "lng": 73.6781681
    },
    {
      "Hospital Name": "The Aga Khan Family Health Centre",
      "City": "Quetta",
      "Province": "Balochistan",
      "Address": "BANGALOW NO. 21? Zarghun Road, Baldia Town? Quetta, Balochistan",
      "Contact": "(081) 2869005",
      "lat": 30.1848571,
      "lng": 66.9975495
    },
    {
      "Hospital Name": "General Hospital",
      "City": "Sialkot",
      "Province": "Punjab",
      "Address": "Airport Road, Gohadpur, Sialkot",
      "Contact": "0344-6421789",
      "lat": 32.5201702,
      "lng": 74.5019116
    },
    {
      "Hospital Name": "Khalid Family Hospital",
      "City": "Zafarwal",
      "Province": "Punjab",
      "Address": "Khalid Family Hospital, Zafarwal, Narowal, Punjab",
      "Contact": "3.03E+20",
      "lat": 32.3369177,
      "lng": 74.9011245
    },
    {
      "Hospital Name": "Ahmad Medical & Surgical Hospital",
      "City": "Kot Addo",
      "Province": "Punjab",
      "Address": "Near North Railway Crossing, Adjacent to OTCL Petrol Pump, GT Road, District Muzaffarabad",
      "Contact": "0662242500, 0332-6005222",
      "lat": 32.0461067,
      "lng": 70.7875598
    },
    {
      "Hospital Name": "Aziz Hospital, Wah Cantt",
      "City": "Wah Cantt",
      "Province": "Punjab",
      "Address": "Main Khayaban-e-Sirsyed, Wah Cantt",
      "Contact": "051-4910222, 0312-3366638",
      "lat": 33.8273928,
      "lng": 72.7320805
    },
     {
      "Hospital Name": "Rehman medical complex Multan",
      "City": "Multan",
      "Province": "Punjab",
      "Address": "Nishtar Road? Multan",
      "Contact": "0315 4507400 (061) 4500488",
      "lat": 30.2035221,
      "lng": 71.4444165
    },
    {
      "Hospital Name": "Faisal Hospital Multan",
      "City": "Multan",
      "Province": "Punjab",
      "Address": "Khanewal Road, Multan",
      "Contact": "061-4586416, 061-4546079",
      "lat": 30.2107168,
      "lng": 71.4823252
    },
    {
      "Hospital Name": "Haleema Hospital Complex",
      "City": "Multan",
      "Province": "Punjab",
      "Address": "Nishtar Road, Multan",
      "Contact": "061-4519037, 4572882, 4781184",
      "lat": 30.2028878,
      "lng": 71.4466911
    },
    {
      "Hospital Name": "Razia Saeed Hospital",
      "City": "Multan",
      "Province": "Punjab",
      "Address": "17/E, Officers Colony, Eid Ghah Chowk, Khanewal Road, Multan",
      "Contact": "061-6221260/61",
      "lat": 30.2114427,
      "lng": 71.475251
    },
    {
      "Hospital Name": "CHENAB HOSPITAL MULTAN",
      "City": "Multan",
      "Province": "Punjab",
      "Address": "Near Chonghi# 1 Surij Mianey Road- Multan",
      "Contact": "061-4518871-4",
      "lat": 30.1927796,
      "lng": 71.4439663
    },
    {
      "Hospital Name": "Medicare Hospital Multan",
      "City": "Multan",
      "Province": "Punjab",
      "Address": "62-A, Abdali Road, Multan",
      "Contact": "061-4581702 / 3",
      "lat": 30.1927796,
      "lng": 71.4439663
    },
    {
      "Hospital Name": "Fatima Medical Center",
      "City": "Multan",
      "Province": "Punjab",
      "Address": "Chowk Rashidabad Multan,Punjab,",
      "Contact": "(061) 6224433",
      "lat": 30.2102145,
      "lng": 71.4862819
    },
    {
      "Hospital Name": "Bakhtawar Amin Memorial Hospital Multan",
      "City": "Multan",
      "Province": "Punjab",
      "Address": "Multan Bypass, Multan, Punjab",
      "Contact": "0304 8792904 0301-7479570 0321-7328722",
      "lat": 30.2463888,
      "lng": 71.4411165
    },
    {
      "Hospital Name": "Care Family Hospital - Multan",
      "City": "Multan",
      "Province": "Punjab",
      "Address": "Main Rd, Gulshan-E-Iqbal Qasim Bela, Multan",
      "Contact": "061-6350752 Jawad",
      "lat": 30.1888246,
      "lng": 71.4051069
    },
    {
      "Hospital Name": "Chaudhry PervaizElahi Institute Of Cardiology Multan",
      "City": "Multan",
      "Province": "Punjab",
      "Address": "Abdali Road , Chowk Dera Ada 60,000",
      "Contact": "061-9201045",
      "lat": 30.1920126,
      "lng": 71.4482703
    },
     {
      "Hospital Name": "SHIFA INTERNATIONAL HOSPITAL Faisalabad",
      "City": "Faisalabad",
      "Province": "Punjab",
      "Address": "11 KM JARANWALA ROAD, FAISALABAD",
      "Contact": "041-8740955 -041-8740045",
      "lat": 31.3948275,
      "lng": 73.1705795
    },
    {
      "Hospital Name": "Rehman Hospital And Maternity Home",
      "City": "Faisalabad",
      "Province": "Punjab",
      "Address": "Faisalabad-Sheikhupura Rd, Gatwala, Khurrianwala, Punjab",
      "Contact": "041 31.4911213, 73.2556491",
      "lat": 31.4911259,
      "lng": 73.2534604
    },
    {
      "Hospital Name": "Saahil Hospital",
      "City": "Faisalabad",
      "Province": "Punjab",
      "Address": "Saahil Hospital Building 1-Sheikhupura Road Adjacent to Hotel East Inn, Faisalabad.",
      "Contact": "041-8782042",
      "lat": 31.446307,
      "lng": 73.0873413
    },
    {
      "Hospital Name": "Prime Care Hospital",
      "City": "Faisalabad",
      "Province": "Punjab",
      "Address": "Near Lasania Restaurant Opp Liberty Market, Madina Town, Faisalabad",
      "Contact": "-2446887.717",
      "lat": 31.4222252,
      "lng": 73.1173059
    },
    {
      "Hospital Name": "Hilal e Ahmer Hospital",
      "City": "Faisalabad",
      "Province": "Punjab",
      "Address": "Opp Lady bagh , Universoty Rd Faisalabad",
      "Contact": "041-9201475-76----0300-6622347",
      "lat": 31.4208231,
      "lng": 73.0829429
    },
    {
      "Hospital Name": "Yasin Memorial Hospital - Faisalabad",
      "City": "Faisalabad",
      "Province": "Punjab",
      "Address": "Gulberg Thana Rd, Jinnah Colony, Faisalabad,",
      "Contact": "0311-7887881 Amjad",
      "lat": 31.4226257,
      "lng": 73.0626645
    },
    {
      "Hospital Name": "Mian Mohammad Trust Hospital",
      "City": "Faisalabad",
      "Province": "Punjab",
      "Address": "Sargodha Road, Faisalabad.",
      "Contact": "041-2408916 0332648812 03485984942 kashif",
      "lat": 31.4258231,
      "lng": 73.0900619
    },
    {
      "Hospital Name": "Faisalabad International Hospital",
      "City": "Faisalabad",
      "Province": "Punjab",
      "Address": "204, Gulshan E Iqbal, Gutwala, Faisalabad, Punjab",
      "Contact": "(041) 8524601",
      "lat": 31.4587417,
      "lng": 73.1712479
    },
     {
      "Hospital Name": "Rawal Institute of Health Sciences",
      "City": "Islamabad",
      "Province": "Punjab",
      "Address": "Main Lehtrar Road, Khanapul? near Ali Trust College? Khanna Islamabad",
      "Contact": "(051) 2617381",
      "lat": 33.6324641,
      "lng": 73.12014
    },
    {
      "Hospital Name": "Alfalah Hospital - Islamabad",
      "City": "Islamabad",
      "Province": "Punjab",
      "Address": "???         sangjani? Islamabad,",
      "Contact": "0321-5066269",
      "lat": 33.6759494,
      "lng": 72.8511253
    },
    {
      "Hospital Name": "Life Care International Hospital - Islamabad",
      "City": "Islamabad",
      "Province": "Punjab",
      "Address": "G-10 Markaz G 10 Markaz G-10, Islamabad",
      "Contact": "0321-8014008 Tahir Nadeem",
      "lat": 33.6766919,
      "lng": 73.0131238
    },
    {
      "Hospital Name": "Excel Labs",
      "City": "Islamabad",
      "Province": "Punjab",
      "Address": "110 Fazal0ul-Haq Road, Blue area, Islamabad",
      "Contact": "0309-2222434 Kamal Afridi",
      "lat": 33.7105031,
      "lng": 73.0566323
    },
    {
      "Hospital Name": "Amanat Eye Hospital - Islamabad",
      "City": "Islamabad",
      "Province": "Punjab",
      "Address": "Auqaf Building, Maqbool Market, Street 61 & 62,Sector F-7/4, Islamabad",
      "Contact": "0311-4334038 / 0309-7772940 Mis Shirin Ali",
      "lat": 33.7222401,
      "lng": 73.0617466
    },
    {
      "Hospital Name": "Zobia Hospital - Islamabad",
      "City": "Islamabad",
      "Province": "Punjab",
      "Address": "Street 30, G-9/1 G 9/1 G-9, Islamabad",
      "Contact": "051-2261128 Haris",
      "lat": 33.677947,
      "lng": 73.0280262
    },
    {
      "Hospital Name": "Capital Diagnostic Centre (Pvt) Ltd.",
      "City": "Islamabad",
      "Province": "Punjab",
      "Address": "Media Foundation Plaza, G-8 Markaz Islamabad",
      "Contact": "0333-5999072 Shafique",
      "lat": 33.6951222,
      "lng": 73.0490417
    },
    {
      "Hospital Name": "AL-QASIM HOSPITAL",
      "City": "Islamabad",
      "Province": "Punjab",
      "Address": "Main Road Bhara Kahu, Islamabad",
      "Contact": "051-8441533",
      "lat": 33.7418311,
      "lng": 73.1807063
    },
    {
      "Hospital Name": "Reliance Hospital - Islamabad",
      "City": "Islamabad",
      "Province": "Punjab",
      "Address": "132 Civic Center- Phase 4, Bahria Town Near KFC? Civic Center Bahria Town, Islamabad, Punjab",
      "Contact": "(051) 5732855",
      "lat": 33.5501559,
      "lng": 73.1235074
    },
    {
      "Hospital Name": "Shaukat Khanum Diagnostic Centre Islamabad",
      "City": "Islamabad",
      "Province": "Punjab",
      "Address": "106 � West Fazal-e-Haq Road, Blue Area, Islamabad",
      "Contact": "92512348276",
      "lat": 33.7098946,
      "lng": 73.0557316
    },
    {
      "Hospital Name": "Nayab Lab & Diagnostic Centre",
      "City": "Islamabad",
      "Province": "Punjab",
      "Address": "6-Pak Pavilion Plaza, 65-E, Fazal-e-Haq Road, G 7/2 Blue Area, Islamabad",
      "Contact": "(051) 2348375",
      "lat": 33.7114432,
      "lng": 73.0588553
    },
    {
      "Hospital Name": "HBS General Hospital",
      "City": "Islamabad",
      "Province": "Islamabad",
      "Address": "Lehtrar Road, Nai Abadi, Ali Pur, Islamabad",
      "Contact": "051-2621043-44",
      "lat": 33.6447365,
      "lng": 73.1701942
    },
    {
      "Hospital Name": "Quaid e Azam International Hospital",
      "City": "Islamabad",
      "Province": "Islamabad",
      "Address": "Main Peshawar Road, Near Gola Morr, H-13 - Islamabad, Rawalpindi",
      "Contact": "Cell: +92 336 5102904",
      "lat": 33.6246546,
      "lng": 72.9708722
    },
    {
      "Hospital Name": "Northwest General Hospital & Research Center",
      "City": "Peshawar",
      "Province": "KPK",
      "Address": "5/B-2, Phase V, Hayatabad,Peshawar, K.P.K,Pakistan",
      "Contact": "+92-91-5838 000",
      "lat": 33.995176,
      "lng": 71.4359214
    },
    {
    "Hospital Name": "Maryum Memorial Hospital (Rawalpindi)",
    "City": "Rawalpindi",
    "Province": "Punjab",
    "Address": "Peshawar Road, Rawalpindi",
    "Contact": "051-5481170, 051-5464680-2",
    "lat": 33.6040245,
    "lng": 73.0223587
  },
  {
    "Hospital Name": "Maryum Memorial Hospital (Islamabad)",
    "City": "Rawalpindi",
    "Province": "Punjab",
    "Address": "Bahria Town Civic Center Phase 4, Rawalpindi",
    "Contact": "051-5733858 (contact person: ahmed ali)",
    "lat": 33.5494941,
    "lng": 73.0540071
  },
  {
    "Hospital Name": "Ahmad Medical Complex Rawalpindi",
    "City": "Rawalpindi",
    "Province": "Punjab",
    "Address": "70-C Satellite Town, Sadiqabad Road, Rawalpindi",
    "Contact": "4582231-39",
    "lat": 33.6080619,
    "lng": 73.0367547
  },
  {
    "Hospital Name": "Valley Clinic",
    "City": "Rawalpindi",
    "Province": "Punjab",
    "Address": "312-A,Peshawar Road, Rawalpindi.",
    "Contact": "051-860438-5470070",
    "lat": 33.6040577,
    "lng": 73.0220461
  },
  {
    "Hospital Name": "Al Suffah Hospital",
    "City": "Rawalpindi",
    "Province": "Punjab",
    "Address": "Block F, New Katarian satellite town, Rawalpindi.",
    "Contact": "051-8737487, 0313-5442304",
    "lat": 33.6420703,
    "lng": 73.055765
  },
  {
    "Hospital Name": "Bahria International Hospital",
    "City": "Rawalpindi",
    "Province": "Punjab",
    "Address": "Baharia town, phase 8, Rawal pindi",
    "Contact": "(051) 5179745",
    "lat": 33.4922106,
    "lng": 72.9602687
  },
  {
    "Hospital Name": "Bilal Hospital (Rawalpindi)",
    "City": "Rawalpindi",
    "Province": "Punjab",
    "Address": "38-A, Satellite Town, Rawalpindi",
    "Contact": "(051) 8094533 445-6471-76,,, Faisal Waseem 0300-5337980 EXTT:241",
    "lat": 33.6337173,
    "lng": 73.0767367
  },
  {
    "Hospital Name": "Khatoon Hospital",
    "City": "Rawalpindi",
    "Province": "Punjab",
    "Address": "Block F Police Foundation, Rawalpindi, Punjab",
    "Contact": "051-8430848",
    "lat": 33.5640629,
    "lng": 73.1251688
  },
  {
    "Hospital Name": "WESTRIDGE HOSPITAL & PAIN CENTRE (Pvt.) Limited",
    "City": "Rawalpindi",
    "Province": "Punjab",
    "Address": "Qayyum Plaza, Seham road, near FG liaquat degree college, Chuhr Harpal, Rawalpindi.",
    "Contact": "051-8735080 / 051-8739080",
    "lat": 33.6117794,
    "lng": 72.9991925
  },
  {
    "Hospital Name": "Amanat Eye Hospital - Rawalpindi",
    "City": "Rawalpindi",
    "Province": "Punjab",
    "Address": "10-D Mayo Road? Civil Lines, Rawalpindi",
    "Contact": "(051) 8439993",
    "lat": 33.5872562,
    "lng": 73.064175
  },
  {
    "Hospital Name": "Fauji Foundation Hospital - Rawalpindi",
    "City": "Rawalpindi",
    "Province": "Punjab",
    "Address": "Jhelum Road, Rawalpindi",
    "Contact": "0322-8555715",
    "lat": 33.5531733,
    "lng": 73.0934289
  },
  {
    "Hospital Name": "Medicare Hospital - Rawalpindi",
    "City": "Rawalpindi",
    "Province": "Punjab",
    "Address": "Saidpur Rd, Block F New Katarian Satellite Town, Rawalpindi",
    "Contact": "0314-5130189",
    "lat": 33.6423999,
    "lng": 73.0458461
  },
  {
    "Hospital Name": "Azeema Sheikh Hospital - Rawalpindi",
    "City": "Rawalpindi",
    "Province": "Punjab",
    "Address": "D Block, Block D Satellite Town, Rawalpindi, Punjab",
    "Contact": "0315-6897073",
    "lat": 33.642435,
    "lng": 73.0458461
  },
  {
    "Hospital Name": "CosmeSurge International Hospital - Rawalpindi.",
    "City": "Rawalpindi",
    "Province": "Punjab",
    "Address": "Main Said Pur Road Near KAli Tanki Opp. Agha Khan Lab Rawalpindi",
    "Contact": "051-4452729, 31",
    "lat": 33.6343037,
    "lng": 73.0603835
  },
  {
    "Hospital Name": "CityMed Hospital - Rawalpindi",
    "City": "Rawalpindi",
    "Province": "Punjab",
    "Address": "3rd Floor, Al-Shifa Tower, Main Jhelum Road, Rawalpindi",
    "Contact": 3333575733,
    "lat": 33.5588955,
    "lng": 73.0892151
  },
  {
    "Hospital Name": "TEMAR DIAGNOSTICS",
    "City": "Rawalpindi",
    "Province": "Punjab",
    "Address": "Building No 1,Near R.I.C? Rawal Road? Chaklala Cantt., Rawalpindi, Punjab 46000",
    "Contact": "(051) 8900001",
    "lat": 33.6263068,
    "lng": 73.0630562
  },
  {
    "Hospital Name": "Medway medical care",
    "City": "Rawalpindi",
    "Province": "Punjab",
    "Address": "J3V6+32H, Block F New Katarian Satellite Town, Rawalpindi, Punjab",
    "Contact": "051-8897878 Dr. Waqar 0333-1527009",
    "lat": 33.6426919,
    "lng": 73.0578738
  }
   
   ]
   ''';
  var labCity = '''
    [
  {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Al-Khalij Tower Main Shaheed-e-Millat",
   "Contact": "0346-7698961",
   "lat": 24.8807063,
   "lng": 67.0616774
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop No. 2 Rafiqui Shaheed Road, Karachi",
   "Contact": "0344-4453319",
   "lat": 24.8811817,
   "lng": 67.0596238
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop #04 Floor Lane 4 Sehar Commercial Phase 7 DHA",
   "Contact": "0345-4014984",
   "lat": 24.8137312,
   "lng": 67.0678928
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop#S-10 Ground Floor Usman garden Gulistan-e-Johar Block#13 Karachi.",
   "Contact": "0345-4014739-03321424250",
   "lat": 24.8755932,
   "lng": 67.0385341
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop#2 Toshi Square, Block 13-B Gulshan-e-Iqbal Opp: Masjid Baitul Mukkarram, Karachi",
   "Contact": "0345-4014738-03321424250",
   "lat": 24.9087866,
   "lng": 67.0818292
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop No.6 Darakhshan Society Malir Township Colony, Karachi",
   "Contact": "0344-4473129",
   "lat": 24.8822079,
   "lng": 67.1803567
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop No.2 Block-C (111-C 109) Nazimabad Karachi",
   "Contact": "0344-4476948, 0345-4014530",
   "lat": 24.9192485,
   "lng": 67.02734
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Abbas Square Ground Floor Plot# P12/B ST-7/B Block-7 F.B Area(Near Dhamthal Sweets) Karachi",
   "Contact": "0344-4476947",
   "lat": 24.9272889,
   "lng": 67.0626234
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop No. 2 Rafiqui Shaheed Road, Karachi",
   "Contact": "0344-4453319",
   "lat": 24.8657541,
   "lng": 67.0359753
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Road Bihar Muslim cop. Housing Society, Karachi",
   "Contact": "0340-8883249-50",
   "lat": 24.880944,
   "lng": 67.0606506
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Dr. Fazal Mobin Clinic, Firdous Shopping Mall, Gulshan-e-Iqbal, Block-2, Karachi",
   "Contact": "",
   "lat": 24.9266263,
   "lng": 67.0871661
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Plot#St-02 Block T Qalandria Chowk Opp Talib Chaman Park North Nazimabad Khi",
   "Contact": "02136630921, 0333-2569795",
   "lat": 24.9593148,
   "lng": 67.0471903
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Plot#141-2 Street 1/B Sector 3 Zaman Town Korangi 3 1/2 Karachi",
   "Contact": "0333-3998354",
   "lat": 24.826191,
   "lng": 67.1509313
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Plot No 423/20 Kalaboard Malir",
   "Contact": "0333-3998331",
   "lat": 24.8847622,
   "lng": 67.0764172
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Plot,125-2khargat Road Near Numaish Chowrangi Parsi Colony Khi",
   "Contact": "021-32238406-408, 0333-3998345",
   "lat": 24.8727307,
   "lng": 67.032154
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Near Farooq-e-azam Masjid Block K Mumtaz Hospital Khi",
   "Contact": "021-3662666, 0333-3998302",
   "lat": 24.9276569,
   "lng": 66.9323802
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Near Teen Talwar Chowrangi Clifton Karachi",
   "Contact": "0333-3998364",
   "lat": 24.872649,
   "lng": 66.9643019
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "C-55 Block 17 Near Bank Al Habib Samnabad Gulberg Chowrangi Karachi",
   "Contact": "0333-3998352",
   "lat": 24.9421392,
   "lng": 67.0691497
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "C/ 42-43,Rizvia Society, Karachi",
   "Contact": "0333-0130046",
   "lat": 24.8997603,
   "lng": 67.0265959
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Al-maseeha General Hospital Landhi No.5 Khi",
   "Contact": "0333-3998354",
   "lat": 24.8408391,
   "lng": 67.187579
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Jamat E Islah E Qoum Medical Center Landhi #6 Karachi",
   "Contact": "0333-3998366",
   "lat": 24.8367745,
   "lng": 67.1789086
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Area 36/1near Dakhana Chowrangi Shahrah E Pakistan Karachi",
   "Contact": "0333-3998339",
   "lat": 24.8847935,
   "lng": 67.0288421
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Sector#11 Mehmoodabad #6 Near Sitara Bakeri Khi",
   "Contact": "0333-3998359",
   "lat": 24.858695,
   "lng": 67.0826115
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Plot # C-6/7 Shop #3 Shabbir Eye Hospital Metrovile Site Karachi",
   "Contact": "0333-3998367",
   "lat": 24.9241225,
   "lng": 66.9842201
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Fatima Homes Soldier Bazar #2 Paknight Clinic Shah Nawaz Bhutto Road Karachi",
   "Contact": "0335-2559106 021-32220652",
   "lat": 24.8743045,
   "lng": 67.0291891
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "R-13 5c4 North Karachi Near Power House Chowrangi Near Quba Masjid U Bank Karachi",
   "Contact": "0333-0324985",
   "lat": 24.988224,
   "lng": 67.0301205
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Saudabad Malir",
   "Contact": "0333-3998315",
   "lat": 24.8935158,
   "lng": 67.1591838
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Opp Bagh E Halar Hospital Shoe Market Karachi",
   "Contact": "0333-1219964",
   "lat": 24.9201264,
   "lng": 67.0925527
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop No 12 Sania Arcade Main Soldier Bazar Signal No Khi",
   "Contact": "0331-2154441",
   "lat": 24.8769821,
   "lng": 67.0325883
 },
 {
   "Hospital Name": "Husaini Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Opp. Nishtar Park Ahmed Manzil,Soldier Bazar#2,Karachi",
   "Contact": "021-32222885, 0333-1219963",
   "lat": 24.8752776,
   "lng": 67.0303017
 },
 {
   "Hospital Name": "Rahila Research and Reference Lab (Pvt.) Ltd.",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "65 B/ 1, Muhammad Ali Cooperative Housing Society. Near Kaybee Resturant, Opposite Masjid-e-Bilal, Karachi",
   "Contact": "Kashif (0312-278382) | Ghulamullah (0321-9207136)",
   "lat": 24.8769233,
   "lng": 67.0848397
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Z-74, DMC Society, Tariq Road, Karachi",
   "Contact": "(021) 3455 7771- 3, 0320 455 7772",
   "lat": 24.8777868,
   "lng": 67.0614582
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "10th Street, Khayaban-e-Rahat, Phase 6, DHA, Karachi",
   "Contact": "(021) 3534 5199, 3534 5219, 3534 4202",
   "lat": 24.8042254,
   "lng": 67.0614375
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "21st E-Street, near NADRA Mega Center, Phase 1, DHA, Karachi",
   "Contact": "(021) 3538 5515",
   "lat": 24.836028,
   "lng": 67.0533965
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Defence Market, opp. Sunny Medico, Phase 2, DHA, Karachi",
   "Contact": "(021) 3539 0808",
   "lat": 24.8416496,
   "lng": 67.0552022
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Street 1, 100 Foot Road, Azam Town, Karachi",
   "Contact": "(021) 3589 7771, 3580 1741",
   "lat": 24.8430114,
   "lng": 67.0688261
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Hilal-e-Ahmer House, Teen Talwar, Clifton, Karachi",
   "Contact": "(021) 3537 3662",
   "lat": 24.8342963,
   "lng": 67.0308008
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Marine Arcade, opp. BBQ Tonite, Block 3, Clifton, Karachi",
   "Contact": "(021) 3537 6777",
   "lat": 24.816098,
   "lng": 67.0188159
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "10th Street, opp. Zamzama Park, Neelum Colony, Clifton, Karachi",
   "Contact": "(021) 3586 0131",
   "lat": 24.8140949,
   "lng": 67.0337943
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Nursery Flyover, Shahrah-e-Quaideen, Block 2, PECHS, Karachi",
   "Contact": "(021) 3455 5975, 3454 8207",
   "lat": 24.8613189,
   "lng": 67.0569953
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Near Chanesar Halt, Mahmoodabad, Block 6, PECHS, Karachi",
   "Contact": "3204557773",
   "lat": 24.8531581,
   "lng": 67.0633345
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "University Road, adj. Ashfaq Mem. Hospital, Gulshan-e-Iqbal, Karachi",
   "Contact": "(021) 3496 5173, 3497 0805",
   "lat": 24.9096861,
   "lng": 67.0831058
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Sahba Akhtar Road, Block 13 D-2, Gulshan-e-Iqbal, Karachi",
   "Contact": "(021) 3498 6552",
   "lat": 24.9094405,
   "lng": 67.069971
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "R-513, Hussain Hazara Goth, Block 11, Gulshan-e-Iqbal, Karachi",
   "Contact": "3.33E+20",
   "lat": 24.9140646,
   "lng": 67.0888503
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "S.M Toufiq Road, Liaquatabad Underpass, Karachi",
   "Contact": "(021) 3485 7771",
   "lat": 24.9088717,
   "lng": 67.0442338
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Sector 11-B, opp. Masjid-e-Taiyyaba, North Karachi, Karachi",
   "Contact": "(021) 3690 7697",
   "lat": 24.9751411,
   "lng": 67.0619602
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "JF Plaza, Five Star Chowrangi, North Nazimabad Town, Karachi",
   "Contact": "(021) 3663 1957",
   "lat": 24.9420597,
   "lng": 67.0441047
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Behind Taj Medical Complex, off M.A Jinnah Road, Karachi",
   "Contact": "(021) 3278 6499, 3278 3535- 6",
   "lat": 24.8679681,
   "lng": 67.0299029
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Rafiq Plaza, Main Lucky Star, Saddar, Karachi",
   "Contact": "(021) 3569 1114",
   "lat": 24.8573849,
   "lng": 67.0309623
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Ground Floor, 372 Iqbal Hoti Road, Gazdarabad, Karachi",
   "Contact": "(021) 3272 6633",
   "lat": 24.864544,
   "lng": 67.0139032
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Sector 48-H, Korangi Creek, Karachi",
   "Contact": "0346 828 0085 ext. 247",
   "lat": 24.8149981,
   "lng": 67.0604933
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Riaz Mahmood Clinic, behind PSO Pump, Korangi No. 5, Karachi",
   "Contact": "(021) 3503 5332",
   "lat": 24.8318669,
   "lng": 67.0944467
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Commercial Area, Cattle Colony, Landhi, Karachi",
   "Contact": "3361816623",
   "lat": 24.8363029,
   "lng": 67.2610673
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Kala Board Stop, near Atia Hospital, National Highway, Malir, Karachi",
   "Contact": "(021) 3450 1199",
   "lat": 24.8819053,
   "lng": 67.1817009
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Street 18/C, Mauripur Road, Lyari, Karachi",
   "Contact": "3224557771",
   "lat": 24.8675578,
   "lng": 66.8424309
 },
 {
   "Hospital Name": "SindLab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Opp. City School PAF Chapter, Baloch Colony, Karachi",
   "Contact": "(021) 3430 0190",
   "lat": 24.8616114,
   "lng": 67.0851678
 },
 {
   "Hospital Name": "Dr. Mehdi A. Manji Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "105-L, P.E.C.H.S, Near Noorani Kabab House, Shahrah-e-quaideen, Karachi",
   "Contact": "021-34555952, 021-34553323",
   "lat": 24.8678455,
   "lng": 66.9822624
 },
 {
   "Hospital Name": "Dr. Mehdi A. Manji Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "LS 43, Sector 11/ U.P Mor, Karachi",
   "Contact": "021-36902811",
   "lat": 24.9727733,
   "lng": 67.0319475
 },
 {
   "Hospital Name": "Dr. Mehdi A. Manji Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "B-171, Block - 2 Near oxford School Allama Shabbir A. Usmani Rd, Gulshan-e-iqbal, Karachi",
   "Contact": "021-34972777",
   "lat": 24.9481748,
   "lng": 67.0257635
 },
 {
   "Hospital Name": "Karachi Laboratory & Diagnostic Centre",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Delhi Mercantile Medical Complex Building Siraj-ud-Duala Road, Off Shaheed-e-Millat Rd, Darul Aman Society PECHS, Karachi",
   "Contact": "0336-4444817 Muhammad Ali Abbas",
   "lat": 24.8761197,
   "lng": 67.0319327
 },
 {
   "Hospital Name": "Karachi Laboratory & Diagnostic Centre",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Arif Defence Medical Centre, DK-1, Khayaban-e-Bukhari / 34th Street, Defence Housing Authority, Phase VI, Karachi",
   "Contact": "0336-4444817 Muhammad Ali Abbas",
   "lat": 24.7841132,
   "lng": 67.052503
 },
 {
   "Hospital Name": "Karachi Laboratory & Diagnostic Centre",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Ground Floor, ISM Building, Adjacent Anklesaria Nursing Home, Garden Road Karachi,",
   "Contact": "0336-4444817 Muhammad Ali Abbas",
   "lat": 24.8666936,
   "lng": 67.0216593
 },
 {
   "Hospital Name": "Karachi Laboratory & Diagnostic Centre",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "E/2 Shamim Apartments Block 10, F.B Area, Adjacent Ayesha Manzil, Roundabout, Shahrah-e-Pakistan, Karachi",
   "Contact": "0336-4444817 Muhammad Ali Abbas",
   "lat": 24.9284107,
   "lng": 67.0624569
 },
 {
   "Hospital Name": "Pro Lab Diagnostic Centre",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Unit # 1, 165-N Building, Khayaban-e-Muslim, D.H.A Phase 6 Muslim Commercial Area Karachi",
   "Contact": "0302-2835590 Adnan Wahedi",
   "lat": 24.8194649,
   "lng": 67.0196942
 },
 {
   "Hospital Name": "C Lab Diagnostics",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "shop no.14 Taj st, MA.Jinnah Road Saddar, Karachi, Pakistan.",
   "Contact": "+92 (0304) 111 2080",
   "lat": 24.9002442,
   "lng": 66.9944936
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "B-122 Blue building? Block H North Nazimabad Town, Karachi",
   "Contact": "(021) 111 786 986",
   "lat": 24.9409632,
   "lng": 67.0449514
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Suite#CS 19/02, Block 7, Ali Apartments, F.B. Area-Karachi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.9260001,
   "lng": 67.0631432
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "R-46, Sector 5 C-2, Near Power House Chowrangi, North Karachi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.9658295,
   "lng": 67.0397046
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "A-1/3 & 4, Block 4, Gulshan-e-Iqbal, Main Abul Hassan Isphahani Road - Karachi",
   "Contact": "(021) 111 786 986",
   "lat": 24.9583685,
   "lng": 67.0404683
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "S B 1, Suite#2, Javed Arcade, Block 17, Gulistan-e-Jauhar - Karachi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.911527,
   "lng": 67.1219614
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "FL-11/17, Block 13-A, Gulshan-e-Iqbal - Karachi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.9028725,
   "lng": 67.0717632
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Billy's Arcade, Shop No.145-146, Main University Road, KDA Scheme 33, Adjacent to Johar Complex - Karachi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.9115698,
   "lng": 67.1066405
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Suite#1, Bungalow No A-31/2, Near Colony Medical Store, Shama Chorangi, Shah Faisal Colony No. 2 - Karachi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.8831949,
   "lng": 67.1435901
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Plot 3/1, Embankment Road Opp. Kakri Ground, Khi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.8550121,
   "lng": 66.8585983
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop No. 26, 28,29,30, Ground Floor, Taj Complex Main M.A. Jinnah Road - Karachi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.8790973,
   "lng": 66.9913717
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Iqbal Shaheed Road Karachi Cantt Fowler Lines.",
   "Contact": "(021) 111 786 986",
   "lat": 24.8793761,
   "lng": 66.9913716
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Suite No. 2, Plot 8-C, Near Subway & Deepak Parwani, 4th Zamzama Commercial Lane - Karachi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.8169623,
   "lng": 67.039277
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop no 5 & 6, 16-C 5th zamzama commercial lane phase V, DHA",
   "Contact": "(021) 111 786 986",
   "lat": 24.8171435,
   "lng": 67.0388696
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop No. 1, Al-Rehman Tower, Plot # 4, Adjacent Ufone Office , Jinnah Co-operative Housing Society, Block 3, Main SHM Road Karachi.",
   "Contact": "(021) 111 786 986",
   "lat": 24.8814083,
   "lng": 67.0592802
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Jinnah Avenue, Malir Cantt, Service Ln, Rufi Down Town, Karachi, Karachi City, Sindh",
   "Contact": "(021) 111 786 986",
   "lat": 24.9291898,
   "lng": 67.1763475
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Mehran Residency, M-3, Dr Daud Pota Rd, Karachi, 75530",
   "Contact": "(021) 111 786 986",
   "lat": 24.8465945,
   "lng": 67.0348432
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "One Step Diagnostic Centre: 38-C, Lane-8, Main Khayaban-e-Muslim, Bukhari Commercial, Phase-VI - Karachi.",
   "Contact": "(021) 111 786 986",
   "lat": 4.7942969,
   "lng": 67.0603804
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "One Step Diagnostic Centre: R-01-02, Jamal-e-Ibrahim Society Quaidabad, Karachi",
   "Contact": "(021) 111 786 986",
   "lat": 24.8607845,
   "lng": 67.2058388
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "A-65 Indus Mehran Society Main Road Saudabad Malir Colony.",
   "Contact": "(021) 111 786 986",
   "lat": 24.8816036,
   "lng": 67.1868516
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "N-28 korangi 1/2, sector 35-C, opposite PSO pump",
   "Contact": "(021) 111 786 986",
   "lat": 24.8260315,
   "lng": 67.1485078
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Plot # 37, civic centre Latifabad no.6, Near Nadra Centre, Hyderabad.",
   "Contact": "(021) 111 786 986",
   "lat": 25.3688321,
   "lng": 68.3517254
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "A Plot No: C99 Shop No: 1 Govt. Corporate Housing Society Main Naseem Nagar Chowk Qasimabad Hyderabad.",
   "Contact": "(021) 111 786 986",
   "lat": 25.3979423,
   "lng": 68.3338738
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Ground floor, plot mumber 395-B/1 New town mirpurkhas",
   "Contact": "(021) 111 786 986",
   "lat": 25.5065349,
   "lng": 69.0113819
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop 3, 111 Plaza, Fazal-e-Haq Road, Blue Area",
   "Contact": "(021) 111 786 986",
   "lat": 33.7102621,
   "lng": 73.040213
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "22 - G1, Canal Bank, Johar Town, Lahore.",
   "Contact": "(021) 111 786 986",
   "lat": 31.4836729,
   "lng": 74.2269041
 },
 {
   "Hospital Name": "DR. ESSA LABORATORY & DIAGNOSTIC CENTRE",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "PECO Road, Kot Lakhpat, Pindi Shop, Lahore.",
   "Contact": "(021) 111 786 986",
   "lat": 31.4615156,
   "lng": 74.321258
 },
 {
   "Hospital Name": "Sehatmand Zindagi Centre",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "111-C /1, Bus Stop No 7, Nazimabad 3, Near Abbasi Hospital Karachi",
   "Contact": "021-36617404",
   "lat": 24.9189506,
   "lng": 66.995799
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "B-31, Block-15, Off University Road,Gulshan-e-Iqbal , Karachi",
   "Contact": "Tel: 021 34801257-9",
   "lat": 24.90129,
   "lng": 67.0791228
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Plot No. 34-C, Badar Commercial,Street 10 , Phase V, Karachi",
   "Contact": "Tel: 021-35244799, Cell: 0303-0993790",
   "lat": 24.9014343,
   "lng": 67.0112711
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Plot No. 18-C, 4th Zamzama Lane,Phase V DHA, Karachi",
   "Contact": "Tel: 0347-3095416",
   "lat": 24.8171858,
   "lng": 67.0395946
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Khayaban-e-Jami, Phase-2, Extension DHA Karachi",
   "Contact": "Tel: 0333-2870120",
   "lat": 24.8279375,
   "lng": 67.0381413
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Plot # 11-C, Khayaban-e-Shahbaz,DHA Phase Vi, Karachi",
   "Contact": "Tel: 0333-2870121",
   "lat": 24.808107,
   "lng": 67.0439557
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Chand Bibi Road, Adj. Civil Hospital,Karachi",
   "Contact": "Tel: 021-32740041, Cell:0304-0742293",
   "lat": 24.8601724,
   "lng": 67.0052868
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop No. G2, Prince Avenue, Plot No. 4,Lane No 1, Nazimabad No 3 Karachi",
   "Contact": "Tel: 0342-5943944",
   "lat": 24.9153486,
   "lng": 67.0276462
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Shop No. 11, Dada Terrace, Jamaluddin Afghani Road, Karachi",
   "Contact": "Tel: 021-34124540, Cell: 0347-9028317",
   "lat": 24.8847432,
   "lng": 67.0630292
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "R 45, Sector 5c/2, New Karachi Town,Karachi",
   "Contact": "Tel: 0333-1149432",
   "lat": 24.953368,
   "lng": 67.0308402
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "P/38 Khayabane Rahat 10th St, DHA, Phase 6,Karachi",
   "Contact": "Tel: 0333-1149408",
   "lat": 24.8506657,
   "lng": 67.0292136
 },
 {
   "Hospital Name": "Sky Blue Labs",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Address: Al-11, Lane 15, Khayaban-e- Hilal, Phase-7, DHA Karachi.",
   "Contact": "Cell# 021-35244496, 0311-3993145",
   "lat": 24.8508133,
   "lng": 67.0292136
 },
 {
   "Hospital Name": "Sky Blue Labs",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Address: Shop# 1, 2,3m Falaknaz Arcade II Opposite Airport Police Sta  on Shahrah-e Faisal Karachi",
   "Contact": "Cell# 0311-3993141, 021-34593141",
   "lat": 24.886773,
   "lng": 67.0774966
 },
 {
   "Hospital Name": "Sky Blue Labs",
   "City": "Karachi",
   "Status": "On Panel",
   "Address": "Address: Street No. 8, Near UC office, Madina Masjid, Sector B, Akhter Colony, Karachi.",
   "Contact": "Cell# 0311-3993123, 0345-6000984",
   "lat": 24.8565423,
   "lng": 67.0616879
 },
  {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Hyderabad",
   "Status": "On Panel",
   "Address": "Latifabad # 6 , Near Halal-e-Ahmer Hospital, Hyderabad",
   "Contact": "0346-6154688, 0346-7698954",
   "lat": 25.3683692,
   "lng": 68.3498874
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Hyderabad",
   "Status": "On Panel",
   "Address": "Fatima Heights, Doctors Avenue, Saddar Hyderabad",
   "Contact": "0311-1456789",
   "lat": 25.3818029,
   "lng": 68.3408778
 },
 {
   "Hospital Name": "Rahila Research and Reference Lab (Pvt.) Ltd.",
   "City": "Hyderabad",
   "Status": "On Panel",
   "Address": "shop#3 Nadeem complex Near Muslim Commercial Bank Main Road, Qasimabad. Hyderabad",
   "Contact": "Shahid (0333-2605740)",
   "lat": 25.3932081,
   "lng": 68.3182969
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Hyderabad",
   "Status": "On Panel",
   "Address": "Shop No.7, Fatima Heights, Doctors Ln, Soldier Bazaar ,Saddar, Hyderabad",
   "Contact": "Tel: +92 333 2869740",
   "lat": 25.3932037,
   "lng": 68.2920321
 },
 {
   "Hospital Name": "Sky Blue Labs",
   "City": "Hyderabad",
   "Status": "On Panel",
   "Address": "Address: KT Plot # 80 survay #40 Doctor Lain Saddar Cantt Hyderabad.",
   "Contact": "Cell# 0311-3993144",
   "lat": 25.3921376,
   "lng": 67.7665773
 },
  {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Shop# 05, 106-West Royal Centre, Fazal-e-Haq Road, Blue Area Islamabad.",
   "Contact": "0344-4443099",
   "lat": 33.7099922,
   "lng": 73.05557
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "110 Fazal-ul-Haq Road, Blue Area, IslAMabad.",
   "Contact": "051-831 1000",
   "lat": 33.7104987,
   "lng": 73.0566323
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "THE MALL SHOP, SHOP # 1, OPP PSO",
   "Contact": "051-232 2154",
   "lat": 33.6289233,
   "lng": 72.9086772
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Ground floor of the building federation tower, situared Sector E11/2 Markaz IslAMabad",
   "Contact": "051-874 6777",
   "lat": 33.697803,
   "lng": 72.8306339
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Shop no .6 basement umer plaza F8 markaz",
   "Contact": "051-831 1398",
   "lat": 33.715389,
   "lng": 73.0351891
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "PLOT # 5,Shop # 1, B-1 Capital Trade Center near Rahat Bakers F-10 Marakaz",
   "Contact": "051-831 1277",
   "lat": 33.6965871,
   "lng": 73.0089539
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Shop # 7, Ground Floor Lard Trade CENTRE",
   "Contact": "051-835 0191",
   "lat": 33.6830971,
   "lng": 72.9537735
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "PLOT # 35, Shop#14,Near by D.Watson, Al HAMeed Mall",
   "Contact": "051-835 0050",
   "lat": 33.669371,
   "lng": 72.9970209
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Khaiber Plaza 4, shop # 1, 17 G-15 Markaz IslAMabad",
   "Contact": "051-232 8189",
   "lat": 33.6335944,
   "lng": 72.888051
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "PLOT # 3, Shop # 8 Aniqe Arcade Plaza, near Alfalah bank",
   "Contact": "051-835 6615",
   "lat": 33.6335734,
   "lng": 72.8355203
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Excel Labs Diagnostic Unit Munawar Plaza Basement of Soneri bank I-10 markaz",
   "Contact": "051-831 4344",
   "lat": 33.6480811,
   "lng": 73.0374296
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "OGDCL Medical Center F-8 Markaz Excel Labs IslAMabad",
   "Contact": "051-2856 446",
   "lat": 33.6480614,
   "lng": 72.969578
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "OGDCL Medical Center, 39/B B Block Satellite Town, Rawalpindi",
   "Contact": "051- 8734 387",
   "lat": 33.6977635,
   "lng": 72.8306338
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "shop # 1, Hassan Abbas Plaza Gull Berg Town Ali Pur opposite Shell Pump",
   "Contact": "051-261 6044",
   "lat": 33.6332567,
   "lng": 72.9544861
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Main branch: 6-Pak Pavillion Plaza, 65-e, Fazal-e-Haq Road",
   "Contact": "051-2806327-8, 2348373-5",
   "lat": 33.7114388,
   "lng": 73.0522893
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Capital ShoppingCentre, Next to Ramna Police Station, G-11 Markaz",
   "Contact": "051-4717881",
   "lat": 33.6673011,
   "lng": 72.9274597
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Plot # 4-E, Shoukat Plaza I-10 Markaz Islamabad",
   "Contact": "051-2806327-8, 2348373-5",
   "lat": 33.6482658,
   "lng": 73.0382453
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Capital Shopping Centre, Opp Bank of Punjab G-11 Markaz Islamabad",
   "Contact": "051-2806327-8, 2348373-5",
   "lat": 33.6673011,
   "lng": 72.9953088
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Huma Plaza, Opp Poly Clinic, Fazl e Haq Road Islamabad",
   "Contact": "051-2806327-8, 2348373-5",
   "lat": 33.7172931,
   "lng": 73.0685913
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Mehran Plaza, Adjacent Abdullah Bin Masood Masjid G-9 Markaz Islamabad.",
   "Contact": "051-2806327-8, 2348373-5",
   "lat": 33.6877114,
   "lng": 73.0317184
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "8-Ground Floor, Makka Plaza, BLock-D, PWD Housing Society Islamabad.",
   "Contact": "051-2806327-8, 2348373-5",
   "lat": 33.7114388,
   "lng": 73.0588553
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Aklasc Plaza behind Babri Masjid, G-10 Markaz Islamabad.",
   "Contact": "051-2806327-8, 2348373-5",
   "lat": 33.6770319,
   "lng": 73.0140678
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Shop# 01, Lower Ground Floor Shalimar Plaza, F-8 Markaz Isd.",
   "Contact": "051-2806327-8, 2348373-5",
   "lat": 33.7116464,
   "lng": 73.0401764
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Shop no 6, (lower ground floor) Plot no 14, Street Commercial Avenue, Bahria Enclave, Islamabad",
   "Contact": "051-2806327-8, 2348373-5",
   "lat": 33.6972589,
   "lng": 73.1022297
 },
 {
   "Hospital Name": "Advance Lab",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": "Hall No. 3A & 6A Lower Ground Floor, Executive Complex , Plot No 14 G-8 Markaz , Islamabad",
   "Contact": "Tel: 0333-2870124",
   "lat": 33.6318244,
   "lng": 73.0426765
 },
 {
   "Hospital Name": "Margalla Diagnostics & Clinics",
   "City": "Islamabad",
   "Status": "On Panel",
   "Address": " MDC, 1st Floor, Islamabad Corporate Centro, Golra Rd, Islamabad",
   "Contact": "0333-3058000 Tariq Shah",
   "lat": 33.6318288,
   "lng": 72.966073
 },
  {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Pak Medical Center, Khyber Bazaar, Shoba Bazaar, Peshawar",
   "Contact": "3408883249",
   "lat": 34.0063626,
   "lng": 71.5586647
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Abaseen Hospital, Dabagari Garden, Peshawar",
   "Contact": "",
   "lat": 34.0025448,
   "lng": 71.5580679
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Khattak Medical Centre Dabgari Garden Peshawar",
   "Contact": "0308-4379695 / 091-2214522",
   "lat": 34.0025537,
   "lng": 71.5580679
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Opposite Gyne & Emergency Block Lady Reading Hospital Peshawar",
   "Contact": "0335-1113209, 091-2580085",
   "lat": 34.010281,
   "lng": 71.5704455
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Shop# 05 Opposite KTH Doctor Hostel University Town Peshawar",
   "Contact": "0345-4005128 0917087278",
   "lat": 33.9989647,
   "lng": 1.4703913
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "OPP HAYYATABAD MEDICAL COMPLEX DOCTOR PLAZA",
   "Contact": "0917085415-03458402877",
   "lat": 33.9940481,
   "lng": 71.4346894
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Akbar Medical Center, Ramdas Chowk, Peshawar",
   "Contact": "",
   "lat": 34.0001979,
   "lng": 71.5574368
 },
 {
   "Hospital Name": "Rahila Research and Reference Lab (Pvt.) Ltd.",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "43 park road, University town. Peshawar",
   "Contact": "Mr. Rehman (0333-8599499)",
   "lat": 34.0036811,
   "lng": 71.5567852
 },
 {
   "Hospital Name": "Real Time PCR Diagnostics",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Ground Floor, G-30,Auqaf Plaza, Dabgari Garden Peshawar",
   "Contact": "0303-7770520",
   "lat": 34.0036816,
   "lng": 71.5577172
 },
 {
   "Hospital Name": "Real Time PCR Diagnostics",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "MF-92,First Floor,Pak Medical Center, Karachi Market, Khyber Bazar , Peshawar",
   "Contact": "0311-9980066",
   "lat": 34.0099208,
   "lng": 71.5625296
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "The Mall Tower Adjacent to Shaheen Chemist Mall Road Peshawar Cantt.",
   "Contact": "091-526 1066",
   "lat": 33.999173,
   "lng": 71.5171166
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Opp. Mission Hospital Tajammul Mansion Dabgari Road.",
   "Contact": "091-221 8663",
   "lat": 33.9981244,
   "lng": 71.4691793
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Phase 5-Hayatabad, Peshawar, Khyber Pakhtunkhwa",
   "Contact": "051-2806327-8, 2348373-5",
   "lat": 33.9894359,
   "lng": 70.316752
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Swabi Main Bazaar NearJamal Medical Centre Opposite DHQ Hospital Khyber Pakhtunkhwa",
   "Contact": "051-2806327-8, 2348373-5",
   "lat": 34.122281,
   "lng": 72.4638591
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Peshawar",
   "Status": "On Panel",
   "Address": "Shamsi Rd, Mardan, Khyber Pakhtunkhwa",
   "Contact": "051-2806327-8, 2348373-5",
   "lat": 34.1924453,
   "lng": 1.7593636
 },
  {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": " Family Plaza Shop#2 Opp: Gate#3 Holy Family Hospital Rawalpindi",
   "Contact": " 0345-8402876  ",
   "lat": 33.6420664,
   "lng": 73.0567131
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Shop No.1 Cantt Plaza  Commercial Market. Chaklala Scheme III. Rawalpindi",
   "Contact": " 0345-8402876 ",
   "lat": 33.5848468,
   "lng": 73.0869428
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Shop No O/1006/7 Ground Floor Opp: Benezir Bhutto Hospital Out Gate Main Murree Road Rawalpindi",
   "Contact": "3454015059",
   "lat": 33.6268811,
   "lng": 73.0673166
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Bahria Town Phase 7 Rawalpindi Opp DHA bridge Haroon Plaza 28-B Mini Commercial Extension",
   "Contact": "0340-555275",
   "lat": 33.5212039,
   "lng": 73.1010839
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Satellite Town Rawalpindi opposite Holy Family Hospital gate # 3",
   "Contact": "0345-8406745  ",
   "lat": 33.6420664,
   "lng": 73.0567131
 },
 {
   "Hospital Name": "Rahila Research and Reference Lab (Pvt.) Ltd",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "F881 Opp gate #3 Holi Family hospital 5th road Sattelite town.",
   "Contact": "Mr. Shahid Rafiq (0321-5308456) | Abid (0342-000202",
   "lat": 33.6403643,
   "lng": 73.0580861
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "CHUNGI # 20  OPP MUNAWAR COLONY MAIN ADYALA ROAD",
   "Contact": "051-831 5380  ",
   "lat": 33.5476982,
   "lng": 73.0549351
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Civic center,  airport housing society  Gulzar-a-Quaid",
   "Contact": " 051-549 7153  ",
   "lat": 33.5477675,
   "lng": 73.021217
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Shop No 2  Plaza No 147 Civic Centre",
   "Contact": " 051-831 2096  ",
   "lat": 33.5487807,
   "lng": 73.122652
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Plot # 57  HB Commercial. Opp. Bahria Internation hospital",
   "Contact": "0300-077 1720  ",
   "lat": 33.4922862,
   "lng": 73.0653249
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "SHOP # GF-5 Raffay mall chor chowk main peshwar road RWP",
   "Contact": " 051-874 4430  ",
   "lat": 33.6070671,
   "lng": 72.7349209
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Plaza #55 jinah boulevard  Sector E dha phase 2 islamabad",
   "Contact": " 051-5419515  ",
   "lat": 33.5312401,
   "lng": 73.1562345
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Adjacent to Kidney Centre Opp Shifa Eye Trust Shadman Colony Main G.T ",
   "Contact": "051-831 6491",
   "lat": 33.5600375,
   "lng": 73.085102
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "72-C   Opposite Bilal Hospital Sadiqabad Rawalpindi",
   "Contact": " 051-843 1779  ",
   "lat": 33.6334419,
   "lng": 73.0763738
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "SHOP # P-1046-2  Perwaiz Plaza Opposite Ayub Medical Centre Main Siadpur Road",
   "Contact": " 051-8312094  ",
   "lat": 33.6295906,
   "lng": 73.0618832
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Kashmir Road Opp. Jahangir Restaurant Saddar Rawalpindi.",
   "Contact": "051-556 5484  ",
   "lat": 33.5991684,
   "lng": 73.0541659
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Shop#1 SMDC-II Plaza Main Soan Double Road Block A",
   "Contact": " 051-542 8144  ",
   "lat": 33.5665786,
   "lng": 73.151446
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Shop# 3  Basement Adnan Heights  Commercial Area  Chaklala Scheme 3 Chaklala Cantt. Rawalpindi",
   "Contact": "051-2806327-8",
   "lat": 33.5859734,
   "lng": 73.0857101
 },
 {
   "Hospital Name": "Nayab Labs & Diagnostic Centre",
   "City": "Rawalpindi",
   "Status": "On Panel",
   "Address": "Opp B.B Hospital Mallik Plaza Murree Road  Rawalpindi",
   "Contact": "051-2806327-8",
   "lat": 33.6301868,
   "lng": 73.0227666
 },
  {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Dr. Habib Shah Chowk, Mandi Farooqabad.",
   "Contact": "0345-4100356, 0345-8448312",
   "lat": 31.7414904,
   "lng": 73.8262715
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Main Gulberg Road,Opposite National Hospital,Near Tabaq Restaurant Faisalabad.",
   "Contact": "041-2647722, 0345-4004790",
   "lat": 31.4219163,
   "lng": 73.0612414
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Akbarabad Chowk Near Allied Hospital Faisalabad",
   "Contact": "0345-8445046 / 041-2644422 / 0345-8406692",
   "lat": 31.4439307,
   "lng": 73.0818665
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Saleemi Chowk, Satiana Road, Opp National Bank Faisalabad",
   "Contact": "041-8727555-03458402874",
   "lat": 31.4249141,
   "lng": 73.0729645
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Susan Road, Madina Town, Faisalabad",
   "Contact": "0345-4998408, 041-8731166",
   "lat": 31.4249141,
   "lng": 73.0729645
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Jinnah Clinic, Near Faisal Hospital, Canal Road, Faisalabad",
   "Contact": "0345-8402874",
   "lat": 31.405883,
   "lng": 73.066537
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Al-Moiz Diagnostic Center, Ghulamabad, Faisalabad",
   "Contact": "03458402874,041-8727555",
   "lat": 31.4395465,
   "lng": 73.012025
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Gojra Road, OPP Dsp Office, Sumandari Distt: Faisalabad.",
   "Contact": "041-3425586 ,0340-5552747",
   "lat": 31.0625564,
   "lng": 72.9519636
 },
 {
   "Hospital Name": "Chughtai Lab Collection Centers",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Prime Care Hospital, Madina Town, Faisalabad",
   "Contact": "0311-1456789",
   "lat": 31.4210679,
   "lng": 73.1131407
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "219 B Aziz Fatima Hospital Road Near Shalimar Hotel Gulistan Colony Faisalabad",
   "Contact": "041-8845051",
   "lat": 31.4260332,
   "lng": 73.0838426
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Opposite Pace College Near A-One Surgical Allied Hospital Faisalabad",
   "Contact": "041-2623355",
   "lat": 31.448202,
   "lng": 73.0466714
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "Inside Green Pharmacy Near Ideal Bakery Susan Road Faisalabad",
   "Contact": "041-854 3355",
   "lat": 31.4202307,
   "lng": 73.0808005
 },
 {
   "Hospital Name": "Excel Lab",
   "City": "Faisalabad",
   "Status": "On Panel",
   "Address": "339- B Near Doctor Plaza Adjacent Punjab Bank Satyana Road Faisalabad",
   "Contact": "041-8547070",
   "lat": 31.4038668,
   "lng": 73.0867173
 }
]
  '''
  ;
 var Hospital_list_city=[];
 var Lab_list_city=[];
 List<HospitalLocations> locationshos = [];
 List<LabLocations> locationslabs = [];


 HospitalData(){
    var data = jsonDecode(cityList);
    for (var i in data) {
      Hospital_list_city.add(i["City"]);
    }
    Map<String, int> occurrences = LinkedHashMap.fromIterable(Hospital_list_city, key: (i) => i, value: (i) => Hospital_list_city.where((j) => j == i).length);
    List<int> valuesC = occurrences.values.toList();
    List<String> keysC = occurrences.keys.toList();  
    for (var i = 0; i < keysC.length; i++) {
      locationshos.add(HospitalLocations(keysC[i], valuesC[i]));
    } 
    notifyListeners();
  }

LabData(){
    var data = jsonDecode(labCity);
    for (var i in data) {
      Lab_list_city.add(i["City"]);
    }
    Map<String, int> occurrences = LinkedHashMap.fromIterable(Hospital_list_city, key: (i) => i, value: (i) => Hospital_list_city.where((j) => j == i).length);
    List<int> valuesC = occurrences.values.toList();
    List<String> keysC = occurrences.keys.toList();  
    for (var i = 0; i < keysC.length; i++) {
      locationslabs.add(LabLocations(keysC[i], valuesC[i]));
    } 
    notifyListeners();
  }

ClearAll(){
  med_dates.clear();
  lab_dates.clear();
  serialNo_med.clear();
  patient_names.clear();
  patients_age.clear();
  prescription_url.clear();
  serialNo_lab.clear();
  patient_names_lab.clear();
  patients_age_lab.clear();
  prescription_url_lab.clear();
  patient_names_lab.clear();
  patients_age_lab.clear();
  prescription_url_lab.clear();
  orderDate.clear();
  orderTime.clear();
  recieveDate.clear();
  orderType.clear();
  orderDateL.clear();
  orderTimeL.clear();
  recieveDateL.clear();
  orderTypeL.clear();
  medicines.clear();
  labs.clear();
  medlabs.clear();
  med_detail.clear();
  lab_detail.clear();
  notify_med.clear();
  notify_lab.clear();
  Hospital_list_city.clear();
  Lab_list_city.clear();
  locationshos.clear();
  locationslabs.clear();
  cnic='';
  policy='';
    notifyListeners();
}

}

class HospitalLocations{
  String citynames;
  int citycounts;
  HospitalLocations(this.citynames,this.citycounts);
}

class LabLocations{
  String citynames;
  int citycounts;
  LabLocations(this.citynames,this.citycounts);
}




class LatiLngi{
  double lati;
  double longi;
  LatiLngi(this.lati,this.longi);
}