import 'package:brew_crew3/screens/authenticate/authenticate.dart';
import 'package:brew_crew3/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

//this class listen to the auth changes and return either home or authenticate widget
class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<AppUser?>(context);//this is the user from the stream

    
    //return either home or authenticate widget
    if(user == null){
      return const Authenticate();
    }
    else{
      return Home();
    }

    
    
  }
}