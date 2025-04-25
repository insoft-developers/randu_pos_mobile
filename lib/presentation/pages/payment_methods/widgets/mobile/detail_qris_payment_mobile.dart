import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/const/colors.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../list_ot_text.dart';

class DetailQrisPaymentMobile extends ConsumerWidget {
  const DetailQrisPaymentMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DottedBorder(
                strokeCap: StrokeCap.round,
                dashPattern: const [6, 4],
                strokeWidth: 1.5,
                color: CustomColors.darkGray,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pembayaran dengan metode Instant QRIS',
                      style: CustomTextStyle.h7Bold.copyWith(height: 1.4),
                    ),
                    const SizedBox(height: 12),
                    const ListOtText(items: [
                      'Pastikan koneksi dalam keadaan stabil',
                      'Pastikan pembeli sudah siap untuk melakukan pembayaran',
                      'Saldo akan masuk ke akun Randu Wallet maksimal 1 sd 2x24 jam (maksimal) dan bisa langsung di cairkan ke rekening akun',
                      'Potongan 0,7% dari nominal transaksi untuk biaya administrasi',
                    ]),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}