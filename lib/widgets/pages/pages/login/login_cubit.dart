import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haski/common/app_constants.dart';
import 'package:haski/dialog/dialog_service.dart';
import 'package:haski/managers/authorization/authorization_manager.dart';
import 'package:haski/widgets/pages/pages/login/login_state.dart';
import 'package:haski/widgets/pages/pages/main/main_page.dart';
import 'package:injector/injector.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState(isLoading: true));

  final injector = Injector.appInstance;

  late AuthorizationManager authorizationManager;
  late DialogService dialogService;

  String email = "";
  String password = "";

  Future<void> loadInitialData() async {
    final stableState = state;
    authorizationManager = injector.get<AuthorizationManager>();
    dialogService = injector.get<DialogService>();

    try {
      emit(state.copyWith(isLoading: true));

      emit(state.copyWith(isLoading: false));
    } catch (error) {
      emit(state.copyWith(error: error.toString()));
      emit(stableState.copyWith(isLoading: false));
    }
  }

  Future<void> login(BuildContext context) async {
    emit(state.copyWith(isLoading: true));

    var isLoggedIn =
        await authorizationManager.authorize(email, password, false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const MainPage(),
      ),
    );
  }

  // Future<void> resetPassword(String email) {
  //   dialogService.showToast(LocaleKeys.CheckEmail.tr());
  //   return authorizationManager.resetPassword(email);
  // }

  void onEmailChanged(String email) {
    this.email = email;
    emit(state.copyWith(canLogin: checkCanLogin()));
  }

  void onPasswordChanged(String password) {
    this.password = password;
    emit(state.copyWith(canLogin: checkCanLogin()));
  }

  bool checkCanLogin() {
    return email.isNotEmpty && password.isNotEmpty;
  }

  bool checkIsEmail(String email) {
    return RegExp(Constants.emailRegex).hasMatch(email);
  }
}
