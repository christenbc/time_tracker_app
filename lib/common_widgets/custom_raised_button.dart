import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        'Sign in with Google',
        style: TextStyle(
          color: Colors.black87,
          fontSize: 15.0,
        ),
      ),
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          )
      ),
      onPressed: _signInWithGoogle, // it is possible to set it null
    );
  }

  void _signInWithGoogle(){
    // TODO: Auth with Google
  }
}
