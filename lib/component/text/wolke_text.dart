import 'package:ellipsized_text/ellipsized_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Ellipsis types
enum EllipsisTextType {
  start,
  middle,
  end;
}

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

Widget textSplit({
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
  double? height,
  EllipsisTextType? ellipsisType,
  String? ellipsis,
  TextDecoration? decoration,
}) {
  return EllipsizedText(
    text,
    ellipsis: ellipsis ?? "...",
    type: EllipsisType.fromString(ellipsisType != null ? ellipsisType.name : EllipsisType.end.name),
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
      height: height,
      decoration: decoration,
    ),
  );
}

// text widget
Widget text({
  required String text,
  Key? key,
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
  double? height,
  int? maxLines,
  TextDecoration? decoration,
}) {
  return Text(
    text,
    softWrap: softWrap,
    overflow: overflow,
    textAlign: textAlign,
    key: key,
    maxLines: maxLines,
    textScaleFactor: 0.75,
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
      height: height,
      decoration: decoration,
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
  double? height,
  TextDecoration? decoration,
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
      height: height,
      decoration: decoration,
  );
}
