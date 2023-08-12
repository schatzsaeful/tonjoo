import 'package:lottie/lottie.dart';

class CommonAnimation {
  static const _animPath = 'assets/animations';

  static LottieBuilder animLoadingState = defaultSizeAssets('anim_loading.json');

  static LottieBuilder defaultSizeAssets(String filename, {
    double width = 80,
    double height = 80,
    bool repeat = true
  })  {
    return Lottie.asset(
        getAssetPath(filename),
        width: width,
        height: height,
        repeat: repeat
    );
  }

  static String getAssetPath(String filename) {
    return "$_animPath/$filename";
  }
}
