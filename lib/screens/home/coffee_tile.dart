import 'package:flutter/material.dart';
import 'package:brew_coffee/models/coffees.dart';

class CoffeeTile extends StatelessWidget {
  final Coffees coffees;
  CoffeeTile({this.coffees});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(
          20.0, 6.0, 20.0, 6.0
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[coffees.strength],
          ),
          title: Text(coffees.name),
          subtitle: Text('Takes ${coffees.sugars} sugar(s)'),
        ),
      ),
    );
  }
}