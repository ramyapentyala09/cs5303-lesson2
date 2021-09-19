import 'package:flutter/material.dart';

class LifecycleScreen extends StatefulWidget {
  static const routeName = '/LifecycleScreen';
  @override
  State<StatefulWidget> createState() {
    return _LifecycleState();
  }

}

class _LifecycleState extends State<LifecycleScreen> {

  String? gps;

  @override
  void initState() {
    super.initState();
    print('===== initState: LifeCycle Demo Widget');
    gps = "GPS is allocated /reserved";
  }
  @override
  Widget build(BuildContext context) {
    print('====== build: LifeCycle Demo Widget');
    return Scaffold(
      appBar: AppBar(
        title: Text('Lifecycle Demo'),
        ),
        body: Text('LifeCycle Demo: $gps'),
    );
  }
  @override
  void dispose() {
    print('====== dispose: LifeCycle Demo Widget');
    print('GPS is released');
    gps = null;
    super.dispose();
  }
}