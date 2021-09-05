import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(
      MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //String stringResponse = 'Null';
  List listResponse = ['Null'];

  Future fetchData() async {
    http.Response response;
    var url = Uri.parse("https://www.thegrowingdeveloper.org/apiview?id=4");
    response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        listResponse = json.decode(response.body);
      });
    }
  }

  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello How are you"),
        backgroundColor: Colors.red[900],
      ),
      body: Text(
        listResponse[2].toString(),
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
