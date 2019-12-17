import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference coffeeCollection = Firestore.instance.collection('coffee');
}