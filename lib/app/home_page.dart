import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Future<void> _signInAnonymously() async {
    try {
      // good practice to asynchronous apis
      final userCredentials = await FirebaseAuth.instance.signInAnonymously(); // since it returns a Future (see doc), add await and async. it is good practice to add Future <void>
      onSignIn(userCredentials.user);
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
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
