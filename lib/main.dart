import 'package:flutter/material.dart';
import 'package:lesson2/course.dart';
import 'package:lesson2/viewscreen/cardlist_screen.dart';
import 'package:lesson2/viewscreen/counterdemo_screen.dart';
import 'package:lesson2/viewscreen/lifecycle_screen.dart';
import 'package:lesson2/viewscreen/start_screen.dart';

void main() {
  runApp(Lesson2App());
}

class Lesson2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: StartScreen.routeName,
      routes: {
        StartScreen.routeName: (context) => StartScreen(),
        CounterDemoScreen.routeName: (context) => CounterDemoScreen(),
        LifecycleScreen.routeName: (context) => LifecycleScreen(),
        CardListScreen.routeName: (context) {
          Object? args = ModalRoute.of(context)?.settings.arguments;
          return CardListScreen(args as List<Course>);
        }
      },
    );
  }
}