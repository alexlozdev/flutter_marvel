

import 'package:flutter/material.dart';
import 'package:marvel/widgets/common/inkwell/common_inkwell.dart';

import '../../../../model/good.dart';
import '../../../../widgets/common/image/common_image_view.dart';
import '../../../../widgets/common/text/common_label.dart';

class GoodBox extends StatelessWidget {

  /// good info
  final Good good;

  final Function()? onPressed;

  /// widget for displaying good
  const GoodBox({
    Key? key,
    required this.good,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonInkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonImageView(
            imageUrl: good.thumbnail.getImagePath(),
            radius: 10,
          ),
          CommonLabel(
            good.name,
            color: Colors.grey,
          ),
        ],
      ),
    );

  }

}