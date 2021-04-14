import 'package:flutter/material.dart';

class EmailSignInForm extends StatelessWidget {
  List<Widget> _buildChildren(){
    return [
      TextField(
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'text@test.com',
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min, // minimize the length of the column
        children: _buildChildren(),
      ),
    );
  }
}
