import 'package:flutter/material.dart';
import 'SecondPage.dart';

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
      home: MyHomePage(title: 'Flutter First Page'),
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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            Image.asset('image/s000_003.jpg'),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                      return SecondPage();
                  }),
                );
              },
              child: Text('Go Second'),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container( // 余白のためContainerでラップ
            margin: EdgeInsets.only(bottom: 16.0),
            child: RaisedButton(
              child: Icon(Icons.add),
              color: Colors.red,
              shape: CircleBorder(),
              onPressed: _incrementCounter,
            ),
          ),
          Container( // 余白のためContainerでラップ
            margin: EdgeInsets.only(bottom: 16.0),
            child: RaisedButton(
              child: Icon(Icons.remove),
              color: Colors.amberAccent,
              shape: CircleBorder(),
              onPressed: _decrementCounter,
            ),
          ),
          Container( // 余白のためContainerでラップ
            margin: EdgeInsets.only(bottom: 16.0),
            child: RaisedButton(
              child: Icon(Icons.delete),
              color: Colors.green,
              shape: CircleBorder(),
              onPressed: _deleteAll,
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
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