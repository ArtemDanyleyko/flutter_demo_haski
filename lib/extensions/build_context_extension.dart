import 'dart:io';

import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double getScreenHeight() {
    return MediaQuery.of(this).size.height;
  }

  double getScreenWidth() {
    return MediaQuery.of(this).size.width;
  }

  double getStatusBarHeight() {
    return MediaQuery.of(this).viewPadding.top;
  }

  double getBottomSafeArea() {
    var additionalSpace = Platform.isAndroid ? 20 : 5;
    return MediaQuery.of(this).viewPadding.bottom + additionalSpace;
  }

  double getKeyboardHeight() {
    return EdgeInsets.fromViewPadding(View.of(this).viewInsets, View.of(this).devicePixelRatio)
        .bottom;
  }

  double getBottomNavBarHeight() {
    return MediaQuery.of(this).padding.bottom;
  }
}
