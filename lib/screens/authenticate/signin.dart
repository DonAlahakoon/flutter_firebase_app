import 'package:brew_crew3/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  //instance of the auth service
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        elevation: 0.0,
        title: Text("Sign in to Brew Crew"),
      ),
      body: Container(
        padding:EdgeInsets.symmetric(vertical:20.0,horizontal:50.0),
        child: ElevatedButton(
          child: Text("Sign in anon"),
          onPressed: () async {//async is used to make the function wait for the result of the signin
            dynamic result = await _auth.signInAnon();
            if(result == null){
              print("error signing in");
            }
            else{
              print("signed in");
              print(result.uid);
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.brown[400]!),
          ),
        )
      ),
      
    );
  }
}