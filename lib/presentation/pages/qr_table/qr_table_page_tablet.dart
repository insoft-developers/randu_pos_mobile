import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/const/colors.dart';
import '../../../domain/entities/transaction/cart/table_model.dart';
import '../../providers/main/report/qr_table/qr_table_provider.dart';
import '../../widgets/core/text/custom_text.dart';
import '../../widgets/core/text_fields/custom_text_field.dart';
import '../../widgets/shared/header/report_header_tablet.dart';
import 'widget/loading/qr_table_list_loading_tablet.dart';
import 'widget/qr_table_item.dart';

class QrTablePageTablet extends ConsumerStatefulWidget {
  const QrTablePageTablet({super.key});

  @override
  ConsumerState createState() => _QrTablePageTabletState();
}

class _QrTablePageTabletState extends ConsumerState<QrTablePageTablet> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // ref.read(qrTableProvider.notifier).fetchTables();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final qrTable = ref.watch(qrTableProvider);
    List<TableModel> listQRTable =
        qrTable.value?.value?.reversed.toList() ?? [];

    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: CustomColors.primaryColor,
              child: const Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  ReportHeaderTablet(),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      'QR Meja & Reservasi',
                      style: CustomTextStyle.h6Bold
                          .copyWith(color: Colors.blue[900]),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: CustomTextField(
                        hintText: 'Cari Meja...',
                        onChanged: (value) {
                          return ref
                              .read(qrTableProvider.notifier)
                              .fetchTables(value);
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    qrTable is AsyncLoading
                        ? const Expanded(child: QrTableListLoadingTablet())
                        : qrTable is AsyncError
                            ? const Center(child: Text('Error'))
                            : Expanded(
                                child: GridView.builder(
                                  itemCount: listQRTable.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 16,
                                    crossAxisSpacing: 16,
                                    childAspectRatio: 3,
                                  ),
                                  itemBuilder: (context, index) =>
                                      QrTableItem(table: listQRTable[index]),
                                ),
                              )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
