import 'package:flutter/material.dart';
import 'package:haski/common/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ClickablePhoneSupport extends StatelessWidget {
  final String phoneNumber;

  const ClickablePhoneSupport({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Uri phoneUri = Uri(
          scheme: 'tel',
          path: phoneNumber,
        );
        if (await canLaunchUrl(phoneUri)) {
          await launchUrl(phoneUri);
        } else {
          throw 'Не удалось открыть номер телефона';
        }
      },
      child: Text(
        phoneNumber,
        style: TextStyle(
          color: AppColors.main,
          fontSize: 14,
        ),
      ),
    );
  }
}
