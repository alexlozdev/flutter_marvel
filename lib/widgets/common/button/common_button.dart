import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../const/constants.dart';

class CommonButton extends StatelessWidget {

  /// button label
  final String text;

  /// callback when pressed button
  final Function()? onPressed;

  final bool stretch;
  final double vSpace;
  final double hSpace;
  final double radius;
  final double textSize;
  final Color? backgroundColor;
  final Color textColor;
  final BorderSide? borderSide;
  final bool newStyle;
  final IconData? iconData;

  const CommonButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.stretch = false,
    this.vSpace = Constants.widgetPaddingV,
    this.hSpace = Constants.widgetPaddingH,
    this.radius = Constants.buttonRadius,
    this.textSize = Constants.fntMiddleSize,
    this.backgroundColor = Constants.bgPrimary,
    this.textColor = Constants.textPrimaryDark,
    this.borderSide,
    this.newStyle = false,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textButton = TextButton(
      style: TextButton.styleFrom(
        //primary: Colors.white,
        backgroundColor: backgroundColor,
        shadowColor: Colors.grey,
        elevation: 3,
        disabledForegroundColor: Colors.grey,
        side: borderSide ?? const BorderSide(
          width: 0.5,
          color: Colors.grey,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey.withOpacity(0.3),
            width: 0.1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
      ),
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: hSpace, vertical: kIsWeb ? vSpace + 3: vSpace),
        child: Text(
          text,
          style: TextStyle(
            fontSize: textSize,
            color: textColor,
          ),
        ),
      ),
    );

    if (stretch) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Expanded(child: textButton)],
      );
    } else {
      return textButton;
    }
  }
}