import 'dart:async';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:CovidMonitor/ui/countryselection/SelectCountry.dart';
import 'package:CovidMonitor/ui/home/HomePage.dart';
import 'package:CovidMonitor/util/ColorUtil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:admob_flutter/admob_flutter.dart';

void main()  {
  Admob.initialize("ca-app-pub-2485899540395345~4436339469");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      title: 'CovidApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurple,
        fontFamily: 'Louis',
      ),
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        decideWhichPageToGo();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                child: Hero(
                  tag: "ic_goaway",
                  child: Image.asset('images/COVID monitor.png', height: 51, width: 300, ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Made with ❤ in india",)
            ),
          )
        ],
      )
    );
  }

  void decideWhichPageToGo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if(preferences.containsKey('userCountry')) {
      gotoHomePage();
    } else {
      gotoSelectCountryPage();
    }
  }

  void gotoHomePage() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 800),
        pageBuilder: (_, __, ___,) => HomePage(),
      ),
    );
  }

  void gotoSelectCountryPage() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 800),
        pageBuilder: (_, __, ___,) => SelectCountry(),
      ),
    );
  }
}
