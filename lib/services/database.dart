import 'package:brew_crew3/models/brew.dart';
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

  //brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Brew(
        name: doc.get('name') ?? '',
        strength: doc.get('strength') ?? 0,
        sugars: doc.get('sugars') ?? '0',
      );
    }).toList();
  }

  //get brews stream
  Stream<List> get brews {
    return brewCollection.snapshots()
    .map(_brewListFromSnapshot);
  }
}