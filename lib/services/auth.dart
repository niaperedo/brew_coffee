import 'package:brew_coffee/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
      // .map((FirebaseUser user) => _userFromFirbase(user));
      .map(_userFromFirebase);
  }

  Future signInAnon() async{
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;

      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  Future register(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());

      return null;
    }
  }
}