import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haski/common/app_colors.dart';
import 'package:haski/common/font_constants.dart';
import 'package:haski/widgets/pages/common/image_details/image_details.dart';
import 'package:toast/toast.dart';
import 'package:haski/generated/locale_keys.g.dart';
import 'dialog_service.dart';

class DialogServiceImpl implements DialogService {
  @override
  Future<void> showToast(String msg, {int gravity = Toast.bottom}) {
    Toast.show(msg,
        backgroundColor: AppColors.orange, gravity: gravity, duration: Toast.lengthLong);
    return Future.value();
  }

  @override
  Future<T?> showBottomSheet<T>(BuildContext context, Widget Function(BuildContext) builder,
      {bool isScrollControlled = false}) {
    return showModalBottomSheet(
        context: context,
        showDragHandle: true,
        backgroundColor: Colors.white,
        isScrollControlled: isScrollControlled,
        builder: builder);
  }

  @override
  Future<bool> showConfirmationDialog(BuildContext context, String message,
      {String? title, String? yes, String? no}) async {
    var result = await showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              surfaceTintColor: Colors.transparent,
              elevation: 24,
              backgroundColor: Colors.white,
              actionsAlignment: MainAxisAlignment.spaceAround,
              titleTextStyle: TextStyle(
                  fontFamily: FontConstants.nunito,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black),
              title: title != null
                  ? Text(
                      title,
                      textAlign: TextAlign.center,
                    )
                  : null,
              contentTextStyle: TextStyle(
                  fontFamily: FontConstants.nunito,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: title != null ? AppColors.grayDark : AppColors.black),
              content: Text(
                message,
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(
                    no ?? LocaleKeys.No.tr(),
                    style: TextStyle(
                        fontFamily: FontConstants.nunito,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(
                    yes ?? LocaleKeys.Yes.tr(),
                    style: TextStyle(
                        fontFamily: FontConstants.nunito,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.orange),
                  ),
                ),
              ],
            ));
    return result ?? false;
  }

  @override
  Future<void> showSnackBar(BuildContext context, String text,
      {String? actionText, void Function()? actionPress, Duration? duration}) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.hideCurrentSnackBar();
    scaffoldMessenger.showSnackBar(
      SnackBar(
        duration: duration ?? const Duration(seconds: 10),
        backgroundColor: AppColors.orange,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        content: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        action: actionText != null
            ? SnackBarAction(
                label: actionText,
                onPressed: actionPress ?? () {},
                textColor: AppColors.whiteSmoke,
              )
            : null,
      ),
    );
    return Future.value();
  }

  @override
  Future showAlertDialog(BuildContext context, String message, {String? title, String? ok}) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        surfaceTintColor: Colors.transparent,
        elevation: 24,
        backgroundColor: Colors.white,
        actionsAlignment: MainAxisAlignment.spaceAround,
        titleTextStyle: TextStyle(
            fontFamily: FontConstants.nunito,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.black),
        title: title != null
            ? Text(
                title,
                textAlign: TextAlign.center,
              )
            : null,
        contentTextStyle: TextStyle(
            fontFamily: FontConstants.nunito,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: title != null ? AppColors.grayDark : AppColors.black),
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    ok ?? LocaleKeys.Ok.tr(),
                    style: TextStyle(
                        fontFamily: FontConstants.nunito,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.orange),
                  )
                ],
              )),
        ],
      ),
    );
  }

  @override
  Future<int?> showImageDetailsCarousel(BuildContext context, List<String> images,
      [int initialIndex = 0]) {
    return showDialog(
      context: context,
      builder: (context) => ImageDetailsPopup(
        posters: images,
        initialIndex: initialIndex,
      ),
      barrierColor: Colors.black87,
      barrierDismissible: false,
    );
  }
}
