import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../const/constants.dart';
import '../../../../widgets/common/image/common_image_view.dart';
import '../../../../widgets/common/text/common_auto_label.dart';
import '../../model/portfolio.dart';

class PortfolioSlider extends StatefulWidget {
  /// portfolio items
  final List<Portfolio> items;

  /// height
  final double height;

  /// portfolio slider
  const PortfolioSlider({
    Key? key,
    required this.items,
    this.height = 135,
  }) : super(key: key);

  @override
  State<PortfolioSlider> createState() => _PortfolioSliderState();
}

class _PortfolioSliderState extends State<PortfolioSlider> {
  /// slider index
  int _sliderIndex = 0;

  /// slider controller
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
            autoPlay: true,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _sliderIndex = index;
              });
            }
          ),
          carouselController: _controller,
          items: widget.items.map((entry) {

            return Stack(
              children: [
                // background image
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: CommonImageView(
                    imageUrl: entry.image,
                    radius: 10,
                    fit: BoxFit.cover,
                  ),
                ),
                // text
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonAutoLabel(
                        entry.comment1,
                        color: Colors.white,
                        fontSize: 30,
                      ),
                      CommonAutoLabel(
                        entry.comment2,
                        fontSize: 10,
                        color: Colors.white70,
                        maxLines: 1,
                      ),

                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
        CarouselIndicator(
          count: widget.items.length,
          index: _sliderIndex,
          color: Constants.greyMiddle,
          activeColor: Constants.fgPrimary,
          height: 3,
        ),
      ],
    );
  }

}

