import 'package:easy_localization/easy_localization.dart';

extension DateTimeExtension on DateTime {
  DateTime get date {
    return DateTime(year, month, day);
  }

  String get shortDate {
    return DateFormat("dd.MM.yyyy").format(this);
  }

  String get longDate {
    return DateFormat("dd MMMM yyyy").format(this);
  }
}
