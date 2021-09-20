import 'package:flutter/material.dart';

class ListEventScreen extends StatefulWidget {

  static const routeName = '/listEventScreen';
  @override
  State<StatefulWidget> createState() {
    return _ListEventState();
  } 
}
class _ListEventState extends State<ListEventScreen> {

  late _Controller con;

  @override
  void initState() {
    super.initState();
    con = _Controller(this);
  }

  void render(fn) => setState(fn);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Event Demo'),
      ),
      body: Text('list event'),
    );
  }
}
class _Controller {
  _ListEventState state;
  _Controller(this.state); 
}