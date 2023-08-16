import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class AuthService{

  //instance of firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance; 

  //create a user object based on UserCredentials
  AppUser? _userFromFirebaseUser(User? user){
    return user !=null? AppUser(uid: user.uid) : null ;
  }

  //auth change user stream
  Stream<AppUser?> get user{
    return _auth.authStateChanges()
    //.map((User? user) => _userFromFirebaseUser(user));
    .map(_userFromFirebaseUser);//same as above
  }

  //sign in anon
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);

    }catch(e){
      print(e.toString());
      return null;
    }
  }
  //sign in email & password

  //register email & password

  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}