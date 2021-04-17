import 'package:flutter/material.dart';
import 'package:time_tracker/common_widgets/form_submit_button.dart';

class EmailSignInForm extends StatelessWidget {

  String email;

  void _submit(){
    // TODO: print email and password
    print(email);
  }
  
  List<Widget> _buildChildren(){
    return [
      TextField(
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'text@test.com',
        ),
        onChanged: (value) => email = value,
      ),
      SizedBox(height: 8.0),
      TextField(
        decoration: InputDecoration(
          labelText: 'Password',
        ),
        obscureText: true,
      ),
      SizedBox(height: 8.0),
      FormSubmitButton(
          text: 'Sign in',
          onPressed: _submit,
      ),
      FlatButton(
        child: Text('Need an account? Register'),
        onPressed: () {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min, // minimize the length of the column
        children: _buildChildren(),
      ),
    );
  }
}
