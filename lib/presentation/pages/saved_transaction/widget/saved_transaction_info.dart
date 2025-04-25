import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/utils/confirmation_dialog.dart';
import '../../../../core/utils/currency_utils.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../domain/entities/general_response.dart';
import '../../../providers/main/cart/cart_provider.dart';
import '../../../providers/main/saved/delete_saved_transaction/delete_saved_transaction_provider.dart';
import '../../../widgets/core/buttons/small_button.dart';
import '../../../widgets/core/container/custom_rounded_container.dart';
import '../../../widgets/core/extension_dialog/extension_dialog.dart';
import '../../../widgets/core/text/custom_text.dart';

class SavedTransactionInfo extends ConsumerWidget {
  const SavedTransactionInfo({
    super.key,
    required this.item,
  });

  final CartState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? tableNumber = item.table?.noMeja;
    String? note = item.customer?.name;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.savedCartInfo?.id ?? '-',
                      style: CustomTextStyle.productName
                          .copyWith(color: Colors.blue.shade800),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      formatStringIDRToCurrency(
                        text: item.totalPrice.toString(),
                        symbol: 'Rp ',
                        isDouble: true,
                      ),
                      style: CustomTextStyle.mobileDialogText,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.grey.shade400,
                      size: 18,
                      weight: .5,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      formatDateToString(item.savedCartInfo?.createdAt,
                              format: 'HH:mm') ??
                          '',
                      style: CustomTextStyle.body3.copyWith(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    if (item.cartItems.length > 1 || item.totalQuantity > 1)
                      SmallButton(
                        onPressed: () async {
                          context.pushNamed('split_bill', extra: item);
                        },
                        label: 'Split Bill',
                        color: CustomColors.gradientGreenStart,
                      ),
                    const SizedBox(width: 12),
                    SmallButton(
                      onPressed: () async {
                        const titleMessage = 'Hapus Transaksi';
                        const content =
                            'Apakah kamu yakin ingin menghapus transaksi tersimpan?';
                        await context
                            .confirmationPopUp(
                                context: context,
                                titleMessage: titleMessage,
                                content: content,
                                type: DialogType.error,
                                iconType: IconType.exclamation)
                            .then(
                          (value) {
                            if (value != null && value) {
                              ref
                                  .read(deleteSavedTransactionProvider.notifier)
                                  .deleteSavedTransaction(
                                      savedId: item.savedCartInfo!.id!);
                              if (context.mounted) {
                                context.showResultDialog(
                                  baseResponse: const GeneralResponse(
                                      status: true,
                                      message: 'Berhasil menghapus transaksi'),
                                );
                              }
                            }
                          },
                        );
                      },
                      color: Colors.red.shade800,
                      isOutlined: true,
                      label: 'Hapus',
                    ),
                    const SizedBox(width: 8),
                    SmallButton(
                      onPressed: () {
                        ref.read(cartProvider.notifier).restoreSavedCart(item);
                        context.pop();
                      },
                      label: 'Pilih',
                      color: CustomColors.strongOrange,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            note != null
                ? Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.person_2_outlined,
                          size: 16,
                          color: CustomColors.darkGray,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            'Pelanggan : $note',
                            style: CustomTextStyle.body3.copyWith(
                              fontSize: 12,
                              color: CustomColors.darkGray,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const Spacer(),
            const SizedBox(width: 14),
            tableNumber != null
                ? CustomRoundedContainer(
                    shadow: const [],
                    radius: 4,
                    color: Colors.lightBlue.shade100,
                    padding: const EdgeInsets.fromLTRB(8, 3, 8, 4),
                    child: Text(
                      'Meja ${item.table?.noMeja ?? '1'}',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue.shade800,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
