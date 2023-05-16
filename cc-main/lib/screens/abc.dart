import 'package:flutter/material.dart';
import 'package:project1/screens/map3.dart';
import 'package:provider/provider.dart';

import 'Provider/provider1.dart';

class Sender1 extends StatelessWidget {
  const Sender1({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context); 
    return SafeArea(
      child: ElevatedButton(
        onPressed: ()async{
         Provider11.Hyderabad();
         await Future.delayed(const Duration(seconds: 3));
         Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                (context) => 
                Map5()
                ));
        },
        child: Text("data")),
    );
  }
}