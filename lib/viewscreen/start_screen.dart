import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {

  static const routeName = '/startScreen';
  
  State<StatefulWidget> createState() {
    return _StartScreenState();

  }

}

class _StartScreenState extends State<StartScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start Menu'),
      ),
      body: Text('start screen'),
    );
  }
}