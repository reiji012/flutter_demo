
import 'package:flutter/material.dart';
import 'ThirdPage.dart';

class SecondPage extends StatelessWidget {
  var list = ["one", "two", "three", "four"];

  double cardMarginLeft(String item) {
    double marginLeft = 0;
    if (item == "one") {
      marginLeft = 30;
    }
    return marginLeft;
  }

  double cardMarginRight(String item) {
    double marginRight = 0;
    if (item == "four") {
      marginRight = 30;
    }
    return marginRight;
  }

  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    double cardHeight = size.height / 2;
    double cardWidth = size.width - 50;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('second Page')),
      body: Container(
          color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ThirdPage();
                      }),
                    );
                  },
                  child: Text('Go Third'),
                ),
                height: cardHeight / 2,
              ),
              Container(
                height: cardHeight,
                child: ListView(

                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    for(var item in list ) Container (
                        height: cardHeight,
                        width: cardWidth,
                        child: _customCard(item, size)
                    ),
                  ],
                ),
              ),
            ],
        ),
      ),
    );
  }

  // カードView
  Widget _customCard(String item, Size size) {
    return Container (
      width: size.width,
      margin: EdgeInsets.only(
        top: 10,
        left: cardMarginLeft(item),
        right: cardMarginRight(item),
        bottom: 50,
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