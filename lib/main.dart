import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sliver List App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: MyHomePageBody(),
    );
  }
}

class MyHomePageBody extends StatefulWidget {
  @override
  _MyHomePageBodyState createState() => _MyHomePageBodyState();
}

class _MyHomePageBodyState extends State<MyHomePageBody> {
  List userListData;

  String url = 'https://randomuser.me/api/';

  Future<String> makeRequest() async {
    var response = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var extractUserData =jsonDecode(response.body);

    userListData =extractUserData["results"];

    print(userListData[0]["name"]["first"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Sliver List App"),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            child: Text("Make Request"),
            onPressed: makeRequest,
          ),
        ),
      ),
    );
  }
}