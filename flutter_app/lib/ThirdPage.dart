import 'package:flutter/material.dart';
import 'package:flutter_app/HeroPage.dart';

class ThirdPage extends StatefulWidget {
  static const routeName = 'animatedPadding';

  @override
  State<StatefulWidget> createState () {
    // TODO: implement createState
    return ThirdPageState();
  }
}

class ThirdPageState extends State<ThirdPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel in vertical scrollable'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        itemBuilder: (BuildContext context, int index) {
          if(index % 2 == 0) {
            return _buildCarousel(context, index ~/ 2);
          }
          else {
            return Divider();
          }
        },
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Carousel $carouselIndex'),
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 217.0,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, carouselIndex, itemIndex);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, int carouselIndex, int itemIndex) {
    String heroTag = "hero" + itemIndex.toString() + carouselIndex.toString();
    var _hasElevation = false;
    double padding = 0;

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
            child: AnimatedPadding(
              duration: Duration(milliseconds: 100),
              padding: EdgeInsets.all(padding),
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation:10,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('Card tapped.');
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 700),
                          pageBuilder: (_, __, ___) => HeroPage(heroTag),
                        ));
                  },
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset('image/image.jpg', fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}