import 'package:brew_coffee/screens/home/settings_form.dart';
import 'package:brew_coffee/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_coffee/services/database.dart';
import 'package:provider/provider.dart';
import 'package:brew_coffee/screens/home/coffee_list.dart';
import 'package:brew_coffee/models/coffee.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: SettingsForm()
          );
        }
      );
    }

    return StreamProvider<List<Coffee>>.value(
        value: DatabaseService().coffee,
        child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Coffee'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('logout'),
            ),
            FlatButton.icon(
              onPressed: () =>_showSettingsPanel(),
              icon: Icon(Icons.settings),
              label: Text('settings')
            )
          ],
        ),
        body: CoffeeList(

        )
      ),
    );
  }
}