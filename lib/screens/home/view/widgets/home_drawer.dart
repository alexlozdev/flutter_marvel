import 'package:flutter/material.dart';
import 'package:marvel/widgets/common/inkwell/common_inkwell.dart';
import 'package:marvel/widgets/common/text/common_label.dart';

import '../../../../const/constants.dart';
import '../../../../model/category.dart';

class HomeDrawer extends StatelessWidget {
  /// page items
  final List<Category> items;

  /// selected page item
  final Category? selItem;

  /// callback when changed page item.
  final Function(Category)? onChanged;

  /// home screen drawer
  const HomeDrawer({
    Key? key,
    required this.items,
    this.selItem,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Drawer(
      width: MediaQuery.of(context).size.width,
      //backgroundColor: Constants.fgPrimary,
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
                  color: Colors.red,
                  fontSize: Constants.fntLargeSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            // body with screen constraints
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: items.map((entry) {
                    return CommonInkWell(
                      vSpace: 15,
                      onTap: () {
                        Navigator.pop(context);

                        if (onChanged != null) {
                          onChanged!(entry);
                        }
                      },
                      child: CommonLabel(entry.label,
                        color: entry == selItem ? Colors.white : Colors.grey,
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