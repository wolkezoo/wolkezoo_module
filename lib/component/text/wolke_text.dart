import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// font weight common enum
enum FontWeightEnum { bold, semiBold, medium, light, normal }

// get font weight by enum
FontWeight getFontWeight(FontWeightEnum enum0) {
  FontWeight fontWeight;
  switch (enum0) {
    case FontWeightEnum.bold:
      fontWeight = FontWeight.w700;
      break;
    case FontWeightEnum.semiBold:
      fontWeight = FontWeight.w600;
      break;
    case FontWeightEnum.medium:
      fontWeight = FontWeight.w500;
      break;
    case FontWeightEnum.light:
      fontWeight = FontWeight.w300;
      break;
    default:
      fontWeight = FontWeight.w400;
      break;
  }
  return fontWeight;
}

// text widget
Widget text({
  required String text,
  double? size,
  double? wordSpacing,
  double? letterSpacing,
  Color? color,
  String? fontFamily,
  FontWeightEnum? weight,
  FontWeight? fontWeight,
  bool? softWrap,
  TextOverflow? overflow,
  TextAlign? textAlign,
  TextBaseline? textBaseline,
}) {
  return Text(
    text,
    softWrap: softWrap,
    overflow: overflow,
    textAlign: textAlign,
    style: textStyle(
      size: size,
      wordSpacing: wordSpacing,
      letterSpacing: letterSpacing,
      color: color,
      fontFamily: fontFamily,
      weight: weight,
      fontWeight: fontWeight,
      softWrap: softWrap,
      overflow: overflow,
      textBaseline: textBaseline,
    ),
  );
}

// text style
TextStyle textStyle({
  double? size,
  double? wordSpacing,
  double? letterSpacing,
  Color? color,
  String? fontFamily,
  FontWeightEnum? weight,
  FontWeight? fontWeight,
  bool? softWrap,
  TextOverflow? overflow,
  TextBaseline? textBaseline,
}) {
  assert(() {
    if (weight != null && fontWeight != null) {
      throw FlutterError(
        'weight and fontWeight can only be passed between the two, and cannot exist at the same time',
      );
    }
    return true;
  }());

  // get common font weight
  if (weight != null && fontWeight == null) {
    fontWeight = getFontWeight(weight);
  }

  return TextStyle(
    fontSize: size,
    color: color,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    wordSpacing: wordSpacing,
    letterSpacing: letterSpacing,
    textBaseline: textBaseline,
  );
}


