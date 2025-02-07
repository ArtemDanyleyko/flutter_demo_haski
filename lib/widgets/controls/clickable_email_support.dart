import 'package:flutter/material.dart';
import 'package:haski/common/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ClickableEmailSupport extends StatelessWidget {
  const ClickableEmailSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Uri emailLaunchUri = Uri(
          scheme: 'mailto',
          path: 'info@mail.com',
        );
        if (await canLaunchUrl(emailLaunchUri)) {
          await launchUrl(emailLaunchUri);
        } else {
          throw 'Не удалось открыть почту';
        }
      },
      child: Text(
        "info@mail.com",
        style: TextStyle(
          color: AppColors.main,
          fontSize: 14,
        ),
      ),
    );
  }
}
