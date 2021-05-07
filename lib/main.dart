import 'package:flutter/material.dart';
// import 'expandedList.dart';
import 'secondExpandedList.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
             title: Text('My Deco Expanded'),
      ),
      body:  SecondPanelView(),
  
      )
    );
}
}