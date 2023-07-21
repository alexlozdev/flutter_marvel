import 'log_utility.dart';

/// Json parsing utility
class JsonUtility {

  /// get string value from map
  static String getStringValueFromMap(Map<String, dynamic> map, String key, String defaultValue) {
    if (key.isEmpty) {
      return defaultValue;
    }

    try {
      dynamic value = map[key];

      if (value != null) {
        String result = value as String;
        return result;
      }
    } catch (exception, stackTrace) {
      LogUtility.print(exception, stackTrace: stackTrace);
    }

    return defaultValue;
  }

  /// get int value from map
  static int getIntValueFromMap(Map<String, dynamic> map, String key, int defaultValue) {
    if (key.isEmpty) {
      return defaultValue;
    }

    try {
      dynamic value = map[key];

      if (value != null) {
        int result = (value as num).toInt();
        return result;
      }
    } catch (exception, stackTrace) {
      LogUtility.print(exception, stackTrace: stackTrace);
    }

    return defaultValue;
  }

  /// get double value from map
  static double getDoubleValueFromMap(Map<String, dynamic> map, String key, double defaultValue) {
    if (key.isEmpty) {
      return defaultValue;
    }

    try {
      dynamic value = map[key];

      if (value != null) {
        double result = (value as num).toDouble();
        return result;
      }
    } catch (exception, stackTrace) {
      LogUtility.print(exception, stackTrace: stackTrace);
    }

    return defaultValue;
  }

  /// get bool value from map
  static bool getBoolValueFromMap(Map<String, dynamic> map, String key, bool defaultValue) {
    if (key.isEmpty) {
      return defaultValue;
    }

    try {
      dynamic value = map[key];

      if (value != null) {
        bool result = value as bool;
        return result;
      }
    } catch (exception, stackTrace) {
      LogUtility.print(exception, stackTrace: stackTrace);
    }

    return defaultValue;
  }

  /// get string list from map
  static List<String> getStringListValueFromMap(Map<String, dynamic> map, String key, List<String> defaultValue) {
    if (key.isEmpty) {
      return defaultValue;
    }

    try {
      List<dynamic>? values = map[key];
      List<String> strValues = [];

      if (values != null) {
        for (var element in values) {
          strValues.add(element.toString());
        }

        return strValues;
      }
    } catch (exception, stackTrace) {
      LogUtility.print(exception, stackTrace: stackTrace);
    }

    return defaultValue;
  }

  /// get dynamic list from map
  static List<dynamic> getDynamicListValueFromMap(Map<String, dynamic> map, String key, List<dynamic> defaultValue) {
    if (key.isEmpty) {
      return defaultValue;
    }

    try {
      List<dynamic>? values = map[key];

      if (values != null) {
        return values;
      }
    } catch (exception, stackTrace) {
      LogUtility.print(exception, stackTrace: stackTrace);
    }

    return defaultValue;
  }

  /// get Map<String, dynamic> from map
  static Map<String, dynamic> getMapValueFromMap(Map<String, dynamic> map, String key, Map<String, dynamic> defaultValue) {
    if (key.isEmpty) {
      return defaultValue;
    }

    try {
      Map<String, dynamic>? value = map[key];
      if (value != null) {
        return value;
      }
    } catch (exception, stackTrace) {
      LogUtility.print(exception, stackTrace: stackTrace);
    }

    return defaultValue;
  }
}