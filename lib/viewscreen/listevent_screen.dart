import 'package:flutter/material.dart';
import 'package:lesson2/course.dart';

class ListEventScreen extends StatefulWidget {

  static const routeName = '/listEventScreen';

  late final List<Course> allCourses;

  ListEventScreen(this.allCourses);
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
      body: ListView.builder(
        itemCount: widget.allCourses.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.lime[200],
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(widget.allCourses[index].number),
              subtitle: Text(widget.allCourses[index].title),
              onTap: () => con.onTap(index),
            ),
          );
        

      },
      ),
    );
  }
}
class _Controller {
  _ListEventState state;
  _Controller(this.state); 

  void onTap(int index){
    print('====== onTap: $index');

  }
}