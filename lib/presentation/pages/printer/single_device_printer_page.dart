import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:oktoast/oktoast.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/const/colors.dart';
import '../../../core/const/constant.dart';
import '../../../core/enum/response_state.dart';
import '../../../core/utils/permission_utils.dart';
import '../../../domain/entities/printer/paper_size.dart';
import '../../../domain/entities/printer/printer_folder/printer_folder.dart';
import '../../../domain/entities/user_model.dart';
import '../../providers/main/printer/printer_service_provider.dart';
import '../../widgets/core/buttons/primary_button.dart';
import '../../widgets/core/chips/selectable_chips.dart';
import '../../widgets/core/container/custom_rounded_container.dart';
import '../../widgets/core/extension_dialog/extension_dialog.dart';
import '../../widgets/core/text/custom_text.dart';
import 'widgets/list_printer_page.dart';

class SingleDevicePrinterPage extends ConsumerStatefulWidget {
  const SingleDevicePrinterPage({super.key});

  @override
  ConsumerState createState() => _ListDevicePrinterState();
}

class _ListDevicePrinterState extends ConsumerState<SingleDevicePrinterPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        ref
            .read(printerServiceProvider.notifier)
            .startScanPrinter(isDummy: fakePrinters, isRefresh: false);

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Hive.box<UserModel>('userBox').get('userBox');
    connectPrinterListener(context);
    // ref.listen(printerSingleProvider, (previous, next) {
    //   if (next.selectedSinglePrinter != null) {
    //     ref
    //         .read(printerServiceProvider.notifier)
    //         .chooseSinglePrinter(next.selectedSinglePrinter!);
    //   }
    // });
    return Scaffold(
      appBar: _buildAppBar(user, context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              'Ukuran Kertas',
              style: CustomTextStyle.mobileDialogTitle
                  .copyWith(color: Colors.black),
            ),
            const SizedBox(height: 10),
            _choosePrinterSize(listPageSize, user),
            const SizedBox(height: 24),
            const CustomText(
                'Pengaturan footer custom hanya dapat dilakukan di web https://app.randu.co.id'),
            const SizedBox(height: 24),
            CustomText(
              'Perangkat Terhubung',
              style: CustomTextStyle.mobileDialogTitle
                  .copyWith(color: Colors.black),
            ),
            const SizedBox(height: 16),
            // Set the is Dummy to false to use real data
            const PrinterList()
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  CustomRoundedContainer _noPrinterConnectedWidget() {
    return CustomRoundedContainer(
      padding: const EdgeInsets.all(16),
      radius: 8,
      shadow: const [],
      border: Border.all(color: CustomColors.gray),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.print_disabled_rounded,
            color: CustomColors.gray,
            size: 70,
          ),
          const SizedBox(height: 8),
          CustomText(
            'Tidak ada printer terhubung',
            style: CustomTextStyle.body2.copyWith(
              color: CustomColors.darkGray,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  void connectPrinterListener(BuildContext context) {
    ref.listen<ResponseState>(
        printerServiceProvider.select((value) => value.connectBluetoothState),
        (previous, next) {
      if (next == ResponseState.ok) {
        showToast('Printer terhubung');
        context.pop();
        if (context.canPop()) context.pop();
      } else if (next == ResponseState.error) {
        // showToast('Printer gagal terhubung');
        context.pop();
      } else if (next == ResponseState.loading) {
        // showToast('Menghubungkan Printer');
        context.showLoadingDialog();
      }
    });
  }

  BottomAppBar _buildBottomAppBar() {
    final selectedTempPrinter = ref.watch(printerServiceProvider.select((value) => value.getSelectedTempPrinter));
    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 64,
      color: Colors.white,
      child: PrimaryButton(
        disabled: selectedTempPrinter == null,
        radius: 8,
        // isLoading: ref.watch(printerServiceProvider.select(
        //         (value) => value.connectBluetoothState == ResponseState.loading)),
        expandableHeight: true,
        preFixWidget: const Padding(
          padding: EdgeInsets.only(right: 8),
          child: Icon(Icons.print),
        ),
        label: 'PILIH',
        onTap: () {

          final connectedPrinter = ref.watch(printerServiceProvider.select((value) => value.connectedPrinter));
          if(selectedTempPrinter == connectedPrinter){
            context.pop();
            return;
          }
          ref.read(printerServiceProvider.notifier).connectSinglePrinter();
        },
      ),
    );
  }

  AppBar _buildAppBar(UserModel? user, BuildContext context) {
    return AppBar(
        title: GestureDetector(
          onTap: () {
            // print(user?.paperSize.width);
          },
          child: CustomText(
            'Scan Printer',
            style: CustomTextStyle.h6.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          _refreshIcon(context),
        ]);
  }

  IconButton _refreshIcon(BuildContext context) {
    return IconButton(
      onPressed: () {
        checkPermission(
          permission: Platform.isAndroid
              ? Permission.bluetoothScan
              : Permission.bluetooth,
          onGrantedPermissionCallback: () {
            ref
                .read(printerServiceProvider.notifier)
                .startScanPrinter(isDummy: fakePrinters);
          },
          onPermanentlyDeniedPermissionCallback: () =>
              permissionPermanentlyDeniedPopUp(
            context,
            permissionType: PermissionTypeEnum.bluetooth,
          ),
        );
      },
      icon: const Icon(
        Icons.refresh_rounded,
        color: Colors.white,
      ),
    );
  }

  Consumer _choosePrinterSize(
      List<MapEntry<String, PaperSizeModel>> listPageSize, UserModel? user) {
    return Consumer(builder: (context, ref, child) {
      final paperSize = ref.watch(printerServiceProvider
          .select((value) => value.paperSizeSinglePrinter));
      return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          ...listPageSize.map((e) {
            return SizedBox(
              width: (MediaQuery.of(context).size.width - (32 + 16)) / 3,
              child: SelectableChips(
                horizontalPadding: 16,
                label: (e.key).toString(),
                active: e.value == paperSize,
                onTap: () {
                  ref
                      .read(printerServiceProvider.notifier)
                      .setPaperSize(e.value);
                },
              ),
            );
          }),
        ],
      );
    });
  }
}
