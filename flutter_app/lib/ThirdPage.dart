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
  var list = [1, 2, 3, 4];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel in vertical scrollable'),
      ),
      body: Container(
          decoration: BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.2, 0.6],
              colors: [
                Color.fromARGB(255, 72, 168, 255),
                Color.fromARGB(255, 100, 115, 255),
              ],
            ),
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
                  onLongPress: () {
                    setState(() {
                      _hasElevation = !_hasElevation;
                      padding = _hasElevation ? 50 : 0;
                      print(_hasElevation);
                      print(padding);
                    });
                  },
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