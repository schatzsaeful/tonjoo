import 'package:flutter/material.dart';
import 'common_color.dart';

class CommonDecoration {
  static var smallRoundedWhite = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
  );

  static var smallRoundedSoftBlue = BoxDecoration(
    color: CommonColor.purple10,
    borderRadius: BorderRadius.circular(8),
  );

  static var boxWhiteWithSoftGray = const BoxDecoration(
    color: Colors.white,
    border: Border(
      top: BorderSide(color: CommonColor.whiteGrey, width: 0.5),
      bottom: BorderSide(color: CommonColor.whiteGrey, width: 0.5),
      right: BorderSide(color: CommonColor.whiteGrey, width: 0.5),
    ),
  );

  static var verySmallLeftRoundedWhite = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: CommonColor.softGrey),
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(8),
      topLeft: Radius.circular(8),
    ),
  );

  static var mediumRoundedWhiteWithStrokeBlackTransparent = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: CommonColor.black.withOpacity(0.2)),
  );

  static var smallRoundedGrey = BoxDecoration(
    color: CommonColor.whiteGrey,
    borderRadius: BorderRadius.circular(8),
  );

  static var bigRoundedWhiteWithStrokeGray = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(40),
    border: Border.all(color: CommonColor.grey),
  );

  static var verySmallRoundedWhiteWithStrokeGray = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(4),
    border: Border.all(color: CommonColor.softGrey),
  );

  static var bigRoundedBlack = BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(40),
    border: Border.all(color: CommonColor.black),
  );

  static var bigRoundedOrange = BoxDecoration(
    color: CommonColor.orange.withOpacity(0.5),
    borderRadius: BorderRadius.circular(40),
  );

  static var bigRoundedPink = BoxDecoration(
    color: CommonColor.softPink,
    borderRadius: BorderRadius.circular(40),
  );

  static var mediumRoundedWhiteWithStrokeGray = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: CommonColor.grey),
  );

  static var mediumRoundedOrange = BoxDecoration(
    color: CommonColor.orange,
    borderRadius: BorderRadius.circular(16),
  );

  static var bigRoundedLeftTopGray = const BoxDecoration(
    color: CommonColor.softGrey,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(40),
    ),
  );

  static var bigRoundedRightTopGray = const BoxDecoration(
    color: CommonColor.softGrey,
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(40),
    ),
  );

  static var bigRoundedWhite = const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(40),
      topLeft: Radius.circular(40),
    ),
  );

  static var circleWhite = const BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle,
  );

  static var smallRoundedWhiteStrokeOrange = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: CommonColor.orange),
  );

  static var verySmallRoundedDarkPurple = BoxDecoration(
    color: CommonColor.purple,
    borderRadius: BorderRadius.circular(12),
  );

  static var smallRoundedWhiteWithGreyBorder = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: CommonColor.aqua),
  );

  static var verySmallRoundedWhiteWithGreyBorder = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(4),
    border: Border.all(color: CommonColor.aqua),
  );

  static var grayWithBlackBorder = BoxDecoration(
    color: Colors.transparent,
    border: Border.all(color: CommonColor.darkGreyPdf, width: 2),
  );

  static var purpleWithBlackBorder = BoxDecoration(
    color: Colors.transparent,
    border: Border.all(color: CommonColor.purple30, width: 4),
  );

  static var verySmallRoundedGreyWithGreyBorder = BoxDecoration(
    color: CommonColor.whiteGrey,
    borderRadius: BorderRadius.circular(4),
    border: Border.all(color: CommonColor.aqua),
  );

  static var smallRoundedDarkBlueWithDarkBlueBorder = BoxDecoration(
    color: CommonColor.darkBlue,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: CommonColor.darkBlue),
  );

  static var smallLeftRoundedWhiteWithGreyBorder = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(8),
      bottomLeft: Radius.circular(8),
    ),
    border: Border.all(color: CommonColor.aqua),
  );

  static var smallRightRoundedWhiteWithGreyBorder = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.only(
      topRight: Radius.circular(8),
      bottomRight: Radius.circular(8),
    ),
    border: Border.all(color: CommonColor.aqua),
  );

  static var smallLeftRoundedTransparentBlueWithGreyBorder = BoxDecoration(
    color: CommonColor.blue.withOpacity(0.1),
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(8),
      bottomLeft: Radius.circular(8),
    ),
    border: Border.all(color: CommonColor.aqua),
  );

  static var bigTopRoundedWhite = const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(40),
      topLeft: Radius.circular(40),
    ),
  );

  static var mediumRoundedWhite = const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(16))
  );

  static var smallTopRoundedWhite = const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(16),
      topLeft: Radius.circular(16),
    ),
  );

  static var circleGreyWithStrokePink = BoxDecoration(
    color: CommonColor.softerGrey,
    shape: BoxShape.circle,
    border: Border.all(color: CommonColor.pink),
  );

  static var circleGray = const BoxDecoration(
    color: CommonColor.softerGrey,
    shape: BoxShape.circle,
  );

  static var circleDarkPurple = const BoxDecoration(
    color: CommonColor.purple,
    shape: BoxShape.circle,
  );

  static var circleRed = const BoxDecoration(
    color: CommonColor.red,
    shape: BoxShape.circle,
  );

  static var circleGrey = const BoxDecoration(
      color: CommonColor.softerGrey,
      shape: BoxShape.circle
  );

  static var circleSoftPurple = const BoxDecoration(
      color: CommonColor.purple80,
      shape: BoxShape.circle
  );
}
