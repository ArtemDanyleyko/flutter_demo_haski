import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haski/common/app_colors.dart';
import 'package:haski/common/image_constants.dart';
import 'package:haski/dialog/dialog_service.dart';
import 'package:haski/generated/locale_keys.g.dart';
import 'package:haski/managers/authorization/authorization_manager.dart';
import 'package:haski/models/ui/navigation_tab.dart';
import 'package:haski/widgets/controls/animated_indexed_stack.dart';
import 'package:haski/widgets/pages/pages/shifts/shifts_page.dart';
import 'package:injector/injector.dart';
import 'package:toast/toast.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final tabs = [
    NavigationTab(
      page: ShiftsPage(),
      icon: ImageConstants.icShiftsTab,
      name: LocaleKeys.shifts.tr(),
      isCurrent: true,
    )
  ];

  final injector = Injector.appInstance;

  late final dialogService = injector.get<DialogService>();
  late final authorizationManager = injector.get<AuthorizationManager>();
  late int currentIndex = 0;

  final isUserVerifiedNotifier = ValueNotifier<bool?>(null);

  Future<void> changeTab(int index) async {
    if (currentIndex == index) {
      if (index == 0) {
        (tabs[0].page as ShiftsPage);
      }
      return;
    }

    setState(() {
      tabs[currentIndex].isCurrent = false;
      tabs[index].isCurrent = true;
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return ValueListenableBuilder(
        valueListenable: isUserVerifiedNotifier,
        builder: (context, isUserVerified, _) {
          return ValueListenableBuilder(
            valueListenable: ValueNotifier(true),
            builder: (context, canChangeTabs, child) => Stack(
              children: [
                Scaffold(
                  extendBody: true,
                  floatingActionButton: null,
                  body: AnimatedIndexedStack(
                    index: currentIndex,
                    children:
                        List.generate(tabs.length, (index) => tabs[index].page),
                  ),
                  bottomNavigationBar: SafeArea(
                    child: Container(
                      height: 85,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.coarseWool,
                      ),
                      child: Stack(
                        children: [
                          const SizedBox.expand(),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: List.generate(
                                tabs.length,
                                (index) => Expanded(
                                  child: GestureDetector(
                                      onTap: () =>
                                          canChangeTabs ? changeTab(index) : {},
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        color: Colors.transparent,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            AnimatedSwitcher(
                                              duration: Durations.medium1,
                                              child: SvgPicture.asset(
                                                tabs[index].icon,
                                                key: ValueKey(
                                                    tabs[index].isCurrent),
                                                color: tabs[index].isCurrent
                                                    ? AppColors.main
                                                    : AppColors.hoki,
                                              ),
                                            ),
                                            const SizedBox(height: 7),
                                            AnimatedSwitcher(
                                              duration: Durations.medium1,
                                              child: Text(
                                                tabs[index].name,
                                                key: ValueKey(
                                                    tabs[index].isCurrent),
                                                style: TextStyle(
                                                  color: tabs[index].isCurrent
                                                      ? AppColors.main
                                                      : AppColors.hoki,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                IgnorePointer(
                  ignoring: canChangeTabs,
                  child: AnimatedOpacity(
                    opacity: canChangeTabs ? 0 : 1,
                    duration: Durations.medium1,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
