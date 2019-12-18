import 'package:brew_coffee/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_coffee/models/coffees.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference coffeeCollection = Firestore.instance.collection('coffee');

  List<Coffees> _coffeeListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Coffees(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0'
      );
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      strength: snapshot.data['strength'],
      sugars: snapshot.data['sugars'],
    );
  }

  Stream<List<Coffees>> get coffees {
    return coffeeCollection.snapshots()
      .map(_coffeeListFromSnapShot);
  }

  Stream<UserData> get userData {
    return coffeeCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

  Future updateUserData(String sugars, String name,  int strength) async {
    return await coffeeCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength
    });
  }
}