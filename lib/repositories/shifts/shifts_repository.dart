import 'package:flutter/material.dart';
import 'package:haski/models/shifts/shift.dart';
import 'package:haski/models/shifts/shift_group.dart';

abstract class ShiftRepository {
  List<ShiftGroup> groupShifts(
      List<Shift> shifts, int tabIndex, DateTimeRange? dateTimeRange);
}
