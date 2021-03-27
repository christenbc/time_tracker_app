import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  // alt+Ent to show dependencies to red variables
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2.0,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.orange,
            child: SizedBox(
              height: 100.0,
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            color: Colors.red,
            child: SizedBox(
              height: 100.0,
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            color: Colors.purple,
            child: SizedBox(
              height: 100.0,
            ),
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
