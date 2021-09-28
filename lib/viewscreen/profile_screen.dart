import 'package:flutter/material.dart';
import 'package:lesson2/model/userecord.dart';

class ProfileScreen extends  StatefulWidget {
  static const routeName = '/profileScreen';
  late final UserRecord userRecord;
  ProfileScreen(this.userRecord);
  @override
  State<StatefulWidget> createState() {
   return _ProfileState();
  }
  
}
class _ProfileState extends State<ProfileScreen> {
  late _Controller con;
  bool editMode = false;
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
title: Text('Profile'),
actions: [
  editMode ? IconButton(onPressed: con.save, icon: Icon(Icons.check))
  : IconButton(onPressed: con.edit, icon: Icon(Icons.edit)),
],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
              Expanded(
                flex: 1,
                child: Text(
                  'Name', 
                  style: Theme.of(context).textTheme.headline6,
                  ),
              ),
              Expanded(
                flex: 4,
              child: TextFormField(
                enabled: editMode,
                initialValue: widget.userRecord.name,
                validator: con.validateName,
                onSaved: con.saveName,
              ),
              ),
                ],
              ),
              Row(
                children: [
              Expanded(
                flex: 1,
                child: Text(
                  'Phone', 
                  style: Theme.of(context).textTheme.headline6,
                  ),
              ),
              Expanded(
                flex: 4,
              child: TextFormField(
                enabled: editMode,
                initialValue: widget.userRecord.phone,
                validator: con.validatePhone,
                onSaved: con.savePhone,
              ),
              ),
                ],
              ),
              Row(
                children: [
              Expanded(
                flex: 1,
                child: Text(
                  'Age', 
                  style: Theme.of(context).textTheme.headline6,
                  ),
              ),
              Expanded(
                flex: 4,
              child: TextFormField(
                enabled: editMode,
                initialValue: widget.userRecord.age.toString(),
                validator: con.validateAge,
                onSaved: con.saveAge,
              ),
              ),
                ],
              ),
              SizedBox(height: 20.0,),
              Text('Classification', 
              style: Theme.of(context).textTheme.headline6,
              ),
DropdownButtonFormField(
  value: widget.userRecord.classification,
  onChanged: editMode ? con.onChangedClassification : null,
  items: [
    for (var c in Classification.values)
    DropdownMenuItem<Classification>(
      child: Text(c.toString().split('.')[1]),
      value: c,
      )
  ],
  ),
  SizedBox(height: 20.0,),
  Text('Major', style: Theme.of(context).textTheme.headline6,),
  Column(
    children: [
      for (var m in Major.values)
RadioListTile<Major>(
  title: Text(m.toString().split('.')[1]),
  value: m,
  groupValue: widget.userRecord.major,
  onChanged: editMode ? con.onChangedMajor : null,
)
    ],
    ),
    SizedBox(height: 20.0),
    Text('Language proficiency', style: Theme.of(context).textTheme.headline6,),
    Column(
      children: [
        for (var v in Language.values)
        CheckboxListTile(
          value: widget.userRecord.languages[v],
          title: Text(v.toString().split('.')[1]),
          onChanged: editMode ? (value) => con.onChnagedLanguage(value, v) : null,
        )
      ],
      ), 
            ],
            ),
        ),
      ),
      );
  }
  
}
class _Controller {
  late _ProfileState state;
  _Controller(this.state);
  void save(){
    FormState? currentState = state.formKey.currentState;
    if (currentState == null || !currentState.validate()) return;
    currentState.save();
state.render(() => state.editMode = false);
  }
  void edit() {
    state.render(() => state.editMode = true);

  }
  String? validateName(String? value) {
    if (value == null || value.length < 2)
    return 'Invalid name';
    else
    return null;


  }
  void saveName(String? value) {
    if (value != null)
    state.widget.userRecord.name = value;
  }
    String? validatePhone(String? value) {
      if (value == null || value.length < 10)
      return 'Invalid phone number';
      else
    return null;

  }
  void savePhone(String? value) {
    if (value != null)
    state.widget.userRecord.phone = value;
  }
    String? validateAge(String? value) {
      if (value == null)
      return 'Invalid age';
      try {
        int age = int.parse(value);
        if (age >= 12)
        return null;
        else
        return 'Min age is 12';
      } catch (e) {
return 'Age must be an integer';
      }
  }
  void saveAge(String? value) {
    if (value != null)
    state.widget.userRecord.age = int.parse(value);
  }
  void onChangedClassification(Classification ? c) {
    if (c != null) {
      state.render(() {
        state.widget.userRecord.classification = c;
      });
      
    }

  }
  void onChangedMajor(Major? m) {
    if (m != null) {
      state.render(() => state.widget.userRecord.major = m);
    }
  }
  void onChnagedLanguage(bool? value, Language key) {
if (value != null) {
  state.render(() => state.widget.userRecord.languages[key] = value);
}
  }
}