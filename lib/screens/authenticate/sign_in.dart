import 'package:brew_coffee/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In'),
        actions: <Widget>[
        FlatButton.icon(
          icon: Icon(Icons.person),
          label: Text('Sign Up'),
          onPressed: () {
            widget.toggleView();
          },
        )
      ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            TextFormField(
              onChanged: (val) {
                setState(() => email = val);
              }
            ),
            SizedBox(height: 20.0),
            TextFormField(
              onChanged: (val) {
                setState(() => password = val);
              },
              obscureText: true,
            ),
            SizedBox(height: 20.0,),
            RaisedButton(
              color: Colors.pink[400],
              child: Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white
                )
              ),
              onPressed: () async  {
                print(email);
                print(password);
              },
            )
          ],
        )
      )
    );
  }
}