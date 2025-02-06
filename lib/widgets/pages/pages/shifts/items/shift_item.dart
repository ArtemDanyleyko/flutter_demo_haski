import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haski/common/app_colors.dart';
import 'package:haski/common/font_constants.dart';
import 'package:haski/common/image_constants.dart';
import 'package:haski/models/shifts/shift.dart';
import 'package:haski/widgets/pages/pages/shifts/items/chips_list.dart';
import 'package:haski/widgets/pages/pages/shifts/shift_details_page.dart';

class ShiftItem extends StatelessWidget {
  final Shift shift;

  const ShiftItem({
    super.key,
    required this.shift,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShiftDetailsPage(shift: shift),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColors.morningMist,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              ImageConstants.icShift,
              width: 44,
              height: 44,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shift.title,
                  style: TextStyle(
                    fontFamily: FontConstants.nunito,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  shift.address,
                  style: TextStyle(
                    fontFamily: FontConstants.nunito,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.hoki,
                  ),
                ),
                const SizedBox(height: 8),
                ChipsList(shift: shift),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
