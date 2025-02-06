import 'package:flutter/cupertino.dart';
import 'package:haski/common/app_colors.dart';
import 'package:haski/extensions/shifts_extension.dart';
import 'package:haski/models/shifts/shift_group.dart';
import 'package:haski/widgets/pages/pages/shifts/items/shift_item.dart';

class ShiftGroupList extends StatelessWidget {
  final List<ShiftGroup> groups;

  const ShiftGroupList({super.key, required this.groups});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final group = groups[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24, left: 16),
                    child: Text(
                      group.status.text,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.hoki,
                      ),
                    ),
                  ),
                  ...group.shifts.map((shift) => ShiftItem(shift: shift)),
                ],
              );
            },
            childCount: groups.length,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 50),
        ),
      ],
    );
  }
}
