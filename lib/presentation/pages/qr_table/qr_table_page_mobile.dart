import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/const/colors.dart';
import '../../../domain/entities/transaction/cart/table_model.dart';
import '../../providers/main/report/qr_table/qr_table_provider.dart';
import '../../widgets/core/text/custom_text.dart';
import '../../widgets/core/text_fields/custom_text_field.dart';
import '../../widgets/shared/header/report_header_mobile.dart';
import 'widget/loading/qr_table_list_loading_mobile.dart';
import 'widget/qr_table_item.dart';

class QrTablePageMobile extends ConsumerStatefulWidget {
  const QrTablePageMobile({super.key});

  @override
  ConsumerState createState() => _QrTablePageMobileState();
}

class _QrTablePageMobileState extends ConsumerState<QrTablePageMobile> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final qrTable = ref.watch(qrTableProvider);
    List<TableModel> listQRTable =
        qrTable.value?.value?.reversed.toList() ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: CustomColors.primaryColor,
          child: const Column(
            children: [
              SizedBox(
                height: 12,
              ),
              ReportHeaderMobile(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: CustomText(
            'QR Meja & Reservasi',
            style: CustomTextStyle.h6Bold.copyWith(color: Colors.blue[900]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: CustomTextField(
            hintText: 'Cari Meja...',
            onChanged: (value) {
              return ref.read(qrTableProvider.notifier).fetchTables(value);
            },
          ),
        ),
        qrTable is AsyncLoading
            ? const Expanded(child: QrTableListLoadingMobile())
            : qrTable is AsyncError
                ? const Center(child: Text('Error'))
                : Expanded(
                    child: listQRTable.isEmpty
                        ? const Center(child: Text('Tidak ada data meja'))
                        : ListView.separated(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            itemCount: listQRTable.length,
                            itemBuilder: (context, index) {
                              TableModel table = listQRTable[index];
                              return QrTableItem(table: table);
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 8),
                          ),
                  ),
      ],
    );
  }
}
