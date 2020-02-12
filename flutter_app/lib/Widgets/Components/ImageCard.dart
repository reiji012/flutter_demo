import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/Screens/HeroPage.dart';

class CustomCard extends StatefulWidget {
  static const routeName = 'animatedPadding';
  String heroTag = "";

  CustomCard(String heroTag) {
    this.heroTag = heroTag;
  }

  @override
  State<StatefulWidget> createState () {
    // TODO: implement createState
    return CustomCardState(heroTag);
  }
}

class CustomCardState extends State<CustomCard> {
  var _hasPadding = false;
  String heroTag = "";

  CustomCardState(String heroTag) {
    this.heroTag = heroTag;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedPadding(
      duration: const Duration(milliseconds: 80),
      padding: EdgeInsets.all(_hasPadding ? 10 : 0),
      child: GestureDetector(
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation:10,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTapDown: (TapDownDetails downDetails) {
              setState(() {
                _hasPadding = true;
              });
            },
            onTap: () {
              print('Card tapped.');
              setState(() {
                _hasPadding = true;
              });
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    pageBuilder: (_, __, ___) => HeroPage(heroTag),
                  ));
            },
            onTapCancel: () {
              setState(() {
                _hasPadding = false;
              });
            },
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset('image/image.jpg', fit: BoxFit.fill),
            ),
          ),
        ),
      ),
    );
  }
}