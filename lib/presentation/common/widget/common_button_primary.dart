import 'package:flutter/material.dart';

import '../common_color.dart';
import '../common_shape.dart';

class CommonButtonPrimary extends StatelessWidget {
  const CommonButtonPrimary({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isEnable = true,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 22,
    this.paddingVertical = 16,
    this.color = CommonColor.orange
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final bool? isEnable;
  final FontWeight fontWeight;
  final double fontSize;
  final double paddingVertical;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnable == true ? color : CommonColor.grey,
        shape: CommonShape.miniRoundedShape,
        padding: EdgeInsets.symmetric(vertical: paddingVertical),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontWeight: fontWeight,
            fontSize: fontSize
        ),
      ),
    );
  }
}
