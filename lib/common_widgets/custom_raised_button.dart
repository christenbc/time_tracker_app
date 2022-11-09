import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    // constructor
    this.child,
    this.color,
    this.borderRadius: 2.0, // default value
    this.height: 50.0,
    this.onPressed,
  }) : assert(borderRadius != null);

  final Widget child;
  final Color color;
  final double borderRadius;
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // alt + Ent to Raised button and then wrap with widget
      height: height,
      child: ElevatedButton(
        child: child,
        // color: color,
        // disabledColor: color,
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(
        //   Radius.circular(borderRadius),
        // )),
        onPressed: onPressed, // it is possible to set it null
      ),
    );
  }
}
