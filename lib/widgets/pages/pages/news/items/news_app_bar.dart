import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haski/common/app_colors.dart';
import 'package:haski/generated/locale_keys.g.dart';

class NewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  final Function(int) onTabChange;

  const NewsAppBar({
    super.key,
    required this.tabController,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(
        color: AppColors.hoki,
      ),
      centerTitle: true,
      title: TabBar(
        controller: tabController,
        dividerHeight: 0,
        tabAlignment: TabAlignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        splashBorderRadius: BorderRadius.circular(20),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: AppColors.frenchPass,
          borderRadius: BorderRadius.circular(31),
        ),
        indicatorAnimation: TabIndicatorAnimation.linear,
        onTap: onTabChange,
        tabs: [
          Tab(
            height: 30,
            child: Text(
              LocaleKeys.messages.tr(),
              style: TextStyle(
                  fontSize: 14, color: const Color.fromARGB(255, 40, 66, 84)),
            ),
          ),
          Tab(
            height: 30,
            child: Text(
              LocaleKeys.news.tr(),
              style: TextStyle(fontSize: 14, color: AppColors.hoki),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
