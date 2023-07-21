import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../const/constants.dart';

class CommonImageView extends StatelessWidget {

  /// image url
  final String imageUrl;

  /// image buffer
  final Uint8List? imageBytes;

  /// image fit
  final BoxFit? fit;

  /// error widget
  final Widget errorWidget;

  /// display icon when loading image
  final bool placeholder;

  /// image border radius
  final double? radius;

  /// image view to display image url (network, local, web) and image buffer.
  /// support rounded image
  const CommonImageView({
    Key? key,
    this.imageUrl = '',
    this.imageBytes,
    this.fit,
    this.errorWidget = const Icon(Icons.error),
    this.placeholder = true,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget? child;

    if (imageBytes != null || imageUrl.isNotEmpty) {
      try {
        if (imageUrl.startsWith(Constants.urlHttp)) {
          // network image url
          child = CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: placeholder ? (context, url) => const Center(
              child: SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 1.0,
                  color: Constants.fgPrimary,
                ),
              ),
            ) : null,
            errorWidget: (context, url, error) => errorWidget,
            fit: fit,
          );
        } else if (imageUrl.startsWith('assets')) {
          child = Image.asset(imageUrl,
            fit: fit,
          );
        } else if (imageBytes != null) {
          child = Image.memory(imageBytes!,
            fit: fit,
          );
        } else {
          // local temp image url
          child = Image.file(File(imageUrl),
            fit: fit,
          );
        }
      } catch (exception) {
        child = errorWidget;
      }
    }

    return getClipRect(
      child: child ?? errorWidget,
    );
  }

  Widget getClipRect({
    required Widget child,
  }) {
    if (radius == null) {
      return child;
    }

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius!)),
      child: child,
    );
  }
}