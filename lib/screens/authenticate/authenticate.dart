import 'package:brew_crew3/screens/authenticate/register.dart';
import 'package:brew_crew3/screens/authenticate/signin.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool  showSignIn = true;

  //toggle between sign in and register
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    },);
  }
  @override
  Widget build(BuildContext context) {
    
      if (showSignIn){
        return SignIn(toggleView: toggleView);
      }
      else{
        return Register(toggleView: toggleView);
      }
  
  }
}