import 'package:brew_crew3/models/brew.dart';
import 'package:brew_crew3/screens/home/settings_form.dart';
import 'package:brew_crew3/services/auth.dart';
import 'package:brew_crew3/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'brew_list.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal:60.0),
          child: SettingsForm(),
          color: Colors.brown[100],
        );
      });
    }
    return StreamProvider<List<Brew>?>.value(//in here we are listening to the stream of data from the database
      value: DatabaseService().brews,
      initialData: [],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Brew Crew"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,//remove shadow
          actions:<Widget> [
            TextButton.icon(
              icon: Icon(Icons.person),
              onPressed: () async{
                await _auth.signOut();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: Text("Logout"),
            ),
            TextButton.icon(
              icon: Icon(Icons.settings),
              label: Text("Settings"),
              onPressed:() => _showSettingsPanel(),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            )
          ],
        ),
        body: Container(
          child: BrewList(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/coffee_bg.png"),
              fit: BoxFit.cover,
            )
          ),
      ),
      ),
    );
    
  }
}