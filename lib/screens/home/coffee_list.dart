import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class CoffeeList extends StatefulWidget {
  @override
  _CoffeeListState createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  @override
  Widget build(BuildContext context) {
    final coffee = Provider.of<QuerySnapshot>(context);
    print(coffee.documents);

    for (var doc in coffee.documents) {
      print(doc.data);
    }

    return Container(

    );
  }
}