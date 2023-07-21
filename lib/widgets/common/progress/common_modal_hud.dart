import 'package:flutter/material.dart';


/// modal progress hud
class CommonModalHud extends StatelessWidget{

  /// loading
  final bool? loading;

  /// loading position
  final AlignmentGeometry alignment;

  /// child
  final Widget child;

  /// loading widget
  const CommonModalHud({
    Key? key,
    this.loading,
    this.alignment = Alignment.center,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loading == null || loading == false) {
      return child;
    }

    return Stack(
      alignment: alignment,
      children: [
        IgnorePointer(
          ignoring: loading!,
          child: child,
        ),
        const CircularProgressIndicator(),
      ],
    );
  }
}