import 'package:flutter/material.dart';

class CommonInkWell extends StatelessWidget {
  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  /// callback when tapping
  final Function()? onTap;

  /// padding vertical space
  final double vSpace;

  /// padding horizontal space
  final double hSpace;

  /// border radius
  final double radius;

  const CommonInkWell({
    Key? key,
    required this.child,
    this.onTap,
    this.vSpace = 0,
    this.hSpace = 0,
    this.radius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: hSpace, vertical: vSpace),
          child: child,
        ),
      ),
    );
  }
}