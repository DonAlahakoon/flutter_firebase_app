import 'package:brew_crew3/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      )
    );
    
  }
}