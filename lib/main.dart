import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haski/IoC/composition_root.dart';
import 'package:haski/common/app_colors.dart';
import 'package:haski/generated/codegen_loader.g.dart';
import 'package:haski/widgets/pages/pages/login/login_page.dart';
import 'package:injector/injector.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key, required this.injector, required this.homeScreen})
      : super(key: key);

  final Injector injector;
  final Widget homeScreen;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Haski',
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.pageBackground,
          appBarTheme: AppBarTheme(backgroundColor: AppColors.white)),
      home: homeScreen,
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  Intl.defaultLocale = "ru_RU";

  CompositionRoot.initialize();

  final injector = CompositionRoot.injector;

  final launchScreen = await getLaunchScreen(injector);

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ru', 'RU')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ru', 'RU'),
      startLocale: const Locale('ru', 'RU'),
      assetLoader: const CodegenLoader(),
      ignorePluralRules: false,
      child: MainApp(injector: injector, homeScreen: launchScreen),
    ),
  );
}

Future<Widget> getLaunchScreen(Injector injector) async {
  return const LoginPage();
}
