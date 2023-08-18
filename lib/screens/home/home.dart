import 'package:brew_crew3/services/auth.dart';
import 'package:brew_crew3/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'brew_list.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService().brews,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Brew Crew"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,//remove shadow
          actions: [
            TextButton.icon(
              icon: Icon(Icons.person),
              onPressed: () async{
                dynamic result  = await _auth.signOut();
              },
              label: Text("Logout"),
            ),
          ],
        ),
        body: BrewList(),
      ),
    );
    
  }
}