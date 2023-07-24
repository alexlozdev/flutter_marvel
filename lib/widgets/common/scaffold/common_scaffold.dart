
import 'package:flutter/material.dart';

import '../progress/common_modal_hud.dart';

class CommonScaffold extends StatelessWidget {
  /// app bar
  final PreferredSizeWidget? appBar;

  /// drawer
  final Widget? drawer;

  /// main body
  final Widget body;

  /// advertisement
  final Widget? ad;

  final Widget? bottom;

  final bool? loading;

  /// common screen widget
  const CommonScaffold({
    Key? key,
    this.appBar,
    this.drawer,
    required this.body,
    this.ad,
    this.bottom,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //double appBarHeight = 0;
    double screenHeight = MediaQuery.of(context).size.height;
    if (appBar != null) {
      double appBarHeight = AppBar().preferredSize.height;
      screenHeight = screenHeight - appBarHeight - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
    }

    return CommonModalHud(
      loading: loading,
      size: 100,
      child: Scaffold(
        appBar: appBar,
        drawer: drawer,
        //backgroundColor: Constants.bgPrimary,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: screenHeight,
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            body,
                            if (ad != null) ...[
                              Positioned(
                                left: 0,
                                bottom: 0,
                                right: 0,
                                child: ad!,
                              ),
                            ],
                          ],
                        ),
                      ),
                      if (bottom != null) ...[
                        bottom!,
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

}