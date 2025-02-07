import 'package:flutter/material.dart';
import 'package:haski/common/app_colors.dart';

class ShiftDetailsField extends StatelessWidget {
  const ShiftDetailsField(
      {super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 12,
                color: AppColors.hoki,
                fontWeight: FontWeight.w400)),
        Text(subtitle,
            style: TextStyle(
                fontSize: 14,
                color: AppColors.black,
                fontWeight: FontWeight.w400)),
        SizedBox(height: 5.0),
        Divider(height: 1)
      ],
    );
  }
}
