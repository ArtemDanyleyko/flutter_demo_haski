import 'package:flutter/material.dart';
import 'package:haski/extensions/datetime_extension.dart';
import 'package:haski/extensions/shifts_extension.dart';
import 'package:haski/models/shifts/shift.dart';
import 'package:haski/models/shifts/shift_group.dart';
import 'package:haski/repositories/shifts/shifts_repository.dart';

class ShiftRepositoryImpl extends ShiftRepository {
  @override
  List<ShiftGroup> groupShifts(
      List<Shift> shifts, int tabIndex, DateTimeRange? dateTimeRange) {
    var filteredWithDateTimeRangeShifts =
        filterWithDateTimeRange(shifts, dateTimeRange);
    switch (tabIndex) {
      case 1:
        var filteredShifts = filteredWithDateTimeRangeShifts
            .where((element) => element.status.order == 1)
            .toList();
        return groupShiftsByStatus(filteredShifts);
      case 2:
        var filteredShifts = filteredWithDateTimeRangeShifts
            .where((element) => element.status.order == 2)
            .toList();
        return groupShiftsByStatus(filteredShifts);
      case 3:
        var filteredShifts = filteredWithDateTimeRangeShifts
            .where((element) => element.status.order == 3)
            .toList();
        return groupShiftsByStatus(filteredShifts);
      default:
        return groupShiftsByStatus(filteredWithDateTimeRangeShifts);
    }
  }

  List<ShiftGroup> groupShiftsByStatus(List<Shift> shifts) {
    final groupedShifts = <ShiftStatus, List<Shift>>{};
    for (final shift in shifts) {
      groupedShifts.putIfAbsent(shift.status, () => []).add(shift);
    }
    return groupedShifts.entries
        .map((entry) => ShiftGroup(status: entry.key, shifts: entry.value))
        .toList();
  }

  List<Shift> filterWithDateTimeRange(
      List<Shift> shifts, DateTimeRange? dateTimeRange) {
    if (dateTimeRange != null) {
      return shifts
          .where((item) =>
              (item.startTime.date.isAfter(dateTimeRange.start.date) ||
                  item.startTime.date
                      .isAtSameMomentAs(dateTimeRange.start.date)) &&
              (item.startTime.date.isBefore(dateTimeRange.end.date) ||
                  item.startTime.date.isAtSameMomentAs(dateTimeRange.end.date)))
          .toList();
    }

    return shifts;
  }
}
