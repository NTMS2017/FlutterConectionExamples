/*

In pubsoec.yaml

  dependencies:
      connectivity: "^0.3.1"

 */


import 'dart:async';
mport 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final Color darkMainGreen = const Color(0xFF689F38);
final Color midMainGreen = const Color(0xFF7CB342);
final Color lightMainGreen = const Color(0xFF8BC34A);
bool hasConnection;

// TODO: 1) MAIN ****************************************
void main() async {
  runApp(new MyApp());
}

// TODO: 2) MyApp ****************************************
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyFlutterApp',
      home: new MyHomePage(),
    );
  }
}

// TODO: 3) Statefull MyHomePage Class ********************
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

// TODO: 4) _MyHomePageState Class ************************
class _MyHomePageState extends State<MyHomePage> {
  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectivity = new Connectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        setState(() {
          hasConnection = true;
        });
      } else {
        setState(() {
          hasConnection = false;
        });
      }
    });
  }

  // TODO: dispose ***************************************
  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  // TODO: BUILD WIDGET **********************************
  @override
  Widget build(BuildContext context) {
    if (hasConnection == false) {
      return new Scaffold(
          backgroundColor: darkMainGreen,
          body: new Center(
            child: new Card(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Container(
                    padding: new EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new AspectRatio(
                          // Width: 3.0  and  Height: 0.5
                          aspectRatio: 2.0 / 0.30,
                          child: Image.asset('assets/images/LogoBlue.png'),
                        ),
                        new Text(
                          'WARNNING',
                          style: new TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        new Text(' '),
                        new Text('Do some warning text in here'),
                        new Text('tell them to turn on the wifi or gprs.'),
                        new Text(' '),
                        new Text('tell them to control it.'),
                        new Text(' '),
                        new Text(
                          "www.flutterlovesyou.com",
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              color: darkMainGreen),
                        ),
                        new Text(
                          "some phone number if you like",
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              color: darkMainGreen),
                        ),
                      ],
                    ),
                  ),
                  //new Text('general balance'),
                ],
              ),
            ),
          ));
    } else {
      return new Scaffold(
        // APPBAR
        appBar: new AppBar(
          title: new Text(
            "main.appTitle",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          //elevation: 1.0,
          backgroundColor: midMainGreen,
        ),

        // BODY
        body: new Center(child: new Text("Welcome to my app")),
      );
    }
  } // build Widget

} // _MyHomePageState Class
