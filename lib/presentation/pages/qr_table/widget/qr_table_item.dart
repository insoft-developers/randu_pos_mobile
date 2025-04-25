import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/utils/confirmation_dialog.dart';
import '../../../../domain/entities/report/qr_table/table_status_enum.dart';
import '../../../../domain/entities/transaction/cart/table_model.dart';
import '../../../../domain/usecases/report/qr_table/set_table_reservation/set_table_reservation_params.dart';
import '../../../providers/main/report/qr_table/set_table_reservation/set_table_reservation_provider.dart';
import '../../../widgets/core/buttons/primary_button.dart';
import '../../../widgets/core/container/custom_rounded_container.dart';
import '../../../widgets/core/text/custom_text_style.dart';

class QrTableItem extends ConsumerWidget {
  const QrTableItem({super.key, required this.table});
  final TableModel table;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomRoundedContainer(
      border: Border.all(color: CustomColors.gray),
      shadow: const [],
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(' ${table.noMeja ?? '-'}',
                    style: CustomTextStyle.h7Bold
                        .copyWith(color: Colors.blue[900])),
                Text(
                  table.availability ?? '',
                  style: CustomTextStyle.lightComponentsBadgeLabelBold.copyWith(
                      fontSize: 13,
                      color: table.availability?.toLowerCase() == 'available'
                          ? CustomColors.lightFgSuccess
                          : CustomColors.lightErrorMain),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 35,
            child: Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    disabled: table.availability?.toLowerCase() == 'reserved',
                    radius: 50,
                    buttonPrimaryType: ButtonPrimaryType.solidError,
                    label: 'Set Reserved',
                    onTap: () async {
                      final result = await context.confirmationPopUp(
                          context: context,
                          type: DialogType.warning,
                          titleMessage: 'Peringatan',
                          content:
                              'Apakah kamu yakin akan menjadikan meja ini RESERVED?');

                      if (result != null && result) {
                        SetTableReservationParams request =
                            SetTableReservationParams(
                                tableIds: [table.id ?? 0],
                                status: TableStatusEnum.reserved);
                        ref
                            .read(setTableReservationProvider.notifier)
                            .setTableReservation(request);
                      }
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: PrimaryButton(
                    disabled: table.availability?.toLowerCase() == 'available',
                    radius: 50,
                    label: 'Set Available',
                    onTap: () async {
                      final result = await context.confirmationPopUp(
                          context: context,
                          type: DialogType.warning,
                          titleMessage: 'Peringatan',
                          content:
                              'Apakah kamu yakin akan menjadikan meja ini AVAILABLE?');

                      if (result != null && result) {
                        SetTableReservationParams request =
                            SetTableReservationParams(
                                tableIds: [table.id ?? 0],
                                status: TableStatusEnum.available);
                        ref
                            .read(setTableReservationProvider.notifier)
                            .setTableReservation(request);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
