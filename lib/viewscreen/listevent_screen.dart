import 'package:flutter/material.dart';
import 'package:lesson2/course.dart';
import 'package:lesson2/viewscreen/view/webimage.dart';

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
        actions: con.selected.isEmpty ? null : [
          IconButton(
            onPressed: con.delete, 
            icon: Icon(Icons.delete),
            ),
          IconButton(
            onPressed: con.cancel, 
            icon: Icon(Icons.cancel),
            ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.allCourses.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: con.selected.contains(index) ? con.selectedColor : con.unselectedColor,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(widget.allCourses[index].number),
              subtitle: Text(widget.allCourses[index].title),
              onTap: () => con.onTap(context, index),
              onLongPress: () => con.onLongPress(context, index),
            ),
          );
        

      },
      ),
    );
  }
}
class _Controller {
  _ListEventState state;

  List<int> selected = [];
  final Color selectedColor = Colors.deepPurpleAccent;
  final Color unselectedColor = Colors.lightBlue;
  _Controller(this.state); 

  void delete() {
selected.sort(); // ascending order
for (int i = selected.length - 1; i>=0; i--) {
  state.widget.allCourses.removeAt(selected[i]);
  }
  state.render((){
  selected.clear();
  });
  }

  void cancel() {
    state.render((){
    selected.clear();
    });

  }

  void onLongPress(BuildContext context, int index) {
    state.render((){
    if (selected.contains(index))
    selected.remove(index);
    else
    selected.add(index);
     });
  }

  void onTap(BuildContext context, int index){
    if (selected.isEmpty)
    showDetails(context, state.widget.allCourses[index]);
else
onLongPress(context, index);
  }
  void showDetails(BuildContext context, Course course) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
      return AlertDialog(
        backgroundColor: Colors.lime[100],
        title: Text(course.number),
        actions: [
          OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Close', 
              style: Theme.of(context).textTheme.button,
              ),
            
            )
        ],
        content: Card(
          color: Colors.lime[800],
          elevation: 16.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(.0),
                child: Column(
                  children: [
                    WebImage(url: course.imageURL, context: context),
                    Text(
                      course.title, style: Theme.of(context).textTheme.headline6,
                      ),
                    Text(
                      'Prerequisites: ${course.prereq}', 
                      style: Theme.of(context).textTheme.headline6,
                      ),
                  ],
                  ),
              ),
            ),
        ),
      );
    },
    );
  }
}