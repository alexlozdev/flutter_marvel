import 'package:flutter/material.dart';

import '../../../const/constants.dart';
import '../inkwell/common_inkwell.dart';


class CommonTextFieldSearch extends StatelessWidget {

  /// selected item value
  final String? selValue;

  /// items for selecting
  final List<String> items;

  /// callback when changing text. need refresh state if [bool] is true.
  final Function(String, bool)? onChanged;

  /// callback when pressed search
  final Function()? onSearch;

  /// keyboard type
  final TextInputType keyboardType;

  /// border color
  final Color borderColor;

  /// text color
  final Color textColor;

  /// text size
  final double textSize;

  /// min lines
  final int? minLines;

  /// max lines
  final int? maxLines;

  /// enabled
  final bool? enabled;

  /// filled text field
  final bool filled;

  /// fill color
  final Color fillColor;

  const CommonTextFieldSearch({
    Key? key,
    this.selValue,
    this.items = const [],
    this.onChanged,
    this.onSearch,
    this.keyboardType = TextInputType.text,
    this.borderColor =  Constants.whiteDark,
    this.textColor = Constants.textPrimaryDark,
    this.textSize = Constants.fntNormalSize,
    this.minLines,
    this.maxLines,
    this.enabled,
    this.filled = true,
    this.fillColor = Constants.whiteDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const borderWidth = 1.0;
    const borderRadius = Constants.editRadius;
    const double vPadding = 11;
    const double hPadding = Constants.textContainerPaddingH;

    return TextField(
      controller: TextEditingController(text: selValue),
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value, false);
        }
      },
      keyboardType: keyboardType,
      enabled: enabled,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(borderRadius))
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(borderRadius))
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(borderRadius))
        ),
        filled: true,
        fillColor: fillColor,
        hintText: 'What is name?',
        hintStyle: const TextStyle(
          color: Constants.textPrimaryDark,
        ),
        prefixIcon: CommonInkWell(
          onTap: onSearch,
          child: const Icon(Icons.search,
            color: Constants.textPrimaryDark,
          ),
        ),
      ),
      style: TextStyle(
        color: textColor,
        fontSize: textSize,
      ),
      maxLines: maxLines,
      minLines: minLines,
    );
  }

}