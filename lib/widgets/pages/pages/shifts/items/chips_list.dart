import 'package:flutter/material.dart';
import 'package:haski/common/app_colors.dart';
import 'package:haski/extensions/datetime_extension.dart';
import 'package:haski/models/shifts/shift.dart';

class ChipsList extends StatelessWidget {
  final Shift shift;

  const ChipsList({super.key, required this.shift});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 130),
        child: Wrap(spacing: 8.0, runSpacing: -5, children: [
          Chip(
            padding: EdgeInsets.all(0),
            label: Text(shift.shiftState.text.toUpperCase(),
                style: TextStyle(
                    fontSize: 10,
                    color: shift.shiftState.isAvailable
                        ? AppColors.avagduGreen
                        : AppColors.bittersweet,
                    fontWeight: FontWeight.w600)),
            backgroundColor: shift.shiftState.isAvailable
                ? AppColors.mistyLawn
                : AppColors.unburdenedPink,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.transparent)),
          ),
          Chip(
            padding: EdgeInsets.all(0),
            label: Text(shift.empoyeesCountFormat.toUpperCase(),
                style: TextStyle(
                    fontSize: 10,
                    color: AppColors.hoki,
                    fontWeight: FontWeight.w600)),
            backgroundColor: AppColors.morningMist,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.transparent)),
          ),
          Chip(
            padding: EdgeInsets.all(0),
            label: Text(shift.ratePerHourFormat.toUpperCase(),
                style: TextStyle(
                    fontSize: 10,
                    color: AppColors.hoki,
                    fontWeight: FontWeight.w600)),
            backgroundColor: AppColors.morningMist,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.transparent)),
          ),
          Chip(
            padding: EdgeInsets.all(0),
            label: Text(shift.salaryRate.toUpperCase(),
                style: TextStyle(
                    fontSize: 10,
                    color: AppColors.hoki,
                    fontWeight: FontWeight.w600)),
            backgroundColor: AppColors.morningMist,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: Colors.transparent),
            ),
          ),
          Chip(
            padding: EdgeInsets.all(0),
            label: Text(shift.startTime.shortDate.toUpperCase(),
                style: TextStyle(
                    fontSize: 10,
                    color: AppColors.hoki,
                    fontWeight: FontWeight.w600)),
            backgroundColor: AppColors.morningMist,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.transparent)),
          ),
        ]));
  }
}
