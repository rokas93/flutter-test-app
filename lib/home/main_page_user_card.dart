import 'package:flutter/material.dart';
import 'package:second_app/utils/colors.dart';
import 'package:second_app/widgets/custom_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );

  await launchUrl(launchUri);
}

class MainPageUserCard extends StatelessWidget {
  final String userName, userEmail, userPhone;
  final VoidCallback? onTap;

  const MainPageUserCard({
    Key? key,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 2.0,
            color: AppColors.blackColor,
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.portrait_sharp,
              color: AppColors.mainColor,
              size: 70,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomText(
                    text: userName,
                    weight: FontWeight.w600,
                    size: 24,
                  ),
                  CustomText(
                    text: userEmail,
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () => _makePhoneCall(userPhone),
                icon: const Icon(
                  Icons.phone,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
