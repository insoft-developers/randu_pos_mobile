import 'dart:io';

import 'package:flutter/material.dart';
import '../../../../core/const/colors.dart';

import 'widget.dart';

class LoginBodyTablet extends StatelessWidget {
  const LoginBodyTablet({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // color: Colors.blue,
              child: Image.asset(
                'assets/images/hero-image-pos.webp',
                // 'assets/images/login-hero.webp',
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2 - 24,
              ),
            ),
            const SizedBox(width: 16),
            Container(
              width: MediaQuery.of(context).size.width / 2 - 24,
              padding: const EdgeInsets.only(
                top: 24,
                left: 24,
                right: 24,
                bottom: 16,
              ),
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: CustomColors.gray,
                      blurRadius: 4,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const LoginHeaderTablet(),
                  LoginForm(
                    formkey: formKey,
                  ),
                  Platform.isAndroid? const CreateAccountLink():const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
