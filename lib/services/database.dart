import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_coffee/models/coffee.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference coffeeCollection = Firestore.instance.collection('coffee');

  List<Coffee> _coffeeListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Coffee(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0'
      );
    }).toList();
  }

  Stream<List<Coffee>> get coffee {
    return coffeeCollection.snapshots()
      .map(_coffeeListFromSnapShot);
  }

  Future updateUserData(String sugars, String name,  int strength) async {
    return await coffeeCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength
    });
  }
}