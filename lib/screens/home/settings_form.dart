import 'package:brew_crew3/services/database.dart';
import 'package:brew_crew3/shared/constants.dart';
import 'package:brew_crew3/shared/loading.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();//this is a global key for the form
  final List<String> sugars = ['0','1','2','3','4'];//this is a list of sugars

  //form values
  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<AppUser?>(context);

    
    return StreamBuilder(
      stream: DatabaseService(uid:user!.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){

          UserData? userData = snapshot.data;
           
          return Form(
              key: _formKey,//this is the key to validate the form
              child: Column(
                children:<Widget> [
                  const Text("Update your brew settings",
                  style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(height:20),
                  TextFormField(
                    initialValue: userData!.name,
                    decoration: textInputDecoration,
                    validator: (val) => val!.isEmpty? "Please enter a name" : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  const SizedBox(height:20),
                  //dropdown
                  DropdownButtonFormField(
                    decoration: textInputDecoration,
                    value: _currentSugars ?? userData!.sugars,//if _currentSugars is null then use 0
                    items: sugars.map((sugar){
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text("$sugar sugars"),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _currentSugars = val!),
                  ),
                  //slider
                  Slider(
                    min: 100.0,
                    max: 900.0,
                    divisions: 8,
                    value: (_currentStrength ?? userData.strength).toDouble(),
                    onChanged: (val) => setState(()=> _currentStrength = val.round()),
                    activeColor: Colors.brown[_currentStrength ?? userData.strength],
                    inactiveColor: Colors.brown[_currentStrength ?? userData.strength],
                    ),
                  //button
                  ElevatedButton(
                    onPressed: () async{
                      if(_formKey.currentState!.validate()){
                        await DatabaseService(uid: user.uid).updateUserData(
                          _currentSugars ?? userData.sugars,//if _currentSugars not exist then use existing values(userData.sugars)
                          _currentName ?? userData.name,
                          _currentStrength ?? userData.strength
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: Text("Update"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[400],
                      foregroundColor: Colors.white,
                    )
                  )
                ],));
        }
        else{
          return Loading();
        }
      }
    );
  }
}