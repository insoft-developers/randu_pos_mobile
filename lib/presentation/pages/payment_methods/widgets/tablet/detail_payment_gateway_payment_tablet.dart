import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/const/colors.dart';
import '../../../../widgets/core/container/custom_rounded_container.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../list_ot_text.dart';
import '../payment_bottom_button_group.dart';

class DetailPaymentGatewayPaymentTablet extends ConsumerWidget {
  const DetailPaymentGatewayPaymentTablet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomRoundedContainer(
      padding: const EdgeInsets.all(24),
      shadow: const [
        BoxShadow(
          color: CustomColors.gray,
          blurRadius: 4,
        )
      ],
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
                  'Pembayaran dengan metode Payment Gateway (Randu Wallet)',
                  style: CustomTextStyle.h6Bold,
                ),
                const SizedBox(height: 24),
                Text(
                  'Akan langsung membuka halaman pembayaran setelah klik “PROSES TRANSAKSI“',
                  style: CustomTextStyle.body2.copyWith(
                    color: CustomColors.black.withValues(alpha: .8),
                  ),
                ),
                const SizedBox(height: 24),
                const ListOtText(items: [
                  'Pastikan koneksi dalam keadaan stabil',
                  'Pastikan pembeli sudah siap untuk melakukan pembayaran',
                  'Saldo akan masuk ke akun Randu Wallet maksimal 1 sd 2x24 jam (maksimal) dan bisa langsung di cairkan ke rekening akun',
                  'Potongan 0,7% dari nominal transaksi untuk biaya administrasi',
                  'Pilihan metode pembayaran yang aktif:',
                ]),
                const SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.only(left: 32),
                  child: ListOtText(items: [
                    'Virtual Akun (BCA, Mandiri, BRI, BNI, ATM Bersama)',
                    'E-Wallet (Dana, OVO, Shopeepay, Link Aja)',
                    'QRIS',
                    'Kartu Kredit',
                    'Retail (Alfamart & Indomart)',
                    'Kredit Payment',
                  ]),
                )
              ],
            ),
          ),
          const Spacer(),
          const PaymentBottomButtonGroup()
        ],
      ),
    );
  }
}
