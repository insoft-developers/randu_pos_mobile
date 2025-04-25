import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/general_response.dart';
import '../../providers/main/report/outlet_expense/create_outlet_expense/create_outlet_expense_provider.dart';
import '../../providers/main/report/outlet_expense/get_outlet_expense/get_outlet_expense_provider.dart';
import '../../widgets/core/extension_dialog/extension_dialog.dart';
import '../../widgets/core/responsive/responsive_layout.dart';
import 'expenditure_data_page_Tablet.dart';
import 'expenditure_data_page_mobile.dart';

class ExpenditureDataPage extends ConsumerWidget {
  const ExpenditureDataPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(createOutletExpenseProvider, (previous, next) async {
      if (next is AsyncData) {
        final value = next.value;
        context.pop();
        await Future.delayed(const Duration(milliseconds: 100));
        if (value != null) {
          if (value.status) {
            if (context.mounted) {
              context.showResultDialog(baseResponse: value);
              ref.read(getOutletExpenseProvider.notifier).fetchExpenses();
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
        context.showLoadingDialog(title: 'Menunggu input data pengeluaran ...');
      }
    });
    return const ResponsiveLayout(
        mobileBody: ExpenditureDataPageMobile(),
        tabletBody: ExpenditureDataPageTablet());
  }
}
