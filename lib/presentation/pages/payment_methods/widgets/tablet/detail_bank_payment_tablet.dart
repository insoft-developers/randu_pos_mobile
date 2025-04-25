import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../insoft/controller/payment_method_controller.dart';
import '../../../../providers/main/cart/payment_method_selection/payment_method_selection_provider.dart';
import '../../../../widgets/core/container/custom_rounded_container.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../payment_bottom_button_group.dart';
import '../sub_payment_method_card.dart';

class DetailBankPaymentTablet extends ConsumerWidget {
  DetailBankPaymentTablet({super.key});

  final PaymentMethodController _pmc = Get.put(PaymentMethodController());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var paymentMethodSelection = ref.watch(paymentMethodSelectionProvider);
    final subPaymentMethod = paymentMethodSelection.subPaymentMethod;
    final subSubPaymentMethod = paymentMethodSelection.subSubPaymentMethod;
    final selectedSubPaymentMethod =
        paymentMethodSelection.selectedSubPaymentMethod;

    double contentWidth =
        (MediaQuery.of(context).size.width - (16 * 3 + 24 * 2)) * 2 / 3;
    double itemWidth = contentWidth / 3 - (12 * (3 / 2));

    return CustomRoundedContainer(
      padding: EdgeInsets.all(context.isMobile ? 16 : 24),
      shadow: const [
        BoxShadow(
          color: CustomColors.gray,
          blurRadius: 4,
        )
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pembayaran Transfer Bank',
            style: CustomTextStyle.tabletDialogTitle
                .copyWith(color: CustomColors.black),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomRoundedContainer(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
            radius: 8,
            shadow: const [],
            color: Colors.lightBlue.withValues(alpha: .2),
            child: Text(
              selectedSubPaymentMethod?.method ?? '-',
              style: CustomTextStyle.productName.copyWith(
                color: CustomColors.primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Pilih Bank',
            style: CustomTextStyle.tabletDialogTitle
                .copyWith(color: CustomColors.black),
          ),
          const SizedBox(height: 16),
          Wrap(
            runAlignment: WrapAlignment.spaceBetween,
            runSpacing: 12,
            spacing: 12,
            children: [
              ...subPaymentMethod.map(
                (e) => SizedBox(
                  width: itemWidth,
                  child: (SubPaymentMethodCard(subMethod: e)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(mainAxisSize: MainAxisSize.min, children: [
            ...subSubPaymentMethod.map(
              (e) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: SubPaymentMethodCard(
                    subMethod: e,
                    isSubSub: true,
                  ),
                ),
              ),
            ),
          ]),
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
            height: 200,
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
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          border:
                                              Border.all(color: Colors.black12),
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
                                          borderRadius: const BorderRadius.all(
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
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          border:
                                              Border.all(color: Colors.black12),
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
                                          borderRadius: const BorderRadius.all(
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
          const SizedBox(height: 20),
          Text(
            'Detail rekening',
            style: CustomTextStyle.tabletDialogTitle
                .copyWith(color: CustomColors.black),
          ),
          const SizedBox(height: 16),
          selectedSubPaymentMethod != null
              ? Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 150,
                          child: Text('Nama Bank'),
                        ),
                        Text(': ${selectedSubPaymentMethod.method ?? "-"}')
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 150,
                          child: Text('Nomor Rekening'),
                        ),
                        Text(
                            ': ${selectedSubPaymentMethod.bankAccountNumber ?? "-"}')
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 150,
                          child: Text('Atas Nama'),
                        ),
                        Text(': ${selectedSubPaymentMethod.bankOwner ?? "-"}')
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 150,
                          child: Text('Flag'),
                        ),
                        Obx(() =>
                            Text(': ${_pmc.selectedFlagName.value ?? "-"}'))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          const Spacer(),
          const PaymentBottomButtonGroup()
        ],
      ),
    );
  }
}
