import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../core/const/colors.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../domain/entities/transaction/cart/product_model.dart';
import '../../../domain/entities/transaction/cart/receipt_from_enum.dart';
import '../../../domain/entities/transaction/cart/request/payment/payment_request_model.dart';
import '../../../domain/entities/transaction/sale_type/sale_type_enum.dart';
import '../../../domain/entities/user_model.dart';
import '../../providers/main/cart/cart_provider.dart';
import '../../widgets/core/line/Line.dart';
import '../../widgets/core/line/advanced_line.dart';
import '../../widgets/core/text/custom_text.dart';
import '../dashboard/utils/dashboard_utils.dart';
import 'receipt_utils.dart';

List<Map<VariantModel, int?>> convertListVariantToMap(
    List<VariantModel> variantList) {
  return variantList.map((variant) => {variant: variant.quantity}).toList();
}

class CoreReceiptPage extends ConsumerWidget {
  const CoreReceiptPage({super.key, required this.paymentReceipt});

  final PaymentReceiptModel paymentReceipt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems =
        ref.watch(cartProvider.select((value) => value.cartItems));
    final user = Hive.box<UserModel>('userBox').get('userBox');
    double tax = 0;
    // if(paymentReceipt.receiptFrom == ReceiptFromEnum.pos){
      tax = user?.tax ?? 0;
    // }else{
    //   tax = paymentReceipt.tax;
    // }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    if (user != null &&
                        user.photoLogo.isNotEmpty &&
                        user.isPremium)
                      Image.network(
                        user.photoLogo,
                        width: 100,
                        height: 100,
                      ),
                    Text(
                      formatPrinterText(user?.bussinessName ?? '', 16),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'CourierNew',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      formatPrinterText(user?.bussinessAddress ?? '', 32),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'CourierNew',
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Divider(),
              buildInfoRow(
                  'NO NOTA', paymentReceipt.referenceId ?? 'NON PAID ORDER'),
              buildInfoRow(
                  'WAKTU PESANAN',
                  formatDateToString(
                        paymentReceipt.createdAt,
                      ) ??
                      ''),
              buildInfoRow('CABANG', user?.branchName ?? '-'),
              buildInfoRow(
                  'KASIR',
                  paymentReceipt.staffName == null
                      ? user?.fullname ?? '-'
                      : paymentReceipt.staffName ?? ''),
              buildInfoRow('MEJA', paymentReceipt.table ?? '-'),
              buildInfoRow('NAMA', paymentReceipt.customer ?? '-'),
              buildInfoRow(
                  'PEMBAYARAN',
                  paymentReceipt.paymentMethod.isEmpty
                      ? ''
                      : paymentReceipt.paymentMethod),
              // buildInfoRow('Keterangan', paymentReceipt.)
              const SizedBox(
                height: 16,
              ),
              const DottedDivider(),
              const SizedBox(
                height: 16,
              ),
              ...paymentReceipt.products.map((product) {
                String saleTypeValue = 'price';
                if (paymentReceipt.receiptFrom == ReceiptFromEnum.report) {
                  saleTypeValue = paymentReceipt.priceType ?? 'price';
                } else {
                  saleTypeValue =
                      ref.watch(cartProvider.select((value) => value.saleType));
                }
                final type = SaleTypeEnum.findByString(saleTypeValue);
                final price = getProductPrice(product, type);
                return buildProductRow(
                  product: product,
                  quantity: product.quantityProduct,
                  productName: product.name ?? '-',
                  price: price,
                  totalPrice: product.quantityProduct * (price),
                  variants: cartItems.isNotEmpty
                      ? convertListVariantToMap(product.variant ?? [])
                      : convertListVariantToMap(product.variant ?? []),
                  saleType: saleTypeValue,
                );
              }),
              const DottedDivider(),
              buildInfoRow(
                  'SUB TOTAL',
                  formatStringIDRToCurrency(
                      text: (paymentReceipt.subTotal).toStringAsFixed(0),
                      symbol: 'Rp ')),
              buildInfoRow(
                  'DISKON (-)',
                  formatStringIDRToCurrency(
                      text: paymentReceipt.discount.toStringAsFixed(0),
                      symbol: 'Rp ')),
              buildInfoRow(
                  'SHIPPING / ORDER FEE (+)',
                  formatStringIDRToCurrency(
                      text: paymentReceipt.shipping.toStringAsFixed(0),
                      symbol: 'Rp ')),
              buildInfoRow(
                  'TAX / PAJAK (+)',
                  formatStringIDRToCurrency(
                      text:
                          '${(paymentReceipt.subTotal * (tax) / 100)}',
                      symbol: 'Rp ')),
              if (paymentReceipt.receiptFrom != ReceiptFromEnum.report &&
                  (user?.isRounded ?? false))
                buildInfoRow('PEMBULATAN', '${paymentReceipt.roundedTotal}'),
              const Divider(),
              buildTotalRow(
                  'TOTAL BAYAR',
                  formatStringIDRToCurrency(
                      text: (paymentReceipt.paid).toString(), symbol: 'Rp ')),
              const Divider(),
              Center(
                child: Column(
                  children: [
                    Text(
                      paymentReceipt.printerCustomFooter != null
                          ? paymentReceipt.printerCustomFooter!
                              .replaceAll('<p>', '')
                              .replaceAll('</p>', '')
                          : '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'CourierNew',
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '*** STRUK UNTUK KONSUMEN ***',
                      style: TextStyle(
                        fontFamily: 'CourierNew',
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow(String title, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'CourierNew',
                fontSize: 14,
              ),
            ),
          ),
          const Text(':'),
          Expanded(
            flex: 2,
            child: Text(
              info,
              style: const TextStyle(
                fontFamily: 'CourierNew',
                fontSize: 14,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProductRow(
      {
      required ProductModel product,
      required int quantity,
      required String productName,
      required int price,
      required int totalPrice,
      required List<Map<VariantModel, int?>> variants,
      required String saleType}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            style: TextStyle(
              fontFamily: 'CourierNew',
              fontSize: 14,
              color: (product.isPrinted??false) ? CustomColors.primaryColor : Colors.black,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  '${quantity}x',
                  style: TextStyle(
                    fontFamily: 'CourierNew',
                    fontSize: 14,
                    color: (product.isPrinted??false) ? CustomColors.primaryColor : Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  formatStringIDRToCurrency(
                      text: price.toStringAsFixed(0), symbol: 'Rp '),
                  style:  TextStyle(
                    fontFamily: 'CourierNew',
                    fontSize: 14,
                    color: (product.isPrinted??false) ? CustomColors.primaryColor : Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: Text(
                  formatStringIDRToCurrency(
                      text: totalPrice.toStringAsFixed(0), symbol: 'Rp '),
                  style:  TextStyle(
                    fontFamily: 'CourierNew',
                    fontSize: 14,
                    color: (product.isPrinted??false) ? CustomColors.primaryColor : Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          product.note != null && product.note!.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      CustomText(product.note ?? '',
                          style:  TextStyle(
                            fontFamily: 'CourierNew',
                            fontSize: 12,
                            color: (product.isPrinted??false) ? CustomColors.primaryColor : Colors.black,
                          )),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
          variants.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      ...variants.expand((variantMap) {
                        return variantMap.entries.map((entry) {
                          VariantModel variant = entry.key;
                          int quantity = entry.value ?? 0;
                          final type = SaleTypeEnum.findByString(saleType);
                          final price = getVariantPrice(variant, type);
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                variant.varianName ?? '-',
                                style:  TextStyle(
                                  fontFamily: 'CourierNew',
                                  fontSize: 14,
                                  color: (product.isPrinted??false) ? CustomColors.primaryColor : Colors.black,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomText(
                                      '$quantity x',
                                      style: TextStyle(
                                        fontFamily: 'CourierNew',
                                        fontSize: 14,
                                        color: (product.isPrinted??false) ? CustomColors.primaryColor : Colors.black,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      formatStringIDRToCurrency(
                                          text: price.toString(),
                                          symbol: 'Rp '),
                                      // Assuming `variant` has a `price` property
                                      style:  TextStyle(
                                        fontFamily: 'CourierNew',
                                        fontSize: 14,
                                        color: (product.isPrinted??false) ? CustomColors.primaryColor : Colors.black,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      formatStringIDRToCurrency(
                                          text: '${quantity * (price)}',
                                          symbol: 'Rp '),
                                      // This can be removed if it's a duplicate
                                      style:  TextStyle(
                                        fontFamily: 'CourierNew',
                                        fontSize: 14,
                                        color: (product.isPrinted??false) ? CustomColors.primaryColor : Colors.black,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                              if (variant.note != null &&
                                  variant.note!.isNotEmpty)
                                CustomText(
                                  variant.note ?? '',
                                  style: TextStyle(
                                    fontFamily: 'CourierNew',
                                    fontSize: 12,
                                    color: (product.isPrinted??false) ? CustomColors.primaryColor : Colors.black,
                                  ),
                                ),
                            ],
                          );
                        });
                      }),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget buildSubItemRow(String item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      child: Text(
        item,
        style: const TextStyle(
          fontFamily: 'CourierNew',
          fontSize: 14,
        ),
      ),
    );
  }

  Widget buildTotalRow(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'CourierNew',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              fontFamily: 'CourierNew',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}

class DottedDivider extends StatelessWidget {
  const DottedDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AdvancedLine(
      direction: Axis.horizontal,
      line: DashedLine(dashSize: 8),
      paintDef: Paint()
        ..color = CustomColors.darkGray
        ..strokeWidth = 1,
    );
  }
}
