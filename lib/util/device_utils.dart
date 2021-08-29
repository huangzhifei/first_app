import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Device {

  static bool get isWeb => kIsWeb;
  static bool get isAndroid => (!isWeb && Platform.isAndroid);
  static bool get isIOS => (!isWeb && Platform.isIOS);
  static bool get isMacOS => (!isWeb && Platform.isMacOS);

  static bool get isMobile => (isAndroid || isIOS);

}