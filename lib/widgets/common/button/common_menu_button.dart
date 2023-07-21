import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../const/constants.dart';

class CommonMenuButton extends StatelessWidget {

  /// child width instead of text
  final Widget? child;

  /// button text
  final String text;

  /// text size
  final double textSize;

  /// text color
  final Color textColor;

  /// stretch widget
  final bool stretch;

  /// callback when pressed
  final Function()? onPressed;

  const CommonMenuButton({
    Key? key,
    this.child,
    this.text = '',
    this.textSize = Constants.fntMiddleSize,
    this.textColor = Constants.fgPrimary,
    this.stretch = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const vSpace = Constants.widgetPaddingV;
    const hSpace = Constants.widgetPaddingV;

    final textButton = TextButton(
      style: TextButton.styleFrom(
        //backgroundColor: Constants.primaryBgColor,
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
        child: child != null ? child! : Text(
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