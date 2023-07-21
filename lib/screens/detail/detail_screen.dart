import 'package:flutter/material.dart';
import 'package:marvel/widgets/common/app_bar/common_app_bar.dart';
import 'package:marvel/widgets/common/scaffold/common_scaffold.dart';

import '../../model/good.dart';
import '../../widgets/common/image/common_image_view.dart';

class DetailScreen extends StatelessWidget {
  final Good good;

  const DetailScreen({
    super.key,
    required this.good,
  });

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        title: good.name,
        iconData: Icons.arrow_back,
        onLeadingPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CommonImageView(
              imageUrl: good.thumbnail.getImagePath(),
            ),
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        good.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        good.description,
                        style: const TextStyle(fontSize: 14),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '',
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }


}