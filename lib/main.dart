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

  String url = 'https://randomuser.me/api/?results=15';

  Future<String> makeRequest() async {
    var response = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
   

    setState(() {
      var extractUserData = jsonDecode(response.body);

      userListData = extractUserData["results"];
    });
  }

  @override
  void initState() {
    super.initState();

    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliver List"),
      ),
      body: ListView.builder(
        itemCount: userListData == null ? 0 : userListData.length,
        itemBuilder:(BuildContext context, i) {
          return ListTile(
            title: Text(userListData[i]["name"]["first"]),
            subtitle: Text(userListData[i]["phone"]),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(userListData[i]["picture"]["thumbnail"]),
            ),
          );
        },
      ),
    );
  }
}