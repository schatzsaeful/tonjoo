import 'package:flutter/material.dart';

import 'common_loading_dialog.dart';

class CommonDialog {

  static Future showLoadingDialog(
      BuildContext context,
      ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return const CommonLoadingDialog();
      },
    );
  }
}