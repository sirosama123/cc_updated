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
import 'package:project1/test2.dart';
import 'package:project1/test3.dart';
import 'package:provider/provider.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
    
    
    
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>  Provider1()),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      routes: {
  
        '/outpatient': (context) => firstLanding(tab: 0,),
        '/inpatient':(context) => firstLanding(tab: 0,)
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
      // Test3()
       SplashScreen()
    ),
      );}
    );
      
}

}