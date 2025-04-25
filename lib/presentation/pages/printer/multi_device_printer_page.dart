import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/const/colors.dart';
import '../../../core/const/constant.dart';
import '../../../core/utils/permission_utils.dart';
import '../../../domain/entities/user_model.dart';
import '../../providers/main/printer/multi_printer/printer_multi_provider.dart';
import '../../providers/main/printer/printer_service_provider.dart';
import '../../widgets/core/buttons/primary_button.dart';
import '../../widgets/core/text/custom_text.dart';
import 'widgets/printer_folder.dart';

class MultiDevicePrinterPage extends ConsumerStatefulWidget {
  const MultiDevicePrinterPage({super.key});

  @override
  ConsumerState createState() => _ListDevicePrinterState();
}

class _ListDevicePrinterState extends ConsumerState<MultiDevicePrinterPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(printerMultiProvider.notifier).getPrinterFolders();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Hive.box<UserModel>('userBox').get('userBox');
    final listFolder =
        ref.watch(printerMultiProvider.select((value) => value.printerFolders));
    return Scaffold(
      appBar: _buildAppBar(user, context),
      // backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            CustomText(
              'Atur Printer : ',
              style: CustomTextStyle.mobileDialogTitle
                  .copyWith(color: Colors.black),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: listFolder == null || listFolder.isEmpty
                  ? const Center(
                      child: Text('No Data'),
                    )
                  : ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: listFolder.length,
                      itemBuilder: (context, index) {
                        final folder = listFolder[index];
                        return FolderCard(folder: folder);
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  AppBar _buildAppBar(UserModel? user, BuildContext context) {
    return AppBar(
        title: GestureDetector(
          onTap: () {
            // print(user?.paperSize.width);
          },
          child: const CustomText(
            'Pengaturan Multi Printer',
          ),
        ),
        actions: [
          IconButton(
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
          ),
        ]);
  }

  Widget _buildBottomAppBar() {
    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 64,
      color: Colors.white,
      child: PrimaryButton(
        label: 'SIMPAN',
        onTap: () {
          ref.read(printerMultiProvider.notifier).saveChanges();
          Navigator.pop(context);
        },
        buttonPrimaryType: ButtonPrimaryType.solidPrimary,
      ),
    );
  }
}

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final Widget? leading;
  final List<Widget> children;
  final bool initiallyExpanded;

  const CustomExpansionTile({
    super.key,
    required this.title,
    this.leading,
    required this.children,
    this.initiallyExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColors.productBlue,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        initiallyExpanded: initiallyExpanded,
        leading: leading,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        childrenPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.centerLeft,
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        iconColor: Colors.blue, // Customize the icon color
        collapsedIconColor: Colors.grey,
        children: children, // Customize the collapsed icon color
      ),
    );
  }
}
