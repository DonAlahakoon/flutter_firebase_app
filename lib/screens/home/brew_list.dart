import 'package:brew_crew3/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'brew_tile.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {

  
  @override
  Widget build(BuildContext context) {

    final brews = Provider.of<List<Brew>?>(context)?? [];// in here we are getting the brews from the stream provider in home.dart
 
    return ListView.builder(
      itemCount: brews.length,
      itemBuilder:(context, index){
        return BrewTile(brew: brews[index]);
      } );
  }
}