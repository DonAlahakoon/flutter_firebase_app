import 'dart:math';

import 'package:brew_crew3/shared/constants.dart';
import 'package:flutter/material.dart';

import '../../services/auth.dart';

class Register extends StatefulWidget {
  
  final Function toggleView;
   const Register({super.key, required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  
  //text field state
  String email = '';
  String password = '';
  String error = '';

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        elevation: 0.0,
        title: const Text("Sign up to Brew Crew"),
        actions: [
          TextButton.icon(
            label: const Text("Sign In"),
            icon:const Icon(Icons.person),
            onPressed:(){
              widget.toggleView();//this is the function passed from the parent widget
            },
          )
        ],
      ),
      body: Container(
        padding:const EdgeInsets.symmetric(vertical:20.0,horizontal:50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height:20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Email"),
                validator: (val) => val!.isEmpty? "Enter an email" : null,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              const SizedBox(height:20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Password"),
                validator: (val) => val!.length < 6 ? "Enter a password 6+ characters long" : null,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              const SizedBox(height:20.0),
              ElevatedButton(
                onPressed: () async{
                  if(_formKey.currentState!.validate()){
                    setState((){
                      loading = true;
                    });
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                        error = "Please supply a valid email";
                        loading = false;
                      });
                    }
                  }
                },
                child: const Text(
                  "Register",
                  style: TextStyle(color: Colors.white),),
              ),
              const SizedBox(height:20.0),
              Text(
                error,
                style: const TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ))
      ),
    );
  }
}