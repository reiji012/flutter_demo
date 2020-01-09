import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  var list = ["one", "two", "three", "four"];

  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

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
            ),
            child: _customCard(item, size)
          ),
          ],
        ),
      ),
    );
  }

  Widget _customCard(String item, Size size) {
    return Container (
      width: size.width,
      margin: EdgeInsets.only(
        top: 50,
        left: 100,
        right: 100,
        bottom: 50
      ),
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: Container(
            child: Center(
              child: Text(
                item,
              ),
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation:10,
      ),
    );
  }
}