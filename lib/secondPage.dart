import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final userData;
  SecondPage(this.userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: Container(
      //     width: 150,
      //     height: 150,
      //     decoration: BoxDecoration(
      //       color: Color(0xffc94b6),
      //       image: DecorationImage(
      //         image: NetworkImage(userData["picture"]["large"]),
      //         fit: BoxFit.cover,
      //       ),
      //       borderRadius: BorderRadius.all(Radius.circular(75.0)),
      //       border: Border.all(
      //         color: Colors.red,
      //         width: 4.0,
      //       )
      //     ),
      //   ),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(userData["picture"]["large"]),
            ),
            leading: Text(userData["name"]["first"]),
          ),
          SliverList(
            
            delegate: SliverChildBuilderDelegate((context, index) {
              return Card(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      // CircleAvatar(
                      //   backgroundColor: Colors.transparent,
                      //   backgroundImage: NetworkImage(userListData[index]["picture"]["thumbnail"]),
                      // ),
                      SizedBox(width: 15.0),
                      Column(
                        children: <Widget>[
                          Text(userData["name"]["first"]),
                          Text(userData["name"]["last"]),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            childCount: 1),
          )
        ],
      ),
    );
  }
}