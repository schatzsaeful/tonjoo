import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tonjoo/utils/nullable_extension.dart';

import '../common_widgets.dart';

class CommonNetworkImage extends StatelessWidget {
  const CommonNetworkImage({
    Key? key,
    required this.url,
    required this.width,
    required this.height,
    this.boxFit = BoxFit.cover,
    this.isCircle = false,
  }) : super(key: key);

  final String? url;
  final double width;
  final double height;
  final BoxFit boxFit;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url.orEmpty(),
      width: width,
      height: height,
      fit: boxFit,
      placeholder: (context, url) => CommonWidget.circularIndicator,
      errorWidget: _retryImage,
      imageBuilder: isCircle
          ? (context, provider) {
        return CircleAvatar(
          backgroundImage: provider,
        );
      }
          : null,
    );
  }

  Widget _retryImage(BuildContext context, String url, dynamic error) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, url) => CommonWidget.circularIndicator,
      errorWidget: (context, url, error) => Text('Error $error'),
      imageBuilder: isCircle
          ? (context, provider) {
        return CircleAvatar(
          backgroundImage: provider,
        );
      }
          : null,
    );
  }
}