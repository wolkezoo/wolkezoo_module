
import 'package:flutter/material.dart';

extension DoubleExtension on num {
  EdgeInsets get left => EdgeInsets.only(left: toDouble());

  EdgeInsets get right => EdgeInsets.only(right: toDouble());

  EdgeInsets get top => EdgeInsets.only(top: toDouble());

  EdgeInsets get bottom => EdgeInsets.only(bottom: toDouble());

  EdgeInsets get about => EdgeInsets.only(left: toDouble(), right: toDouble());

  EdgeInsets get upDown => EdgeInsets.only(top: toDouble(), bottom: toDouble());

  EdgeInsets get all => EdgeInsets.all(toDouble());

  BorderRadius get radiusCircular =>
      BorderRadius.all(Radius.circular(toDouble()));
}
