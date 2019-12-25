import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Deaaaaaaamo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter aaaaaaaDemo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _comment = "";

  void _incrementCounter() {
    setState(() {
      _counter++;

      if (this._counter >= 10) {
        _comment = "10個以上だね！！！";
      } else {
        _comment = "届いてないよ";
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;

      if (this._counter >= 10) {
        _comment = "10個以上だね！！！";
      } else {
        _comment = "届いてないよ";
      }
    });
  }

  void _deleteAll() {
    setState(() {
      _counter = 0;
      _comment = "届いてないよ";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RandomWords(),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              '１０個以上かな？'
            ),
            Text(
              '$_comment',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 16.0, right: 10.0),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ),
          Container( // 余白のためContainerでラップ
            margin: EdgeInsets.only(bottom: 16.0, right: 10.0),
            child: FloatingActionButton(
              backgroundColor: Colors.amberAccent,
              onPressed: _decrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.remove),
            ),
          ),
          Container( // 余白のためContainerでラップ
            margin: EdgeInsets.only(bottom: 16.0, right: 10.0),
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: _deleteAll,
              tooltip: 'Increment',
              child: Icon(Icons.delete),
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  Widget build(BuildContext context) {
    final WordPair wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}

class CustomButtonsState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

}

class CustomButtons extends State<CustomButtonsState> {

  _MyHomePageState view;

  void _incrementCounter() {
    view._incrementCounter();
  }

  void _decrementCounter() {
    view._decrementCounter();
  }

  void _deleteAll() {
    view._deleteAll();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold (
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.redAccent,
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          Container( // 余白のためContainerでラップ
            margin: EdgeInsets.only(bottom: 16.0),
            child: FloatingActionButton(
              backgroundColor: Colors.amberAccent,
              onPressed: _decrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.remove),
            ),
          ),
          Container( // 余白のためContainerでラップ
            margin: EdgeInsets.only(bottom: 16.0),
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: _deleteAll,
              tooltip: 'Increment',
              child: Icon(Icons.delete),
            ),
          ),
        ],
      ),
    );
  }

}