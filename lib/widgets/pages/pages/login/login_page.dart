import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haski/common/app_colors.dart';
import 'package:haski/common/font_constants.dart';
import 'package:haski/common/image_constants.dart';
import 'package:haski/generated/locale_keys.g.dart';
import 'package:haski/widgets/pages/pages/login/login_cubit.dart';
import 'package:haski/widgets/pages/pages/login/login_state.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final screenCubit = LoginCubit();

  bool isPasswordVisible = false;

  void switchPasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  void initState() {
    screenCubit.loadInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        bloc: screenCubit,
        listener: (BuildContext context, LoginState state) {
          if (state.error != null) {}
        },
        builder: (BuildContext context, LoginState state) {
          return Stack(
            children: [buildBody(state)],
          );
        },
      ),
    );
  }

  Widget buildBody(LoginState state) {
    const logoWidth = 173.0;
    const logoHeight = 36.0;

    return SafeArea(
        child: Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: SvgPicture.asset(ImageConstants.icLogo,
                  width: logoWidth, height: logoHeight),
            ),
            SizedBox(height: 30),
            Container(
                margin: const EdgeInsets.only(top: 24, bottom: 8),
                child: Row(
                  children: [
                    Text(
                      LocaleKeys.email.tr(),
                      style: TextStyle(
                          fontFamily: FontConstants.nunito,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.hoki),
                    ),
                  ],
                )),
            Container(
              child: TextFormField(
                onChanged: (email) => screenCubit.onEmailChanged(email),
                autocorrect: false,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    hintText: LocaleKeys.email.tr(),
                    hintStyle: TextStyle(color: AppColors.sweetBlue),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.sweetBlue, width: 1)),
                    border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.sweetBlue, width: 1)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.sweetBlue, width: 1))),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 16, bottom: 8),
                child: Row(
                  children: [
                    Text(
                      LocaleKeys.password.tr(),
                      style: TextStyle(
                          fontFamily: FontConstants.nunito,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.hoki),
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: TextFormField(
                onChanged: (password) =>
                    screenCubit.onPasswordChanged(password),
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                autocorrect: false,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  hintText: LocaleKeys.password.tr(),
                  hintStyle: TextStyle(color: AppColors.sweetBlue),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.grayDark,
                    ),
                    onPressed: switchPasswordVisibility,
                  ),
                  fillColor: Colors.grey,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.sweetBlue, width: 1)),
                  border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.sweetBlue, width: 1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.sweetBlue, width: 1),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
                child: SizedBox(
                    height: 42,
                    width: 200,
                    child: IgnorePointer(
                      ignoring: !state.canLogin,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: state.canLogin
                              ? AppColors.main
                              : AppColors.sweetBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        onPressed: () {
                          state.canLogin ? screenCubit.login(context) : null;
                        },
                        child: Text(
                          LocaleKeys.login.tr(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )))
          ],
        ),
      ),
    ));
  }
}
