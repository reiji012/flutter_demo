import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    var list = ["one", "two", "three", "four"];

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('second Page')),
      body: Container(
        color: Colors.blue,
        child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          children: <Widget>[
          for(var item in list ) Container (
            margin: EdgeInsets.only(
              top: 300,
              bottom: 150,
              left: 40,
              right: 40,
            ),
            child:  Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                    height: 300,
                    width: 300,
                    child: Center(
                      child: Text(
                          item
                      ),
                    ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation:10,
            ),
          ),
          ],
        ),
      ),
    );
  }
}