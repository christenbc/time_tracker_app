import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget { // alt+Ent to show dependencies to red variables
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2.0,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Container(
              color: Colors.orange,
              child: SizedBox(
                width: 100.0,
                height: 100.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
