import 'package:flutter/material.dart';
import 'package:haski/models/news/news.dart';
import 'package:haski/models/shifts/shift.dart';
import 'package:haski/models/shifts/shift_group.dart';

abstract class NewsRepository {
  List<News> groupShifts(
      List<Shift> shifts, int tabIndex, DateTimeRange? dateTimeRange);
}
