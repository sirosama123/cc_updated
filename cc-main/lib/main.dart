import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/screens/Provider/provider1.dart';
import 'package:project1/screens/firstLanding.dart';
import 'package:project1/screens/splashScreen.dart';
import 'package:provider/provider.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return
    
    
    
    ScreenUtilInit(
      useInheritedMediaQuery: true,
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