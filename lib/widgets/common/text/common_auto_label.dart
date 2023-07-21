import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../const/constants.dart';

class CommonAutoLabel extends StatelessWidget {
  /// label
  final String text;

  /// label size
  final double fontSize;

  /// label font weight
  final FontWeight? fontWeight;

  /// label color
  final Color color;

  /// max lines , default 1
  final int maxLines;

  final double minFontSize;

  const CommonAutoLabel(this.text, {
    Key? key,
    this.fontSize = Constants.fntNormalSize,
    this.fontWeight,
    this.color = Constants.textSecondaryDark,
    this.maxLines = 1,
    this.minFontSize = 11,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      maxLines: maxLines,
      minFontSize: minFontSize,
    );
  }
}