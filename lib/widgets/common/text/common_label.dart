import 'package:flutter/material.dart';

import '../../../const/constants.dart';

class CommonLabel extends StatelessWidget {
  /// label
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color color;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  const CommonLabel(this.text, {
    Key? key,
    this.fontSize = Constants.fntNormalSize,
    this.fontWeight,
    this.color = Constants.textSecondaryDark,
    this.overflow = TextOverflow.clip,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}