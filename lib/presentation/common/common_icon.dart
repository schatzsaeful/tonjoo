import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'common_color.dart';

class CommonIcon {
  static const _iconPath = 'assets/icons';

  static SvgPicture home = defaultSizeAssets(
      'ic_home.svg',
      color: CommonColor.grey
  );
  static SvgPicture activeHome = defaultSizeAssets(
      'ic_home_active.svg',
      color: CommonColor.orange
  );
  static SvgPicture add = defaultSizeAssets(
      'ic_add.svg',
      color: CommonColor.grey
  );
  static SvgPicture activeAdd = defaultSizeAssets(
      'ic_add.svg',
      color: CommonColor.orange
  );
  static SvgPicture logout = defaultSizeAssets(
      'ic_logout.svg',
      color: CommonColor.grey
  );
  static SvgPicture activeLogout = defaultSizeAssets(
      'ic_logout.svg',
      color: CommonColor.orange
  );

  static SvgPicture defaultSizeAssets(
      String filename, {
        Color? color,
        double width = 24,
        double height = 24,
        BoxFit fit = BoxFit.contain,
      }) {
    return SvgPicture.asset(
      getAssetPath(filename),
      color: color,
      width: width,
      height: height,
      fit: fit,
    );
  }

  static SvgPicture originalSizeAssets(
      String filename, {
        Color? color,
      }) {
    return SvgPicture.asset(
      getAssetPath(filename),
      color: color,
    );
  }

  static String getAssetPath(String filename) {
    return "$_iconPath/$filename";
  }
}
