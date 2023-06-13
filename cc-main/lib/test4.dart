import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  

   Future<void> updateData() async {
     final url = 'https://script.google.com/macros/s/AKfycbyedd-CB8KbRhmt_7cOnz18KwyXzrfpBQQhJ0vxxtpxAE9HiQuCHVlDiPDHna4ByWeK/exec'; 

    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: '''
        {
          "member_id": "12345",
          "claim_amount": 1000
        }
      ''',
    );

    if (response.statusCode == 302) {
      final redirectUrl = response.headers['location'];
      if (redirectUrl != null) {
        response = await http.post(
          Uri.parse(redirectUrl),
          headers: {'Content-Type': 'application/json'},
          body: '''
            {
              "member_id": "12345",
              "claim_amount": 1000
            }
          ''',
        );
      }
    }

    if (response.statusCode == 200) {
      print('Data updated successfully.');
    } else {
      print('Failed to update data. Error: ${response.statusCode}');
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            updateData();
          },
          child: Text('Update Data'),
        ),
      ),
    );
  }
}



