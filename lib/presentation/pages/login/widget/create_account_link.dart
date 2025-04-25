import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/constant.dart';
import '../../../../core/utils/url_launcher.dart';

class CreateAccountLink extends StatelessWidget {
  const CreateAccountLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      height: 60,
      child: RichText(
        text: TextSpan(
          text: 'Belum Daftar? atau Lupa Password? ',
          style: const TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: 'Klik di Sini',
              style: const TextStyle(
                color: CustomColors.primaryColor,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchUrlImpl(endpoint);
                },
            ),
          ],
        ),
      ),
    );
  }
}
