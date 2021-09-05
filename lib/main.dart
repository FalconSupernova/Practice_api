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
  // List listResponse = [null];
  Map mapResponse = {};
  List listOfResponse = [];
  Future fetchData() async {
    http.Response response;
    var url = Uri.parse("https://www.thegrowingdeveloper.org/apiview?id=2");
    response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listOfResponse = mapResponse['facts'];
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
      body: mapResponse == null
          ? Container()
          : Column(
              children: <Widget>[
                Text(
                  mapResponse['category'].toString(),
                  style: TextStyle(fontSize: 30),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index)
                    {
                  return Container(

                    child: Column(
                      children: [
                        Image.network(listOfResponse[index]["image_url"])
                      ],
                    ),
                  );
                })
              ],
            ),
    );
  }
}
