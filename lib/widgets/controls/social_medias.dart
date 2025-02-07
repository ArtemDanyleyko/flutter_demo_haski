import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:haski/common/app_colors.dart';
import 'package:haski/common/image_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMedias extends StatelessWidget {
  const SocialMedias({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildSocialButton(
          iconPath: ImageConstants.icTelegram,
          label: "Telegram",
          url: "https://t.me/your_channel",
        ),
        _buildSocialButton(
          iconPath: ImageConstants.icFacebook,
          label: "Facebook",
          url: "https://www.facebook.com/your_page",
        ),
        _buildSocialButton(
          iconPath: ImageConstants.icTwitter,
          label: "Twitter",
          url: "https://twitter.com/your_profile",
        ),
        _buildSocialButton(
          iconPath: ImageConstants.icViber,
          label: "Viber",
          url: "viber://chat?number=%2B1234567890",
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required String iconPath,
    required String label,
    required String url,
  }) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Column(
        spacing: 5.0,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath, width: 44, height: 44),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Не удалось открыть: $url';
    }
  }
}
