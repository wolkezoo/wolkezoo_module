import 'dart:convert';

import 'package:loggy/loggy.dart';

/// extension log to object function
extension LogExtension on Object {
  void get debug => logDebug(this);
  void get info => logInfo(this);
  void get error => logError(this);
  void get warning => logWarning(this);

  void get jsonDebug => logDebug(jsonEncode(this));
  void get jsonInfo => logInfo(jsonEncode(this));
  void get jsonError => logError(jsonEncode(this));
  void get jsonWarning => logWarning(jsonEncode(this));
}