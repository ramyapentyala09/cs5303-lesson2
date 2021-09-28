import 'package:flutter/material.dart';
import 'package:lesson2/model/userecord.dart';
import 'package:lesson2/viewscreen/userhome_screen.dart';
import 'package:lesson2/viewscreen/view/myutil.dart';

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
           Text('Sign In, Please!', style: Theme.of(context).textTheme.headline5,),
TextFormField(
  decoration: InputDecoration(
    icon: Icon(Icons.email),
    hintText: 'Enter email'
  ),
  keyboardType: TextInputType.emailAddress,
  autocorrect: false,
  validator: con.validateEmail,
  onSaved: con.saveEmail,
  ),
  TextFormField(
    decoration: InputDecoration(
      icon: Icon(Icons.lock),
      hintText: 'Enter password',
    ),
    obscureText: true,
    autocorrect: false,
    validator: con.validatePassword,
    onSaved: con.savePassword,
  ),
  ElevatedButton(
    onPressed: con.signIn,
    child: Text('Submit'),
    )
  
         ],
       ),
       ),
   );
  } 
}
class _Controller {
  late _FormDemoState state;
  _Controller(this.state);
  String? email;
  String? password;

  void signIn() {
    FormState? currentState = state.formKey.currentState;
    if (currentState == null) return;
    if (currentState.validate()) return;
    currentState.save();
    

    UserRecord user = UserRecord.fakeDB.firstWhere(
(e) => e.email == email && e.password == password,
orElse: () => UserRecord(),

    );
    if(user.email == ''){
      MyUtil.showSnackBar(
        context: state.context,
        message: 'Incorrect email/password',
      );

    } else {
      Navigator.pushNamed(
        state.context, 
        UserHomeScreen.routeName,
        arguments: user,
        );
    }

  }
  String? validateEmail(String? value) {
    if (value == null || (value.contains('@') && value.contains('.')))
    return 'Invalid Email';
    else 
    return null;
  }
  String? validatePassword(String? value) {
    if (value == null || value.length < 6)
    return 'Invalid Password';
    else
    return null;
  }
  void saveEmail(String? value) {
email = value;
  }
  void savePassword(String? value){
    password = value;
  }
}
 
  
