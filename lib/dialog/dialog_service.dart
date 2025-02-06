import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

abstract class DialogService {
  Future<void> showToast(String msg, {int gravity = Toast.bottom});

  Future<bool> showConfirmationDialog(BuildContext context, String message,
      {String title = "", String? yes, String? no});

  Future showAlertDialog(BuildContext context, String message, {String? title, String? ok});

  Future<T?> showBottomSheet<T>(BuildContext context, Widget Function(BuildContext) builder,
      {bool isScrollControlled = false});

  Future<void> showSnackBar(BuildContext context, String text,
      {String? actionText, void Function()? actionPress, Duration duration});

  Future<int?> showImageDetailsCarousel(
    BuildContext context,
    List<String> images, [
    int initialIndex = 0,
  ]);
}
