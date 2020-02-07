import 'package:flutter/material.dart';
import 'ThirdPage.dart';

class HeroPage extends StatelessWidget {
  String heroTag;

  HeroPage(String heroTag) {
    this.heroTag = heroTag;
  }

  @override
  Widget build (BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Hero(
        tag: heroTag,
        child: Container(
          height: 400,
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
      )
    );
  }
}