import 'package:flutter/material.dart';

import '../common_animation.dart';

class CommonLoadingDialog extends StatelessWidget {
  const CommonLoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CommonAnimation.animLoadingState,
    );
  }
}
