import 'package:haski/models/shifts/shift.dart';

extension ShiftStatusExtension on ShiftStatus {
  String get text {
    switch (this) {
      case ShiftStatus.canceled:
        return "Отмененные";
      case ShiftStatus.planned:
        return "Запланированные";
      case ShiftStatus.worked:
        return "Отработанные";
    }
  }

  int get order {
    switch (this) {
      case ShiftStatus.planned:
        return 1;
      case ShiftStatus.worked:
        return 2;
      case ShiftStatus.canceled:
        return 3;
    }
  }
}
