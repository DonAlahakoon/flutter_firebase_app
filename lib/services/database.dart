import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String? uid;
  DatabaseService({this.uid});

  //collection  reference
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');//this is the name of the collection in firestore if there is no collection with this name it will be created


  Future updateUserData(String sugars, String name, int strength) async {
     return await brewCollection.doc(uid).set({
       'sugars': sugars,
       'name': name,
       'Strength': strength,
     });
  }

  //get brews stream
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}