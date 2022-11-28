import 'package:flutter/services.dart';

abstract class NativeChannel {
  final channel = const MethodChannel("native-plugin");
}
