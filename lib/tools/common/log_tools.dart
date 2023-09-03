import 'package:loggy/loggy.dart';

/// log tools
class LogTools {
  // init the log factory in app function
  static void register() {
    Loggy.initLoggy(
        logOptions: const LogOptions(
          LogLevel.all,
          includeCallerInfo: true, // <-- Add this
        ),
        logPrinter: const PrettyPrinter(),
    );
  }
}