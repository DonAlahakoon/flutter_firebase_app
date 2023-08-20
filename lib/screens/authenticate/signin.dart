import 'package:brew_crew3/services/auth.dart';
import 'package:brew_crew3/shared/constants.dart';
import 'package:brew_crew3/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  //instance of the auth service
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
   

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        elevation: 0.0,
        title: Text("Sign in to Brew Crew"),
        actions: [
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text("Register"),
            onPressed:() {
              widget.toggleView();//this is the function passed from the parent widget
            },
            
          )
        ],
      ),
      body: Container(
        padding:const EdgeInsets.symmetric(vertical:20.0,horizontal:50.0),
        child: Form(
          key: _formKey,//this is the key to validate the form
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
                  if(_formKey.currentState!.validate()){//using form key to validate the form
                    setState((){
                      loading = true;
                    });
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                        error = "Could not sign in with those credentials";
                        loading = false;
                      });
                    }
                  }
                },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.pink[400]!)
                  ),
                child: const Text(
                  "Sign in",
                  style: TextStyle(color: Colors.white),
                  ),
              ),
              const SizedBox(height:20.0),
              Text(
                error,
                style: const TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ))
      ),
      
    );
  }
}