import 'package:logger/logger.dart';

/*
    * Logger Level ->

    * logger.v("Verbose log");
    * logger.d("Debug log");
    * logger.i("Info log");
    * logger.w("Warning log");
    * logger.e("Error log");
    * logger.wtf("What a Terrible Failure log");
*/

/// Basic logger with [PrettyPrinter] as default.
final logger = Logger(printer: PrettyPrinter());

/// Basic logger with [PrettyPrinter] with no stack trace.
final loggerNoStack = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 0,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);

/// Custom method for logging.
/// Usage:
///  * customLogger(params).v(message, error, stackTrace);
///
/// Level : [Level.verbose], [Level.debug], [Level.info], [Level.warning], [Level.error], [Level.wtf]
Logger Function({int? errorMethodCount, int? lineLength, int? methodCount})
    customLogger = ({
  int? methodCount = 0,
  int? errorMethodCount = 0,
  int? lineLength = 120,
  bool? time = false,
}) =>
        Logger(
            printer: PrettyPrinter(
          methodCount: methodCount!,
          errorMethodCount: errorMethodCount!,
          lineLength: lineLength!,
          colors: true,
          printEmojis: true,
          printTime: time!,
        ));
