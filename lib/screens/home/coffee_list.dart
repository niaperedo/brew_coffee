import 'package:flutter/material.dart';
import 'package:brew_coffee/models/coffee.dart';
import 'package:provider/provider.dart';

class CoffeeList extends StatefulWidget {
  @override
  _CoffeeListState createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  @override
  Widget build(BuildContext context) {
    final coffee = Provider.of<List<Coffee>>(context);

    coffee.forEach((c) {
      print(c.name);
      print(c.strength);
      print(c.sugars);
    });

    return Container(

    );
  }
}