import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {
  String heroTag;

  HeroPage(String heroTag) {
    this.heroTag = heroTag;
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel in vertical scrollable'),
      ),
      body: Hero(
        tag: heroTag,
        child: Icon(Icons.alarm)
      )
    );
  }
}