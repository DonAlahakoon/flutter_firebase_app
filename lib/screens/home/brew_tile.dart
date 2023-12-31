import 'package:brew_crew3/models/brew.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  
  final Brew brew;
  const BrewTile({required this.brew,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[brew.strength],
            backgroundImage: const AssetImage('assets/coffee_icon.png'),
          ),
          title: Text(brew.name),
          subtitle: Text("Takes ${brew.sugars} sugar(s)"),
        )
      )
      );
  }
}