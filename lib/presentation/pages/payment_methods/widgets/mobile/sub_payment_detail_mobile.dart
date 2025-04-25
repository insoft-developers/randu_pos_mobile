import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../insoft/controller/payment_method_controller.dart';
import '../../../../providers/main/cart/cart_provider.dart';
import '../../../../providers/main/cart/payment_method_selection/payment_method_selection_provider.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../../../../widgets/core/text_fields/custom_text_field.dart';
import '../sub_payment_method_card.dart';
import 'detail_bank_payment_mobile.dart';
import 'detail_cash_payment_mobile.dart';
import 'detail_payment_gateway_payment_mobile.dart';
import 'detail_qris_payment_mobile.dart';
import 'package:get/get.dart';

class SubPaymentDetailMobile extends ConsumerWidget {
  const SubPaymentDetailMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var paymentMethodSelection = ref.watch(paymentMethodSelectionProvider);
    var paymentId = paymentMethodSelection.paymentMethod != null
        ? paymentMethodSelection.paymentMethod!.id
        : 1;
    bool isTunai = paymentId == 1;
    bool isPaymentGateway = paymentId == 2;
    bool isBank = paymentId == 3;
    bool isPiutang = paymentId == 4;
    bool isQris = paymentId == 5;

    return isTunai
        ? const DetailCashPaymentMobile()
        : isPaymentGateway
            ? const DetailPaymentGatewayPaymentMobile()
            : isBank
                ? DetailBankPaymentMobile()
                : isPiutang
                    ? SubPaymentDetailOld()
                    : isQris
                        ? const DetailQrisPaymentMobile()
                        : const SizedBox.shrink();
  }
}

class SubPaymentDetailOld extends ConsumerWidget {
  SubPaymentDetailOld({super.key});

  final PaymentMethodController _pmc = Get.put(PaymentMethodController());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var totalPrice =
        ref.watch(cartProvider.select((value) => value.totalPrice));
    var paymentMethodSelection = ref.watch(paymentMethodSelectionProvider);
    final subPaymentMethod = paymentMethodSelection.subPaymentMethod;
    final subSubPaymentMethod = paymentMethodSelection.subSubPaymentMethod;
    final isManualInput = paymentMethodSelection.isManualInput;
    double contentWidth = MediaQuery.of(context).size.width - 32;
    double itemWidth = contentWidth / 2 - 4;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Pembayaran Kasbon / Piutang',
              style: CustomTextStyle.mobileDialogText
                  .copyWith(color: CustomColors.black),
            ),
            const SizedBox(
              height: 12,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.spaceBetween,
              children: [
                ...subPaymentMethod.map(
                  (e) => SizedBox(
                    width: itemWidth,
                    child: SubPaymentMethodCard(subMethod: e),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Pilih Flag',
              style: CustomTextStyle.mobileDialogText
                  .copyWith(color: CustomColors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Obx(
                () => _pmc.loading.value
                    ? const Center(child: Text('loading...'))
                    : _pmc.flagData.isEmpty
                        ? const Center(child: Text('No Flag'))
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: _pmc.flagData.length,
                            itemBuilder: (context, index) {
                              return Obx(
                                () => _pmc.flagData[index]['id'].toString() ==
                                        _pmc.selectedFlagId.value
                                    ? Container(
                                        margin: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5)),
                                            border: Border.all(
                                                color: Colors.black12),
                                            color: Colors.blue.shade200),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              _pmc.setSelectedFlag(
                                                  _pmc.flagData[index]);
                                            },
                                            splashColor:
                                                Colors.blue.withOpacity(0.3),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5)),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.transparent,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  _pmc.flagData[index]['flag']
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        margin: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5)),
                                            border: Border.all(
                                                color: Colors.black12),
                                            color: Colors.transparent),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {
                                              _pmc.setSelectedFlag(
                                                  _pmc.flagData[index]);
                                            },
                                            splashColor:
                                                Colors.blue.withOpacity(0.3),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5)),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.transparent,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  _pmc.flagData[index]['flag']
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                              );
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 4,
                                    childAspectRatio: 4),
                          ),
              ),
            ),
            const SizedBox(height: 24),
            Wrap(children: [
              const SizedBox(height: 8),
              ...subSubPaymentMethod.map((e) => Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: SubPaymentMethodCard(
                      subMethod: e,
                      isSubSub: true,
                    ),
                  ))),
              const SizedBox(height: 8),
              isManualInput
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Column(
                          children: [
                            const SizedBox(height: 8),
                            CustomTextField(
                              unfocusTapOutside: true,
                              hintText: 'Masukan Jumlah Bayar',
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  ref
                                      .read(paymentMethodSelectionProvider
                                          .notifier)
                                      .setTotalPaid(double.parse(value));
                                } else {
                                  ref
                                      .read(paymentMethodSelectionProvider
                                          .notifier)
                                      .setTotalPaid(totalPrice);
                                }
                              },
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(height: 8),
            ]),
          ],
        ),
      ),
    );
  }
}
