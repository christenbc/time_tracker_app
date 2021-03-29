import 'package:flutter/material.dart';
import 'package:time_tracker/common_widgets/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  }) : super(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('images/google-logo.png'),
        Text('Sign in with Google'),
        Opacity(
          opacity: 0.0,
          child: Image.asset('images/google-logo.png'),
        ),
      ],
    ),
    color: color,
    height: 40.0,
    onPressed: onPressed,
  );
}
