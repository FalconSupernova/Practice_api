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
  String stringResponse = 'Null';

  Future fetchData() async {
    http.Response response;
    var url = Uri.parse("https://www.thegrowingdeveloper.org/apiview?id=1");
    response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
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
        stringResponse.toString(),
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
