import 'package:flutter/material.dart';
import 'package:lesson2/course.dart';
import 'package:lesson2/model/userecord.dart';
import 'package:lesson2/viewscreen/cardlist_screen.dart';
import 'package:lesson2/viewscreen/counterdemo_screen.dart';
import 'package:lesson2/viewscreen/error_screen.dart';
import 'package:lesson2/viewscreen/formdemo_screen.dart';
import 'package:lesson2/viewscreen/lifecycle_screen.dart';
import 'package:lesson2/viewscreen/listevent_screen.dart';
import 'package:lesson2/viewscreen/profile_screen.dart';
import 'package:lesson2/viewscreen/start_screen.dart';
import 'package:lesson2/viewscreen/userhome_screen.dart';

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
          if ( args != null)
          return CardListScreen(args as List<Course>);
          else
          return ErrorScreen('argument is null at CardListScreen');
          
        },
        ListEventScreen.routeName: (context) {
          Object? args = ModalRoute.of(context)?.settings.arguments;
          if ( args != null)
          return ListEventScreen(args as List<Course>);
          else
          return ErrorScreen('argument is null at ListEventScreen');
          
        },
        FormDemoScreen.routeName: (context) => FormDemoScreen(),
        UserHomeScreen.routeName: (context) {
          Object? args = ModalRoute.of(context)?.settings.arguments;
          if (args != null)
          return UserHomeScreen(args as UserRecord);
          else
          return ErrorScreen('argument is null at UserHomeScreen');
        },
        ProfileScreen.routeName: (context) {
          Object? args = ModalRoute.of(context)?.settings.arguments;
          if (args != null)
          return ProfileScreen(args as UserRecord);
          else
          return ErrorScreen('argument is null at ProfileScreen');
        }
      },
    );
  }
}