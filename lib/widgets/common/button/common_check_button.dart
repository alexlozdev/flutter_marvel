import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../const/constants.dart';

class CommonCheckButton extends StatelessWidget {

  /// button text
  final String text;

  /// true if selected
  final bool selected;

  /// text size
  final double textSize;

  /// text color
  final Color textColor;

  /// text select color
  final Color textSelColor;

  /// background color
  final Color bgColor;

  /// background Select color
  final Color bgSelColor;

  /// callback when pressed
  final Function()? onPressed;

  const CommonCheckButton({
    Key? key,
    this.text = '',
    this.selected = false,
    this.textSize = Constants.fntMiddleSize,
    this.textColor = Constants.textSecondaryDark,
    this.textSelColor = Constants.textPrimaryLight,
    this.bgColor = Constants.white,
    this.bgSelColor = Constants.fgPrimary,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const vSpace = Constants.widgetPaddingV;
    const hSpace = Constants.widgetPaddingV;

    return TextButton(
      style: TextButton.styleFrom(
        //primary: Colors.white,
        backgroundColor: selected ? bgSelColor : bgColor,
        shadowColor: Colors.grey,
        elevation: 3,
        disabledForegroundColor: Colors.grey,
        side: BorderSide(
          width: 0.5,
          color: Colors.grey.withOpacity(0.8),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey.withOpacity(0.3),
            width: 0.1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(Constants.buttonRadius)),
        ),
      ),
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: hSpace, vertical: kIsWeb ? vSpace + 3: vSpace),
        child: Text(
          text,
          style: TextStyle(
            fontSize: textSize,
            color: selected ? textSelColor : textColor,
          ),
        ),
      ),
    );
  }
}