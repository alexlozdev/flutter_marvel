import 'package:flutter/material.dart';
import 'package:marvel/screens/start/model/page_item.dart';
import 'package:marvel/widgets/common/inkwell/common_inkwell.dart';
import 'package:marvel/widgets/common/text/common_label.dart';

import '../../../const/constants.dart';

class StartDrawer extends StatelessWidget {
  /// page items
  final List<PageItem> pageItems;

  /// selected page item
  final PageItem? selPageItem;

  /// callback when changed page item.
  final Function(PageItem)? onChanged;

  /// home screen drawer
  const StartDrawer({
    Key? key,
    required this.pageItems,
    this.selPageItem,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Drawer(
      width: MediaQuery.of(context).size.width,
      backgroundColor: Constants.fgPrimary,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: Column(
          children: [
            // header
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Center(
                child: CommonLabel('MARVEL',
                  color: Colors.blueAccent,
                  fontSize: Constants.fntLargeSize,
                ),
              ),
            ),
            // body with screen constraints
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: pageItems.map((entry) {
                    return CommonInkWell(
                      vSpace: 15,
                      onTap: () {
                        Navigator.pop(context);

                        if (onChanged != null) {
                          onChanged!(entry);
                        }
                      },
                      child: CommonLabel(entry.name,
                        color: entry == selPageItem ? Colors.white : Colors.grey,
                        fontSize: Constants.fntMiddleSize,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}