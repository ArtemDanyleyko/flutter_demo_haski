import 'package:flutter/material.dart';
import 'package:haski/common/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';

class DateRangePicker extends StatefulWidget {
  final Function(DateTimeRange?) onDateRangeSelected;

  const DateRangePicker({Key? key, required this.onDateRangeSelected})
      : super(key: key);

  @override
  _DateRangePickerState createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  DateTimeRange? _dateTimeRange;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ru_RU',
      focusedDay: _focusedDay,
      firstDay: DateTime.utc(2023, 1, 1),
      lastDay: DateTime.utc(2026, 12, 31),
      calendarFormat: CalendarFormat.month,
      startingDayOfWeek: StartingDayOfWeek.monday,
      rangeSelectionMode: RangeSelectionMode.toggledOn,
      rangeStartDay: _rangeStart,
      rangeEndDay: _rangeEnd,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
      calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(color: Colors.transparent),
          rangeStartDecoration: BoxDecoration(
            color: AppColors.main,
            shape: BoxShape.circle,
          ),
          rangeEndDecoration: BoxDecoration(
            color: AppColors.main,
            shape: BoxShape.circle,
          ),
          rangeHighlightColor: AppColors.main,
          withinRangeDecoration: BoxDecoration(
            color: AppColors.main,
            shape: BoxShape.rectangle,
          ),
          selectedDecoration: BoxDecoration(
            color: AppColors.main,
            shape: BoxShape.circle,
          ),
          withinRangeTextStyle: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400)),
      onRangeSelected: (start, end, focusedDay) {
        setState(() {
          _rangeStart = start;
          _rangeEnd = end;
          _focusedDay = focusedDay;
          if (start == null) {
            _dateTimeRange = null;
            return;
          }

          _dateTimeRange = DateTimeRange(start: start, end: end ?? start);
        });

        widget.onDateRangeSelected(_dateTimeRange);
      },
    );
  }
}
