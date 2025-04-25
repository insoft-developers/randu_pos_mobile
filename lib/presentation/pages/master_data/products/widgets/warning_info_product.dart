import 'package:flutter/material.dart';

import '../../../../../core/const/colors.dart';

class WarningInfoMasterProduct extends StatelessWidget {
  const WarningInfoMasterProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: RichText(
        text: const TextSpan(
          text:
              '''Ini adalah versi sederhana dari Upload Produk, jika ingin upload produk versi lengkap, upload produk varian, dan upload produk manufaktur silahkan gunakan ''',
          style: TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: 'Dashboard Web https://app.randu.co.id',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomColors.black,
              ),
            ),
            TextSpan(
              text: ' atau Aplikasi Admin ',
              style: TextStyle(
                color: CustomColors.black,
              ),
            ),
            TextSpan(
              text: '"Randu - Admin Core"',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
