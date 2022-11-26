import 'package:flutter/material.dart';

enum PlatformType {
  web,
  ios,
  android,
  mac;

  String get title {
    switch (this) {
      case PlatformType.web:
        return 'Web';
      case PlatformType.ios:
        return 'iOS';
      case PlatformType.android:
        return 'Android';
      case PlatformType.mac:
        return 'Mac';
    }
  }

  List<IconData> get icon {
    switch (this) {
      case PlatformType.web:
        return [Icons.web];
      case PlatformType.ios:
        return [Icons.apple, Icons.phone_iphone];
      case PlatformType.android:
        return [Icons.android];
      case PlatformType.mac:
        return [Icons.apple, Icons.computer_sharp];
    }
  }

  bool get hasSingleIcon {
    return icon.length == 1;
  }
}
