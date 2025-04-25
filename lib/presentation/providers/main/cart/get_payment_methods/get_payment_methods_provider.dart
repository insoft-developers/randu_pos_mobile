import 'dart:async';

import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/result.dart';
import '../../../../../domain/entities/transaction/cart/payment_method/payment_method_model.dart';
import '../../../../../core/const/constant.dart';
import '../../../usecases/cart/get_payment_methods/get_payment_methods_uc_provider.dart';
import '../../master_data_offline/payment_methods/master_data_offline_payment_methods_provider.dart';

part 'get_payment_methods_provider.g.dart';

@Riverpod(keepAlive: true)
class GetPaymentMethods extends _$GetPaymentMethods {
  @override
  FutureOr<List<PaymentMethodModel>> build() => const [];

  Future<void> fetchPaymentMethods({bool refresh = false}) async {
    state = const AsyncLoading();
    final box = Hive.box<PaymentMethodModel>(paymentMethodsData);
    if ((box.isNotEmpty && !refresh)) {
      state = AsyncData(box.values.toList());
    } else {
      late final Result<List<PaymentMethodModel>> result;
      final getPaymentMethodsUC = ref.read(getPaymentMethodsUCProvider);
      result = await getPaymentMethodsUC(null);
      switch (result) {
        case Success(value: final listPaymentMethods):
          ref
              .read(masterDataOfflinePaymentMethodsProvider.notifier)
              .savePaymentMethods(listPaymentMethods);
          state = AsyncData(listPaymentMethods);
        case Failed(message: _):
          state = const AsyncData([]);
      }
    }
  }
}
