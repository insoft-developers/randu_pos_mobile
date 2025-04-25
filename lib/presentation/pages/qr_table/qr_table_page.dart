import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/general_response.dart';
import '../../providers/main/report/qr_table/qr_table_provider.dart';
import '../../providers/main/report/qr_table/set_table_reservation/set_table_reservation_provider.dart';
import '../../widgets/core/extension_dialog/extension_dialog.dart';
import '../../widgets/core/responsive/responsive_layout.dart';
import 'qr_table_page_mobile.dart';
import 'qr_table_page_tablet.dart';

class QrTablePage extends ConsumerWidget {
  const QrTablePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(setTableReservationProvider, (previous, next) async {
      if (next is AsyncData) {
        final value = next.value;
        if (context.canPop()) {
          context.pop();
        }

        await Future.delayed(const Duration(milliseconds: 100));
        if (value != null) {
          if (value.status) {
            await ref.read(qrTableProvider.notifier).fetchTables('');
            if (context.mounted) {
              context.showResultDialog(baseResponse: value);
            }
          } else {
            if (context.mounted) {
              context.showResultDialog(
                  baseResponse:
                      GeneralResponse(status: false, message: value.message));
            }
          }
        }
      } else if (next is AsyncError) {
        context.pop();
        await Future.delayed(const Duration(milliseconds: 100));
        if (context.mounted) {
          context.showResultDialog(
              baseResponse: GeneralResponse(
                  status: false, message: next.error.toString()));
        }
      } else if (next is AsyncLoading) {
        context.showLoadingDialog(title: 'Mengubah satus meja ...');
      }
    });
    return const ResponsiveLayout(
      mobileBody: QrTablePageMobile(),
      tabletBody: QrTablePageTablet(),
    );
  }
}
