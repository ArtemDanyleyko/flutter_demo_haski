import 'package:flutter/material.dart';
import 'package:haski/common/app_colors.dart';
import 'package:haski/widgets/controls/date_range_picker.dart';

class DateRangePickerScreen extends StatefulWidget {
  @override
  _DateRangePickerScreenState createState() => _DateRangePickerScreenState();
}

class _DateRangePickerScreenState extends State<DateRangePickerScreen> {
  DateTimeRange? _dateTimeRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Colors.white, // Белый фон
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close, color: AppColors.hoki),
                    onPressed: () => Navigator.of(context).pop(null),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(_dateTimeRange);
                        },
                        child: Text(
                          'Отфильтровать',
                          style: TextStyle(
                              color: AppColors.main,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                ],
              ),
              DateRangePicker(onDateRangeSelected: _onDateRangeSelected),
            ],
          ),
        ),
      ),
    );
  }

  void _onDateRangeSelected(DateTimeRange? dateTimeRange) {
    setState(() {
      _dateTimeRange = dateTimeRange;
    });
  }
}
