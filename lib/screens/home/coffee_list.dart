import 'package:flutter/material.dart';
import 'package:brew_coffee/models/coffees.dart';
import 'package:provider/provider.dart';
import 'package:brew_coffee/screens/home/coffee_tile.dart';

class CoffeeList extends StatefulWidget {
  @override
  _CoffeeListState createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  @override
  Widget build(BuildContext context) {
    final coffee = Provider.of<List<Coffees>>(context) ?? [];

    return ListView.builder(
      itemCount: coffee.length,
      itemBuilder: (context, index) {
        return CoffeeTile(
          coffees: coffee[index]
        );
      },
    );
  }
}