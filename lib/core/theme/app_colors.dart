import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xff00C5B6);
}

class StyleThemes {
  static const title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const body = TextStyle(fontSize: 14);
  static const button = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static const subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
}

extension StyleThemesExtension on TextStyle {
  TextStyle withColor(Color? color) => copyWith(color: color);
}
