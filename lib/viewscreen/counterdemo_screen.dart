import 'package:flutter/material.dart';
import 'package:lesson2/viewscreen/lifecycle_screen.dart';

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
    print('xxxxxxxxxxxxxx initState(): CounterDemo');
  }
  void render(fn) {
    setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    print('xxxxxxxxxxxxx build(): CounterDemo');
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Demo'),
      ),
      body: Column(
        children: [
          Text('Counter = $counter', style: Theme.of(context).textTheme.headline4,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Container(
            color: Colors.red,
            child: IconButton(
              iconSize: 100.0,
              onPressed: con.countUp,
               icon: Icon(Icons.arrow_upward),
               ),
          ),
             SizedBox(width: 50.0),
          Container(
            color: Colors.yellow,
            child: IconButton(
              iconSize: 100.0,
              onPressed: con.countDown,
             icon: Icon(Icons.arrow_downward),
             ),
          ),
        ],
        ),
        ElevatedButton(
          onPressed: con.gotoDemo, 
          child: Text('Go to Lifecycle Demo Widget')),
        ],
      ),
    );

  }
  @override
  void dispose() {
    print('xxxxxxxxxxx dispose(): CounterDemo');
    super.dispose();
  }
  
}
class _Controller {
  late _CounterDemoState state;
  _Controller(this.state);
  void countUp(){
    state.render(() {
++state.counter;
    });
print('====== counter = ${state.counter}');
  }
 void countDown(){
   state.render(() {
--state.counter;
    });
print('====== counter = ${state.counter}');
}
void gotoDemo(){
  Navigator.pushNamed(state.context, LifecycleScreen.routeName);
}
}