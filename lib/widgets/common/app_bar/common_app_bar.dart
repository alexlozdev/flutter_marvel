import 'package:flutter/material.dart';

import '../../../const/constants.dart';
import '../inkwell/common_inkwell.dart';
import '../text/common_label.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// icon of app bar
  final IconData? iconData;

  /// app bar title
  final String title;

  /// callback when pressed app bar icon
  final Function()? onLeadingPressed;

  /// app bar
  const CommonAppBar({
    Key? key,
    this.iconData,
    required this.title,
    required this.onLeadingPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: CommonLabel(title,
        color: Constants.white,
        fontSize: Constants.fntMiddleSize,
      ),
      //backgroundColor: Constants.fgPrimary,
      shadowColor: Colors.transparent,
      leading: iconData != null ? Builder(
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonInkWell(
                onTap: onLeadingPressed,
                child: Icon(iconData,),
              ),
            ],
          );
        },
      ) : null,
      actions: const [],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}


