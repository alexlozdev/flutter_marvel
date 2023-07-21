import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../const/constants.dart';
import 'common_image_view.dart';

class CommonCircleAvatar extends StatelessWidget {
  /// circle size
  final double size;

  /// profile image path
  final String profilePath;

  /// profile image buffer
  final Uint8List? profileBuf;

  /// default image for displaying on error
  final Widget? defaultImg;

  /// callback when pressed widget
  final Function()? onTap;

  const CommonCircleAvatar({
    Key? key,
    this.size = 40,
    required this.profilePath,
    this.profileBuf,
    this.defaultImg,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(size*0.5)),
        onTap: onTap,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: Constants.fgPrimary,
              width: 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: Constants.greyDark,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.1,
                spreadRadius: 0.1,
              ),
              BoxShadow(
                color: Constants.greyDark,
                offset: Offset(-1.0, -1.0),
                blurRadius: 2.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(size * 0.5),
            child: CommonImageView(
              imageUrl: profilePath,
              imageBytes: profileBuf,
              errorWidget: defaultImg == null ? Image.asset(Constants.assetImageMan) : defaultImg!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}