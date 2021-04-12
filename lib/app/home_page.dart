import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, @required this.onSignOut, @required this.auth}) : super(key: key);
  final AuthBase auth;
  final VoidCallback onSignOut;

  Future<void> _signOut() async {
    try {
      await auth.signOut(); // since it returns a Future (see doc), add await and async. it is good practice to add Future <void>
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            onPressed: _signOut,
          )
        ],
      ),
    );
  }
}
