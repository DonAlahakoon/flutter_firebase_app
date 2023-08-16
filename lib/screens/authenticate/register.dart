import 'package:flutter/material.dart';

import '../../services/auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  
  //text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        elevation: 0.0,
        title: Text("Sign up to Brew Crew"),
      ),
      body: Container(
        padding:EdgeInsets.symmetric(vertical:20.0,horizontal:50.0),
        child: Form(
          child: Column(
            children: [
              SizedBox(height:20.0),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height:20.0),
              TextFormField(
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(height:20.0),
              ElevatedButton(
                onPressed: () {
                  
                },
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),),
              )
            ],
          ))
      ),
    );
  }
}