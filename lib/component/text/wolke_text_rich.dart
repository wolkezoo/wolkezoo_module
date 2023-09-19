import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget textRich({
  required List<WolkeTextRich> richs,
  TextStyle? richStyle,
}) {
  return Text.rich(
    TextSpan(
      children: richs
          .map(
            (text) => TextSpan(
                text: text.text,
                style: text.style,
                recognizer: TapGestureRecognizer()..onTap = text.onTap),
          )
          .toList(),
    ),
    style: richStyle,
  );
}

// 组件配置
class WolkeTextRich {
  String? _text;
  TextStyle? _style;
  Function()? _onTap;

  WolkeTextRich({
    required String text,
    TextStyle? style,
    Function()? onTap,
  }) {
    _text = text;
    _style = style;
    _onTap = onTap;
  }

  String get text => _text ?? "";

  set text(String value) {
    _text = value;
  }

  TextStyle get style => _style ?? const TextStyle();

  set style(TextStyle value) {
    _style = value;
  }

  Function() get onTap => _onTap ?? () {};

  set onTap(Function() value) {
    _onTap = value;
  }
}
