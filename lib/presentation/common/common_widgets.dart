import 'package:flutter/material.dart';
import 'common_color.dart';

class CommonWidget {
  /// Vertical Divider
  static const divider = VerticalDivider(
    color: CommonColor.softGrey,
    thickness: 1,
    indent: 18,
    endIndent: 18,
  );

  /// Horizontal Rounded Divider
  static Container horizontalRoundedDivider = Container(
      width: double.infinity,
      height: 0.4,
      color: CommonColor.softGrey);

  static Container horizontalBigDivider = Container(
      width: double.infinity,
      height: 1,
      color: CommonColor.white);

  /// Horizontal Divider
  static const spacer12 = SizedBox(height: 12, width: 12,);

  static const spacer8 = SizedBox(height: 8, width: 8,);

  static const spacer4 = SizedBox(height: 4, width: 4);

  static const spacer2 = SizedBox(height: 2, width: 2);

  /// Circular Indicator
  static const circularIndicator = _CommonCircularProgressIndicator();
}

class _CommonCircularProgressIndicator extends StatelessWidget {
  const _CommonCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 36.0),
      alignment: Alignment.center,
      child: const CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
