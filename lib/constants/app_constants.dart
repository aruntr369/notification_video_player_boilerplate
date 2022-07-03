import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class Prefs {
  static const String isLoggedIn = "isLoggedIn";
  static const String user = "user";
}

abstract class FontFamily {
  static const String barlow = "Barlow";
}

enum ToastType {
  success(0),
  error(1);

  const ToastType(this.value);

  final int value;

  static ToastType fromValue(int? value) {
    switch (value) {
      case 0:
        return success;
      case 1:
        return error;
      default:
        return error;
    }
  }

  Color get toColor {
    if (this == success) {
      return Palette.primary;
    }
    return Colors.red;
  }
}
