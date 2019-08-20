import 'package:flutter/material.dart';
import 'dart:convert';
import 'Kuote.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuotes',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        canvasColor: Colors.white,
      ),
      home: MyHomePage(title: 'Kuotes'),
      debugShowCheckedModeBanner: false
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var akuote = new Kuote();
  var kuote;
  int kuotesLen;
  int kuotesPointer;

  _MyHomePageState() {
    kuote = jsonDecode(akuote.get());
    kuotesLen = akuote.getKCount();
    kuotesPointer = akuote.getKPointer();
  }

  void _refreshKuote() {
    setState(() {
      kuote = jsonDecode(akuote.get());
      kuotesLen = akuote.getKCount();
      kuotesPointer = akuote.getKPointer();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(24),
              height: 300,
              child: Text('"' + kuote["kuote"] + '"',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  )),
            ),
            Container(
              padding: EdgeInsets.all(24),
              alignment: Alignment.bottomCenter,
              child: Text(' - ' + kuote["author"],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  )),
            ),
            Container(
              padding: EdgeInsets.all(24),
              alignment: Alignment.bottomCenter,
              child: Text('$kuotesPointer / $kuotesLen',
                  style: TextStyle(
                    color: Colors.grey[500],
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'New Kuote',
        onPressed: _refreshKuote,
        child: Icon(Icons.autorenew),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
