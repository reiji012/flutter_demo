import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/Screens/HeroPage.dart';
import 'package:flutter_app/Widgets/Components/ImageCard.dart';

class ThirdPage extends StatefulWidget {
  static const routeName = 'animatedPadding';


  @override
  State<StatefulWidget> createState () {
    // TODO: implement createState
    return ThirdPageState();
  }
}

class ThirdPageState extends State<ThirdPage> {
  var list = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel in vertical scrollable'),
      ),
      body: Container(
          decoration: BoxDecoration(
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildCarousel(context, 1),
            ],
          )
      )
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Carousel $carouselIndex'),
        SizedBox(
          height: 300.0,
          child: PageView(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            children: <Widget>[
              for(var itemIndex in list ) Container (
                  child: _buildCarouselItem(context, carouselIndex, itemIndex)
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, int carouselIndex, int itemIndex) {
    String heroTag = "hero" + itemIndex.toString() + carouselIndex.toString();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Hero(
          tag: heroTag,
          child: Material(
            type: MaterialType.transparency,
            child: CustomCard(heroTag),
          ),
        ),
      )
    );
  }
}