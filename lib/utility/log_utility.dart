import 'package:logger/logger.dart';

class LogUtility {
  static final logger = Logger();

  /// print console
  static print(dynamic exception, {dynamic error, StackTrace? stackTrace}) {
    logger.d(exception, error, stackTrace);
  }
}