import 'package:flutter/material.dart';

class CounterDemoScreen extends StatefulWidget {
  static const routeName = '/counterDemoScreen';

  State<StatefulWidget> createState() {
    return _CounterDemoState();
  }

}
class _CounterDemoState extends State<CounterDemoScreen> {
  late _Controller con;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    con = _Controller(this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Demo'),
      ),
      body: Column(
        children: [
          Text('Counter = $counter', style: Theme.of(context).textTheme.headline4,),
          IconButton(
            onPressed: con.countUp,
             icon: Icon(Icons.arrow_upward),
             ),
          IconButton(onPressed: con.countDown,
           icon: Icon(Icons.arrow_downward),
           ),
        ],
        ),

    );

  }
  
}
class _Controller {
  late _CounterDemoState state;
  _Controller(this.state);
  void countUp(){
++state.counter;
print('====== counter = ${state.counter}');
  }
 void countDown(){
--state.counter;
print('====== counter = ${state.counter}');
}
}