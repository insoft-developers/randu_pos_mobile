import 'package:dio/dio.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:permission_handler/permission_handler.dart';

import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/permission_utils.dart';
import '../../../domain/entities/printer/printer_mode_enum.dart';
import '../../../domain/entities/printer/printer_model/printer_model.dart';
import '../../../domain/entities/report/daily_recap/daily_recap_model.dart';
import '../../../domain/entities/transaction/cart/receipt_from_enum.dart';
import '../../../domain/entities/transaction/cart/request/payment/payment_request_model.dart';
import '../../../domain/entities/transaction/sale_type/sale_type_enum.dart';
import '../../../domain/entities/user_model.dart';
import '../../../insoft/controller/payment_method_controller.dart';
import '../../providers/cores/router/go_router_provider.dart';
import '../../providers/main/printer/multi_printer/printer_multi_provider.dart';
import '../../providers/main/printer/printer_service_provider.dart';
import '../dashboard/utils/dashboard_utils.dart';
import 'package:get/get.dart';

String truncateWithEllipsis(String text, int maxLength) {
  if (text.length <= maxLength) {
    return text;
  } else {
    return text.substring(0, maxLength);
  }
}

String formatPrinterText(String text, int maxCharPerLine) {
  // Split the text into words
  List<String> words = text.split(' ');
  List<String> lines = [];
  String currentLine = '';

  for (String word in words) {
    // Check if adding the next word exceeds the max length
    if ((currentLine.isEmpty ? word : '$currentLine $word').length <=
        maxCharPerLine) {
      // Add word to current line
      currentLine = currentLine.isEmpty ? word : '$currentLine $word';
    } else {
      // Line would be too long, start a new line
      if (currentLine.isNotEmpty) {
        lines.add(currentLine);
      }
      currentLine = word;
    }
  }

  // Add the last line if it's not empty
  if (currentLine.isNotEmpty) {
    lines.add(currentLine);
  }

  // Join lines with newline character
  return lines.join('\n');
}

Future<img.Image?> getImageFromUrl(String imageUrl, PaperSize paperSize) async {
  try {
    // 1. Download image using Dio
    final dio = Dio();
    final response = await dio.get<List<int>>(
      imageUrl,
      options: Options(responseType: ResponseType.bytes),
    );

    // 2. Check if download was successful
    if (response.statusCode == 200 && response.data != null) {
      // 3. Convert to Uint8List
      final Uint8List uint8ListImage = Uint8List.fromList(response.data!);

      // 4. Decode image using image package
      img.Image? decodedImage = img.decodeImage(uint8ListImage);
      int maxWidth = 150;
      int? maxHeight;

      decodedImage = img.copyResize(
        decodedImage!,
        width: maxWidth,
        height: maxHeight,
        interpolation: img.Interpolation.average,
      );

      // Convert to black and white
      decodedImage = img.grayscale(decodedImage);

      // Adjust contrast and threshold
      // decodedImage = img.contrast(decodedImage, 150); // Increase contrast

      // Create a white background image
      img.Image whiteBackgroundImage = img.Image(
        width: decodedImage.width,
        height: decodedImage.height,
        format: img.Format.uint8,
        backgroundColor: img.ColorUint8.rgba(255, 255, 255, 255),
      );

      // Composite the black and white image onto white background
      img.compositeImage(whiteBackgroundImage, decodedImage, dstX: 0, dstY: 0);

      return whiteBackgroundImage;
      // return decodedImage;
    }
  } catch (e) {
    print('Error fetching image from URL: $e');
  }

  // Return null if image couldn't be processed
  return null;
}

// RECEIPT GENERATOR
extension PaymentReceiptModelExtensions on PaymentReceiptModel {
  Future<List<int>> generateReceipt({
    required UserModel user,
    required PaperSize paperSize,
    required CapabilityProfile capabilityProfile,
    required String businessName,
    required String businessAddress,
    required String footer,
    bool isCashier = false,
    bool isPrintAllProductChecker = false,
  }) async {
    final PaymentMethodController _payment = Get.put(PaymentMethodController());
    final Generator ticket = Generator(paperSize, capabilityProfile);
    List<int> bytes = [];
    void addRowToTicket(String label, String value) {
      bytes += ticket.row([
        PosColumn(text: label, width: 4), // Label column width
        PosColumn(text: ':', width: 1), // Colon column width
        PosColumn(
          text: value,
          width: 7, // Value column width
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
    }

    // ADD LOGO FOR PREMIUM USER
    if (user.photoLogo.isNotEmpty && user.isPremium) {
      img.Image? decodedImage = await getImageFromUrl(
          user.photoLogo,
          // 'https://static.vecteezy.com/system/resources/previews/021/059/827/non_2x/chatgpt-logo-chat-gpt-icon-on-white-background-free-vector.jpg',
          paperSize);
      if (decodedImage != null) {
        bytes += ticket.image(decodedImage);
      }
    }

    // Business Information
    bytes += ticket.text(
      formatPrinterText(businessName, paperSize == PaperSize.mm80 ? 20 : 16),
      styles: const PosStyles(
        align: PosAlign.center,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ),
      linesAfter: 1,
    );

    bytes += ticket.text(
      formatPrinterText(businessAddress, paperSize == PaperSize.mm80 ? 40 : 32),
      styles: const PosStyles(align: PosAlign.center),
    );
    bytes += ticket.hr();

    // Transaction Information
    addRowToTicket('NO NOTA', referenceId ?? 'NON PAID ORDER');
    addRowToTicket('WAKTU ${paperSize == PaperSize.mm80 ? 'PESANAN' : ''}',
        formatDateToString(createdAt, format: 'd MMM yy HH:mm') ?? '');
    addRowToTicket(
        'CABANG',
        truncateWithEllipsis(
            branchName ?? '', paperSize == PaperSize.mm80 ? 24 : 18));
    addRowToTicket(
        'KASIR',
        truncateWithEllipsis(
            staffName ?? '', paperSize == PaperSize.mm80 ? 24 : 18));
    addRowToTicket('MEJA', table ?? '');
    addRowToTicket(
        'NAMA',
        truncateWithEllipsis(
            customer ?? '', paperSize == PaperSize.mm80 ? 24 : 18));
    addRowToTicket('PEMBAYARAN', paymentMethod);
    addRowToTicket('FLAG', _payment.selectedFlagName.value);

    bytes += ticket.hr();

    // Product Details
    for (var product in products) {
      final int price = getProductPrice(
          product, SaleTypeEnum.findByString(priceType ?? 'price'));
      int quantityPrinted = 0;
      if (isCashier &&
          receiptFrom == ReceiptFromEnum.saved &&
          !isPrintAllProductChecker) {
        quantityPrinted = product.productForChecker
            .where((element) => (!((element.isPrinted ?? false))))
            .length;
        if (quantityPrinted == 0) {
          continue;
        }
      } else {
        quantityPrinted = product.quantity ?? 0;
      }
      bytes += ticket.text(
        formatPrinterText(
            isCashier
                ? '[ ]  ${quantityPrinted}x  ${product.name ?? ''}'
                : product.name ?? '',
            paperSize == PaperSize.mm80 ? 40 : 32),
        styles: const PosStyles(align: PosAlign.left),
      );

      if (!isCashier) {
        //PRICE
        bytes += ticket.row([
          PosColumn(text: '${quantityPrinted}x', width: 2),
          PosColumn(
              text: price == 0
                  ? ''
                  : formatStringIDRToCurrency(
                      text: price.toStringAsFixed(0), symbol: ''),
              width: 5,
              styles: const PosStyles(align: PosAlign.right)),
          PosColumn(
              text: formatStringIDRToCurrency(
                  text: '${quantityPrinted * (price)}', symbol: ''),
              width: 5,
              styles: const PosStyles(align: PosAlign.right)),
        ]);
      }

      //NOTE PRODUCT
      if (product.note != null && product.note!.isNotEmpty) {
        bytes += ticket.text(
          '   note : ${product.note ?? ''}',
          styles: const PosStyles(align: PosAlign.left),
        );
      }

      if (product.variant != null && product.variant!.isNotEmpty) {
        for (var variant in product.variant!) {
          if (!isCashier) {
            final int variantPrice = getVariantPrice(variant, product.saleType);
            bytes += ticket.text(
              variant.varianName == null ? '-' : '   ${variant.varianName}',
              styles: const PosStyles(align: PosAlign.left),
            );
            bytes += ticket.row([
              PosColumn(text: '   ${variant.quantity}x', width: 3),
              // PosColumn(text: variant.varianName ?? '-', width: 4),
              PosColumn(
                  text: formatStringIDRToCurrency(
                      text: variantPrice.toStringAsFixed(0), symbol: ''),
                  width: 4,
                  styles: const PosStyles(align: PosAlign.right)),
              PosColumn(
                  text: formatStringIDRToCurrency(
                      text: '${(variant.quantity ?? 0) * (variantPrice)}',
                      symbol: ''),
                  width: 5,
                  styles: const PosStyles(align: PosAlign.right)),
            ]);
          } else {
            bytes += ticket.text(
              variant.varianName == null
                  ? '-'
                  : '     ${variant.quantity}x   ${variant.varianName}',
              styles: const PosStyles(align: PosAlign.left),
            );
          }

          //NOTE VARIANT
          if (variant.note != null && variant.note!.isNotEmpty) {
            bytes += ticket.text(
              '   note : ${variant.note ?? ''}',
              styles: const PosStyles(align: PosAlign.left),
            );
          }
        }
      }
    }

    bytes += ticket.hr();

    if (!isCashier) {
      // Totals and Payment Details
      bytes += ticket.row([
        PosColumn(text: 'SUBTOTAL ${products.length} PRODUK', width: 7),
        PosColumn(text: ':', width: 1),
        PosColumn(
            text: formatStringIDRToCurrency(
                text: subTotal.toStringAsFixed(0), symbol: 'Rp '),
            width: 4,
            styles: const PosStyles(align: PosAlign.right)),
      ]);

      bytes += ticket.row([
        PosColumn(text: 'DISKON (-)', width: 7),
        PosColumn(text: ':', width: 1),
        PosColumn(
            text: formatStringIDRToCurrency(
                text: discount.toStringAsFixed(0), symbol: 'Rp '),
            width: 4,
            styles: const PosStyles(align: PosAlign.right)),
      ]);

      bytes += ticket.row([
        PosColumn(text: 'ORDER FEE (+)', width: 7),
        PosColumn(text: ':', width: 1),
        PosColumn(
            text: formatStringIDRToCurrency(
                text: shipping.toStringAsFixed(0), symbol: 'Rp '),
            width: 4,
            styles: const PosStyles(align: PosAlign.right)),
      ]);

      bytes += ticket.row([
        PosColumn(text: 'TAX / PAJAK (+) $tax%', width: 7),
        PosColumn(text: ':', width: 1),
        PosColumn(
            text: formatStringIDRToCurrency(
                text: (subTotal * tax / 100).toStringAsFixed(0), symbol: 'Rp '),
            width: 4,
            styles: const PosStyles(align: PosAlign.right)),
      ]);

      // Rounded total
      if (roundedTotal != null &&
          roundedTotal!.isNotEmpty &&
          (isRounded ?? false)) {
        bytes += ticket.row([
          PosColumn(text: 'Pembulatan', width: 7),
          PosColumn(text: ':', width: 1),
          PosColumn(
              text: roundedTotal ?? '',
              width: 4,
              styles: const PosStyles(align: PosAlign.right)),
        ]);
      }
      bytes += ticket.hr();

      bytes += ticket.row([
        PosColumn(
          text: 'TOTAL ${paperSize == PaperSize.mm80 ? 'BAYAR' : ''}',
          width: 4,
          styles: const PosStyles(
            bold: true,
            height: PosTextSize.size1,
            width: PosTextSize.size1,
          ),
        ),
        PosColumn(
          text: formatStringIDRToCurrency(
              text: paid.toStringAsFixed(0), symbol: 'Rp '),
          width: 8,
          styles: const PosStyles(
            bold: true,
            align: PosAlign.right,
            height: PosTextSize.size2,
            width: PosTextSize.size2,
          ),
        ),
      ]);

      // Footer and Receipt Type
      bytes += ticket.hr();
      bytes +=
          ticket.text(footer, styles: const PosStyles(align: PosAlign.center));
      bytes += ticket.text(
          isCashier
              ? '*** STRUK UNTUK KASIR ***'
              : '*** STRUK UNTUK KONSUMEN ***',
          styles: const PosStyles(align: PosAlign.center));
    } else {
      bytes += ticket.hr();
      bytes += ticket.text(
          isCashier
              ? '*** STRUK UNTUK CHECKER ***'
              : '*** STRUK UNTUK KONSUMEN ***',
          styles: const PosStyles(align: PosAlign.center));
    }

    bytes += ticket.emptyLines(2);
    ticket.cut();

    return bytes;
  }
}

// QRCODE GENERATOR
Future<List<int>> generateQRCode({
  required PaperSize paperSize,
  required CapabilityProfile capabilityProfile,
  required String businessName,
  required String businessAddress,
  required String footer,
  required String qrCode,
}) async {
  final Generator ticket = Generator(paperSize, capabilityProfile);
  List<int> bytes = [];
  // Business Information
  bytes += ticket.text(
    formatPrinterText(businessName, paperSize == PaperSize.mm80 ? 20 : 16),
    styles: const PosStyles(
      align: PosAlign.center,
      height: PosTextSize.size2,
      width: PosTextSize.size2,
    ),
    linesAfter: 1,
  );

  bytes += ticket.text(
    formatPrinterText(businessName, paperSize == PaperSize.mm80 ? 40 : 32),
    styles: const PosStyles(align: PosAlign.center),
  );
  bytes += ticket.hr();

  // QR Code
  bytes += ticket.text('SCAN DISINI',
      styles: const PosStyles(align: PosAlign.center));
  bytes += ticket.emptyLines(2);
  bytes += ticket.qrcode(qrCode);
  // Footer and Wi-Fi Information
  bytes += ticket.hr();
  bytes += ticket.text(footer, styles: const PosStyles(align: PosAlign.center));
  bytes += ticket.text('*** SCAN QRCODE ***',
      styles: const PosStyles(align: PosAlign.center));

  bytes += ticket.emptyLines(2);
  ticket.cut();

  return bytes;
}

Future<void> checkPrinterStatus({
  required WidgetRef ref,
  required BuildContext context,
  required VoidCallback onGrantedPermissionCallback,
  required PrinterModeEnum printerMode,
  required PrinterTypeEnum type,
  bool isIndividual = false, // print one by one
}) async {
  if (printerMode == PrinterModeEnum.single || isIndividual) {
    ref.read(printerMultiProvider.notifier).getPrinterFolders();
    PrinterModel? selectedPrinter;
    if (isIndividual) {
      selectedPrinter =
          await ref.read(printerMultiProvider.notifier).checkPrinter(type);
      print('printer available ${type.name} : ');
      print(selectedPrinter!.name);
    }
    await _handleSinglePrinterMode(ref, context, onGrantedPermissionCallback,
        isIndividual, selectedPrinter);
  } else {
    print('is multiple');
    await _handleMultiplePrinterMode(
        ref, context, onGrantedPermissionCallback, type);
  }
}

Future<void> _handleSinglePrinterMode(
  WidgetRef ref,
  BuildContext context,
  VoidCallback onGrantedPermissionCallback,
  bool isIndividual,
  PrinterModel? selectedPrinter,
) async {
  if (!isIndividual) {
    // individual print but from multiple printer mode
    final printerSingle = ref.read(printerServiceProvider).connectedPrinter;
    if (printerSingle != null) {
      print('connected printer is not null');
      await _checkBluetoothPermission(
        context,
        onGrantedPermissionCallback,
      );
    } else {
      ref.read(routerProvider).push('/settings', extra: true);
    }
  } else {
    if (selectedPrinter != null) {
      print('selected printer ${selectedPrinter.name}');
      await ref
          .read(printerServiceProvider.notifier)
          .connectSinglePrinter2(selectedPrinter);
      await _checkBluetoothPermission(
        context,
        onGrantedPermissionCallback,
      );
    } else {
      ref.read(routerProvider).push('/settings', extra: true);
    }
  }
}

Future<void> _handleMultiplePrinterMode(
  WidgetRef ref,
  BuildContext context,
  VoidCallback onGrantedPermissionCallback,
  PrinterTypeEnum type,
) async {
  await ref.read(printerMultiProvider.notifier).getPrinterFolders();
  final isPrinterAvailable =
      ref.watch(printerMultiProvider).isPrinterAvailable(type);
  if (isPrinterAvailable) {
    print('is printer available : $isPrinterAvailable');
    await _checkBluetoothPermission(
      context,
      onGrantedPermissionCallback,
    );
  } else {
    ref.read(routerProvider).push('/multi_device_printer');
  }
}

Future<void> _checkBluetoothPermission(
  BuildContext context,
  VoidCallback onGrantedPermissionCallback,
) async {
  await checkPermission(
    permission: Permission.bluetooth,
    onGrantedPermissionCallback: onGrantedPermissionCallback,
    onPermanentlyDeniedPermissionCallback: () =>
        permissionPermanentlyDeniedPopUp(
      context,
      permissionType: PermissionTypeEnum.bluetooth,
    ),
  );
}

// QRCODE GENERATOR
Future<List<int>> generateDailyRecap({
  required PaperSize paperSize,
  required CapabilityProfile capabilityProfile,
  required DailyRecapModel data,
}) async {
  final Generator ticket = Generator(paperSize, capabilityProfile);
  List<int> bytes = [];
  void addRowToTicket(String label, String value,
      {PosAlign align = PosAlign.left, bool isHeader = true}) {
    bytes += ticket.row([
      PosColumn(text: label, width: isHeader ? 4 : 7), // Lebar kolom label
      PosColumn(text: ':', width: 1), // Lebar kolom titik dua
      PosColumn(
        text: value,
        width: isHeader ? 7 : 4, // Lebar kolom nilai
        styles: PosStyles(align: align),
      ),
    ]);
  }

  addRowToTicket('Nama Toko', data.nameToko ?? '');
  addRowToTicket('Nama Kasir', data.nameKasir ?? '');
  addRowToTicket(
      'Buka',
      data.openCashierAt == null
          ? '-'
          : formatDateToString(data.openCashierAt!,
                  format: 'dd-MM-yyyy HH:mm') ??
              '-');
  addRowToTicket(
      'Tutup',
      data.closeCashierAt == null
          ? '-'
          : formatDateToString(data.closeCashierAt!) ?? '-');

  bytes += ticket.emptyLines(1);
  bytes += ticket.hr(
    linesAfter: 1,
  );

  addRowToTicket(
      'Kas Awal',
      data.initialCash == null
          ? '-'
          : formatStringIDRToCurrency(
              text: data.initialCash.toString(), symbol: 'Rp '),
      align: PosAlign.right,
      isHeader: false);
  bytes += ticket.hr();
  addRowToTicket(
      'Penjualan Tunai',
      data.cashSale == null
          ? '-'
          : formatStringIDRToCurrency(
              text: data.cashSale.toString(), symbol: 'Rp '),
      align: PosAlign.right,
      isHeader: false);
  bytes += ticket.hr();
  addRowToTicket(
      'Penjualan Transfer / EDC',
      data.transferSales == null
          ? '-'
          : formatStringIDRToCurrency(
              text: data.transferSales.toString(), symbol: 'Rp '),
      align: PosAlign.right,
      isHeader: false);
  bytes += ticket.hr();
  addRowToTicket(
      'Penjualan Payment Gateway',
      data.paymentGatewaySales == null
          ? '-'
          : formatStringIDRToCurrency(
              text: data.paymentGatewaySales.toString(), symbol: 'Rp '),
      align: PosAlign.right,
      isHeader: false);
  bytes += ticket.hr();
  addRowToTicket(
      'Penjualan Piutang',
      data.piutangSales == null
          ? '-'
          : formatStringIDRToCurrency(
              text: data.piutangSales.toString(), symbol: 'Rp '),
      align: PosAlign.right,
      isHeader: false);
  bytes += ticket.hr();
  addRowToTicket(
      'Pengeluaran Outlet',
      data.outletOutput == null
          ? '-'
          : formatStringIDRToCurrency(
              text: data.outletOutput.toString(), symbol: 'Rp '),
      align: PosAlign.right,
      isHeader: false);
  bytes += ticket.hr();
  addRowToTicket(
      'Total Kas Tunai',
      data.totalCash == null
          ? '-'
          : formatStringIDRToCurrency(
              text: data.totalCash.toString(), symbol: 'Rp '),
      align: PosAlign.right,
      isHeader: false);
  bytes += ticket.hr();
  addRowToTicket(
      'Total Penjualan + Kas Awal',
      formatStringIDRToCurrency(
          text: '${(data.totalSales ?? 0) + (data.initialCash ?? 0)}',
          symbol: 'Rp '),
      align: PosAlign.right,
      isHeader: false);
  bytes += ticket.hr();

  bytes += ticket.emptyLines(2);
  ticket.cut();

  return bytes;
}

Future<List<int>> generateDailyRecap2({
  required PaperSize paperSize,
  required CapabilityProfile capabilityProfile,
  required Map<String, dynamic> data,
}) async {
  final profile = await CapabilityProfile.load();
  final generator = Generator(paperSize, profile);
  List<int> bytes = [];

  bytes += generator.text(
    'Rekap Harian',
    styles: const PosStyles(
      align: PosAlign.center,
      bold: true,
      height: PosTextSize.size2,
      width: PosTextSize.size2,
    ),
    linesAfter: 1,
  );

  bytes += generator.hr();
  bytes += generator.row([
    PosColumn(text: 'Nama Toko', width: 6),
    PosColumn(text: ':', width: 1),
    PosColumn(
      text: data['nama_toko'],
      width: 5,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);

  bytes += generator.row([
    PosColumn(text: 'Nama Kasir', width: 6),
    PosColumn(text: ':', width: 1),
    PosColumn(
      text: data['user']['fullname'] ?? '-',
      width: 5,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);

  bytes += generator.row([
    PosColumn(text: 'Buka', width: 6),
    PosColumn(text: ':', width: 1),
    PosColumn(
      text: data['kas_kecil']['open_cashier_at'] ?? '-',
      width: 5,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);

  bytes += generator.row([
    PosColumn(text: 'Tutup', width: 6),
    PosColumn(text: ':', width: 1),
    PosColumn(
      text: data['kas_kecil']['close_cashier_at'] ?? '-',
      width: 5,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);

  bytes += generator.hr();
  bytes += generator.row([
    PosColumn(text: 'Kas Awal', width: 6),
    PosColumn(text: ':', width: 1),
    PosColumn(
      text: formatStringIDRToCurrency(
          text: '${(data['kas_kecil']['initial_cash_amount'] ?? 0)}',
          symbol: 'Rp '),
      width: 5,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);
  bytes += generator.hr();
  bytes += generator.row([
    PosColumn(text: 'Penjualan Kas/Bayar Tunai di Kasir', width: 6),
    PosColumn(text: ':', width: 1),
    PosColumn(
      text: formatStringIDRToCurrency(
          text: '${(data['tunai'] ?? 0)}', symbol: 'Rp '),
      width: 5,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);
  bytes += generator.hr();
  bytes += generator.row([
    PosColumn(text: 'Penjualan Payment Gateway/QRIS Randu Wallet', width: 6),
    PosColumn(text: ':', width: 1),
    PosColumn(
      text: formatStringIDRToCurrency(
          text: '${(data['pg'] ?? 0)}', symbol: 'Rp '),
      width: 5,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);
  bytes += generator.hr();
  bytes += generator.row([
    PosColumn(
        text: 'Penjualan Transfer Rekening/EDC/QRIS/Toko (Cek Manual)',
        width: 6),
    PosColumn(text: ':', width: 1),
    PosColumn(
      text: formatStringIDRToCurrency(
          text: '${(data['transfer'] ?? 0)}', symbol: 'Rp '),
      width: 5,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);

  for (var i = 0; i < data['banks'].length; i++) {
    bytes += generator.row([
      PosColumn(text: data['banks'][i]['bank'].toString(), width: 6),
      PosColumn(text: ':', width: 1),
      PosColumn(
        text: formatStringIDRToCurrency(
            text: '${(data['banks'][i]['perbank'] ?? 0)}', symbol: 'Rp '),
        width: 5,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    var items = data['banks'][i]['flags'];
    for (var a = 0; a < items.length; a++) {
      bytes += generator.row([
        PosColumn(text: '- ${items[a]['flag']}', width: 6),
        PosColumn(text: ':', width: 1),
        PosColumn(
          text: formatStringIDRToCurrency(
              text: '${(items[a]['perflag'] ?? 0)}', symbol: 'Rp '),
          width: 5,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
    }
  }

  bytes += generator.hr();
  bytes += generator.row([
    PosColumn(text: 'Penjualan Piutang/Kasbon', width: 6),
    PosColumn(text: ':', width: 1),
    PosColumn(
      text: formatStringIDRToCurrency(
          text: '${(data['piutang'] ?? 0)}', symbol: 'Rp '),
      width: 5,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);
  for (var i = 0; i < data['kasbon'].length; i++) {
    bytes += generator.row([
      PosColumn(text: data['kasbon'][i]['method'], width: 6),
      PosColumn(text: ':', width: 1),
      PosColumn(
        text: formatStringIDRToCurrency(
            text: '${(data['kasbon'][i]['perkasbon'] ?? 0)}', symbol: 'Rp '),
        width: 5,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    var items = data['kasbon'][i]['flags'];
    for (var a = 0; a < items.length; a++) {
      bytes += generator.row([
        PosColumn(text: '- ${items[a]['flag']}', width: 6),
        PosColumn(text: ':', width: 1),
        PosColumn(
          text: formatStringIDRToCurrency(
              text: '${(items[a]['perflag'] ?? 0)}', symbol: 'Rp '),
          width: 5,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
    }
  }

  bytes += generator.hr();
  bytes += generator.row([
    PosColumn(text: 'Total Penjualan Tunai', width: 6),
    PosColumn(text: ':', width: 1),
    PosColumn(
      text: formatStringIDRToCurrency(
          text: '${(data['tunai'] ?? 0)}', symbol: 'Rp '),
      width: 5,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);
  bytes += generator.hr();
  bytes += generator.row([
    PosColumn(text: 'Total Penjualan Non Tunai', width: 6),
    PosColumn(text: ':', width: 1),
    PosColumn(
      text: formatStringIDRToCurrency(
          text: '${(data['omset'] - data['tunai'] ?? 0)}', symbol: 'Rp '),
      width: 5,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);
  bytes += generator.hr();
  bytes += generator.row([
    PosColumn(text: 'Total Penjualan Tunai + Kas Awal', width: 6),
    PosColumn(text: ':', width: 1),
    PosColumn(
      text: formatStringIDRToCurrency(
          text:
              '${(data['kas_kecil']['initial_cash_amount'] + data['tunai'] ?? 0)}',
          symbol: 'Rp '),
      width: 5,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);
  bytes += generator.hr();
  bytes += generator.row([
    PosColumn(text: 'Pengeluaran Outlet', width: 6),
    PosColumn(text: ':', width: 1),
    PosColumn(
      text: formatStringIDRToCurrency(
          text: '${(data['outlet_output'] ?? 0)}', symbol: 'Rp '),
      width: 5,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);
  bytes += generator.hr();
  bytes += generator.row([
    PosColumn(text: 'Saldo Akhir Kas Awal', width: 6),
    PosColumn(text: ':', width: 1),
    PosColumn(
      text: formatStringIDRToCurrency(
          text:
              '${(data['kas_kecil']['initial_cash_amount'] + data['tunai'] - data['outlet_output'] ?? 0)}',
          symbol: 'Rp '),
      width: 5,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);
  bytes += generator.hr();
  bytes += generator.row([
    PosColumn(text: 'Omset Penjualan', width: 6),
    PosColumn(text: ':', width: 1),
    PosColumn(
      text: formatStringIDRToCurrency(
          text: '${(data['omset'] ?? 0)}', symbol: 'Rp '),
      width: 5,
      styles: const PosStyles(align: PosAlign.right),
    ),
  ]);

  bytes += generator.hr();

  bytes += generator.text('*Rekapitulasi Harian*',
      styles: const PosStyles(align: PosAlign.center));
  bytes += generator.cut();

  return bytes;
}

Future<List<int>> openCashDrawer() async {
  print('open drawer');
  // Open cash drawer
  List<int> drawerBytes = [27, 112, 0, 25, 250]; // ESC p 0 25 250
  return drawerBytes;
}
