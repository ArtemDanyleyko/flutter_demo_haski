import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haski/common/app_colors.dart';
import 'package:haski/dialog/dialog_service.dart';
import 'package:haski/generated/locale_keys.g.dart';
import 'package:haski/managers/authorization/authorization_manager.dart';
import 'package:haski/managers/profile/profile_manager.dart';
import 'package:haski/widgets/controls/clickable_email_support.dart';
import 'package:haski/widgets/controls/clickable_phone_support.dart';
import 'package:haski/widgets/controls/social_medias.dart';
import 'package:haski/widgets/pages/pages/login/login_page.dart';
import 'package:haski/widgets/pages/pages/settings/bloc/settings_page_bloc.dart';
import 'package:haski/widgets/pages/pages/settings/bloc/settings_page_event.dart';
import 'package:haski/widgets/pages/pages/settings/bloc/settings_page_state.dart';
import 'package:injector/injector.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final injector = Injector.appInstance;

    return BlocProvider(
      create: (context) => SettingsBloc(
        profileManager: injector.get<ProfileManager>(),
        dialogService: injector.get<DialogService>(),
        authorizationManager: injector.get<AuthorizationManager>(),
      )..add(const LoadProfile()),
      child: BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state is UserLogout && state.isLogout) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (route) => false,
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              if (state is SettingsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SettingsLoaded) {
                return buildContent(context, state);
              } else if (state is SettingsError) {
                return Center(
                    child: Text(LocaleKeys.errorTemplate
                        .tr(args: [state.exeption.toString()])));
              }
              return Center(child: Text(LocaleKeys.unknownState.tr()));
            },
          ),
        ),
      ),
    );
  }

  Widget buildContent(BuildContext context, SettingsLoaded state) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20.0, left: 20.0, right: 20.0, bottom: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  spacing: 10.0,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.network(
                        state.user.photo,
                        width: 52,
                        height: 52,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.user.name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400)),
                          Text(state.user.profession,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.hoki,
                                  fontWeight: FontWeight.w400)),
                        ])
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              Text("Email поддержки",
                  style: TextStyle(color: AppColors.hoki, fontSize: 12)),
              const SizedBox(height: 5.0),
              const ClickableEmailSupport(),
              const SizedBox(height: 10.0),
              const Divider(height: 1, color: AppColors.sweetBlue),
              const SizedBox(height: 20.0),
              Text("Написать в чат",
                  style: TextStyle(color: AppColors.hoki, fontSize: 12)),
              const SizedBox(height: 10.0),
              const SocialMedias(),
              const SizedBox(height: 15.0),
              const Divider(height: 1, color: AppColors.sweetBlue),
              const SizedBox(height: 20.0),
              Text("Телефон служби поддержки",
                  style: TextStyle(color: AppColors.hoki, fontSize: 12)),
              const SizedBox(height: 10.0),
              const ClickablePhoneSupport(phoneNumber: "0 800 123 23 23"),
              const SizedBox(height: 10.0),
              const Divider(height: 1, color: AppColors.sweetBlue),
              const SizedBox(height: 20.0),
              Text("Телефон служби поддержки",
                  style: TextStyle(color: AppColors.hoki, fontSize: 12)),
              const SizedBox(height: 10.0),
              const ClickablePhoneSupport(phoneNumber: "0 800 123 23 99"),
              const SizedBox(height: 10.0),
              const Divider(height: 1, color: AppColors.sweetBlue),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
                side: const BorderSide(color: AppColors.rendezvous, width: 1),
              ),
              backgroundColor: Colors.transparent,
            ),
            onPressed: () {
              context.read<SettingsBloc>().add(const Logout());
            },
            child: Text(
              LocaleKeys.logout.tr(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
