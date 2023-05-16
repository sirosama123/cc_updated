import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:provider/provider.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  List<Marker> markers = [];
  late GoogleMapController mapController;

  
  @override
  void initState() {
    super.initState();
    loadMarkers();
  }
  final List<Map<String,dynamic>> clityList =  [
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
   "lat": 24.8535492,
   "lng": 64.7984303
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
   "Hospital Name": "Khalid Family Hospital",
   "City": "Zafarwal",
   "Province": "Punjab",
   "Address": "Khalid Family Hospital, Zafarwal, Narowal, Punjab",
   "Contact": "3.03E+20",
   "lat": 32.3369177,
   "lng": 74.9011245
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
   "Contact": "Cell: +92 336 5102904 / Office: +92 51 8449100 (4400)",
   "lat": 33.6246546,
   "lng": 72.9708722
 }
  ];
  void loadMarkers() async {
   
    
  }

  @override
  Widget build(BuildContext context) {
    String data = '''
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
 

]
  '''
    ;
    List<dynamic> jsonData = jsonDecode(data);
    for (var item in jsonData) {
      markers.add(
        Marker(
          markerId: MarkerId(item["City"]),
          position: LatLng(item["lat"], item["lng"]),
          infoWindow: InfoWindow(
            title: item["Hospital Name"],
            snippet: item["Address"],
            onTap: (){
               showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title:  Text("${item['Hospital Name']}"),
                  content: Container(
                    height: 70.h,
                    child: Column(
                      children: [
                        Text("${item['Address']}"),
                        SizedBox(height: 2.h,),
                        Text("${item['Contact']}"),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color: Color(0xff2b578e),
                        padding: const EdgeInsets.all(14),
                        child: const Text("okay",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              );

            }
          ),
        ),
      );
    }
    setState(() {
      
    });
    final Provider11 = Provider.of<Provider1>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
         appBar: AppBar(
            backgroundColor: Color(0xff2b578e),
            title:const Text("Hospital Locations"),
            leading: GestureDetector(
            child:const Icon( Icons.arrow_back_ios, color: Colors.white,  ),
               onTap: () {
                 Navigator.pop(context);
                } ,
        ) ,
          ),
        body: GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(Provider11.latL, Provider11.lonL),
        zoom: Provider11.zoomL,
      ),
      markers: Set<Marker>.of(markers),
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
      },
    ),  
      ),
    );
     
  }
}




class Map4 extends StatefulWidget {
  const Map4({super.key});

  @override
  State<Map4> createState() => _Map4State();
}

class _Map4State extends State<Map4> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
        
      ),
     );
  }
}