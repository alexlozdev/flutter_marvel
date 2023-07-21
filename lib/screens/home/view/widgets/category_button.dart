

import 'package:flutter/material.dart';

import '../../../../widgets/common/button/common_check_button.dart';


class CategoryButton extends StatelessWidget {

  final String text;

  final bool selected;

  final Function()? onPressed;

  const CategoryButton({
    Key? key,
    required this.text,
    required this.selected,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCheckButton(
      text: text,
      selected: selected,
      onPressed: onPressed,
    );

  }

}