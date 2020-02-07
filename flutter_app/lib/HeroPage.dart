import 'package:flutter/material.dart';
import 'ThirdPage.dart';

class HeroPage extends StatelessWidget {
  String heroTag;
  String imageHeroTag;
  var list = ["one", "two", "three", "four", "two", "three", "four", "two", "three", "four", "two", "three", "four", "two", "three", "four", "two", "three", "four"];

  HeroPage(String heroTag) {
    this.heroTag = heroTag;
    this.imageHeroTag = heroTag + 'image';
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Hero(
        tag: heroTag,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              imageView(context),
              Container(
                color: Colors.white,
                height: 620,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    for(var item in list ) Container (
                        child: cell(item)
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget cell(String title) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            child: RaisedButton(
              child: Icon(Icons.check, color: Colors.white,),
              color: Colors.blue,
              shape: CircleBorder(),
              onPressed: () {

              },
            ),
          ),
          Text(
              title,
              style: TextStyle(fontSize: 30),
              semanticsLabel: 'aaa',
          ),
          Divider(
            height: 1,
              color: Colors.black
          )
        ],
      ),
    );
  }

  Widget imageView(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
        height: 275,
        child: Container(
            child: Stack(
              children: <Widget>[
                Image.asset('image/image.jpg'),
                Container(
                  child: Column(
                    verticalDirection: VerticalDirection.down,
                    children: <Widget>[
                      Container(
                        height: statusBarHeight,
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              right: 5
                          ),
                          child: Container(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // これで両端に寄せる
                                children: <Widget>[
                                  Container(),
                                  Container(
                                      child: Container(
                                        child: RaisedButton(
                                          child: Icon(Icons.close, color: Colors.white,),
                                          color: Colors.blue,
                                          shape: CircleBorder(),
                                          onPressed: () {
                                            Navigator.pop(
                                              context,
                                              MaterialPageRoute(builder: (context) {
                                                return ThirdPage();
                                              }),
                                            );
                                          },
                                        ),
                                      )
                                  )
                                ]
                            ),
                          )
                      )
                    ],
                  ),
                )
              ],
            )
//          child: Image.asset('image/image.jpg'),
        )
    );
  }
}