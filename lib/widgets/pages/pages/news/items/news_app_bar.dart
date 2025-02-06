import 'package:flutter/material.dart';
import 'package:haski/common/app_colors.dart';

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
        tabs: const [
          Tab(
            height: 30,
            child: Text(
              'Сообщения',
              style: TextStyle(fontSize: 14, color: AppColors.hoki),
            ),
          ),
          Tab(
            height: 30,
            child: Text(
              'Новости',
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
