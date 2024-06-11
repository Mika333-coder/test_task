import 'dart:math';

import 'package:flutter/material.dart';

class ColorGenerator {
  static Color randomColor({double alpha = 1.0}) {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      alpha,
    );
  }
}
