import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haski/common/app_colors.dart';
import 'package:haski/common/font_constants.dart';
import 'package:haski/common/image_constants.dart';
import 'package:haski/generated/locale_keys.g.dart';
import 'package:haski/widgets/pages/pages/news/news_page.dart';
import 'package:haski/widgets/pages/pages/shifts/bloc/shifts_bloc.dart';
import 'package:haski/widgets/pages/pages/shifts/bloc/shifts_event.dart';
import 'package:haski/widgets/pages/pages/shifts/bloc/shifts_state.dart';
import 'package:haski/widgets/pages/pages/shifts/filter_shifts_page.dart';

class ShiftsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ShiftsBloc screenCubit;

  ShiftsAppBar({required this.screenCubit});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: BlocBuilder<ShiftsBloc, ShiftsState>(
        bloc: screenCubit,
        builder: (context, state) {
          final shiftCount = state is ShiftsLoaded ? state.totalShiftsCount : 0;
          return Column(
            children: [
              Text(
                LocaleKeys.Shifts.tr(),
                style: TextStyle(
                  fontFamily: FontConstants.nunito,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
              Text(
                "Всего $shiftCount",
                style: TextStyle(
                  fontFamily: FontConstants.nunito,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.hoki,
                ),
              ),
            ],
          );
        },
      ),
      leading: IconButton(
        icon: SvgPicture.asset(
          ImageConstants.icFilter,
          width: 24,
          height: 24,
        ),
        onPressed: () async {
          var dateRange = await showModalBottomSheet<DateTimeRange?>(
            context: context,
            builder: (context) => DateRangePickerScreen(),
          );
          screenCubit.add(FilterShifts(dateRange));
        },
      ),
      actions: [
        _buildIconButton(context, ImageConstants.icNotifications),
        _buildIconButton(context, ImageConstants.icSettings),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Column(
          children: [
            Divider(
              height: 1.0,
              color: AppColors.morningMist,
            ),
            TabBar(
              onTap: (index) {
                screenCubit.add(ChangeShiftsTab(index));
              },
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              splashBorderRadius: BorderRadius.circular(20),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: AppColors.frenchPass,
                borderRadius: BorderRadius.circular(31),
                border: Border.all(
                  color: AppColors.frozenLandscape,
                  width: 1.5,
                ),
              ),
              indicatorAnimation: TabIndicatorAnimation.linear,
              tabs: [
                Tab(
                  height: 40,
                  child: Text(
                    'Все',
                    style: TextStyle(fontSize: 14, color: AppColors.hoki),
                  ),
                ),
                Tab(
                  height: 40,
                  child: Text(
                    'Запланированные',
                    style: TextStyle(fontSize: 14, color: AppColors.hoki),
                  ),
                ),
                Tab(
                  height: 40,
                  child: Text(
                    'Отработанные',
                    style: TextStyle(fontSize: 14, color: AppColors.hoki),
                  ),
                ),
                Tab(
                  height: 40,
                  child: Text(
                    'Отмененные',
                    style: TextStyle(fontSize: 14, color: AppColors.hoki),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, String iconPath) {
    return IconButton(
      icon: SvgPicture.asset(
        iconPath,
        width: 24,
        height: 24,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const NewsPage(),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120.0);
}
