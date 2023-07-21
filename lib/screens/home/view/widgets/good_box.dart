

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../const/constants.dart';
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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 0.5), // changes position of shadow
          ),

        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
        child: Container(
          //margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(
                color: Constants.fgPrimary,
                width: 7,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // good name
                      CommonLabel(good.name,
                        fontSize: Constants.fntBigSize,
                        color: Constants.textPrimaryDark,
                      ),
                      CommonLabel(good.description),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(CupertinoIcons.arrow_right,
                      color: Constants.textPrimaryDark,
                    ),
                    CommonImageView(
                      imageUrl: good.image
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );

  }

}