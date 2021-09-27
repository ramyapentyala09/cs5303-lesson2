import 'package:flutter/material.dart';

class FormDemoScreen extends StatefulWidget {
  static const routeName = '/formDemoScreen';
  @override
  State<StatefulWidget> createState() {
    return _FormDemoState();
  }
}
class _FormDemoState extends State<FormDemoScreen> {
  late _Controller con;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
       title: Text('Form Demo'),
       ),
       body: Form(
       key: formKey,
       child: Column(
         children: [
TextFormField(
  decoration: InputDecoration(
    icon: Icon(Icons.email),
    hintText: 'Enter email'
  ),
  keyboardType: TextInputType.emailAddress,
  autocorrect: false,
  ),
  TextFormField(
    decoration: InputDecoration(
      icon: Icon(Icons.lock),
      hintText: 'Enter password',
    ),
    obscureText: true,
    autocorrect: false,
  ),
         ],
       ),
       ),
   );
  } 
}
class _Controller {
  late _FormDemoState state;
  _Controller(this.state);
}
 
  
