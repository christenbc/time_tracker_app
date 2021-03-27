import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({ // constructor
    this.child,
    this.color,
    this.borderRadius : 2.0, // default value
    this.onPressed,
  });

  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: child,
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(borderRadius),
      )),
      onPressed: onPressed, // it is possible to set it null
    );
  }

}
