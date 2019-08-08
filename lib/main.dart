import 'package:flutter/material.dart';
import 'package:sleep_app/homepage/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleep App',
      theme: ThemeData(
        backgroundColor: Color(0xff121421),
        iconTheme: IconThemeData(color: Colors.white, size: 35),
        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.white, fontSize: 40),
          subtitle: TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: 16.5),
          display2: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 18),
          display1: TextStyle(color: Colors.white, fontSize: 22),
        ),
        accentTextTheme: TextTheme(subtitle: TextStyle(color: Color(0xff3D5DA4), fontSize: 16.5)),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}


