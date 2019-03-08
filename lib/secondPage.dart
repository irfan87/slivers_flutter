import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final userData;
  SecondPage(this.userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(userData["name"]["first"]),
      ),
      body: Center(
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Color(0xffc94b6),
            image: DecorationImage(
              image: NetworkImage(userData["picture"]["large"]),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(75.0)),
            border: Border.all(
              color: Colors.red,
              width: 4.0,
            )
          ),
        ),
      ),
    );
  }
}