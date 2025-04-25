import 'package:flutter/material.dart';

import 'widget.dart';

class LoginBodyMobile extends StatelessWidget {
  const LoginBodyMobile({super.key, required this.formkey});
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const LoginHeaderMobile(),
            LoginForm(
              formkey: formkey,
            )
          ],
        ),
      ),
    );
  }
}
