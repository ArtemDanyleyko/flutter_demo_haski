import 'package:flutter/material.dart';

class NavigationTab {
  NavigationTab(
      {required this.page,
      required this.icon,
      required this.name,
      this.isCurrent = false});

  Widget page;
  String icon;
  String name;
  bool isCurrent;
}
