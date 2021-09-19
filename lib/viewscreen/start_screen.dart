import 'package:flutter/material.dart';
import 'package:lesson2/viewscreen/counterdemo_screen.dart';

class StartScreen extends StatefulWidget {

  static const routeName = '/startScreen';

  State<StatefulWidget> createState() {
    return _StartScreenState();

  }

}

class _StartScreenState extends State<StartScreen> {

  late _Controller con;

@override
  void initState() {
    super.initState();
    con = _Controller(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start Menu'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: con.navigate2CounterDemo,
            child: Text('Counter Demo'),
            ),
          ],
          ),
          ),
    );
  }
}
class _Controller {
  late _StartScreenState state;
  _Controller(this.state);

  void navigate2CounterDemo() {
    Navigator.pushNamed(state.context, CounterDemoScreen.routeName);
  }

}