import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/result.dart';
import '../../../../../domain/entities/transaction/cart/payment_method/payment_method_model.dart';
import '../../../../../domain/usecases/master_data_offline/payment_methods/get_data_local_payment_methods_uc.dart';
import '../../../../../domain/usecases/master_data_offline/payment_methods/save_data_local_payment_methods_uc.dart';
import '../../../usecases/master_data_offline/payment_methods/get_data_local_payment_methods/get_data_local_payment_methods_uc_provider.dart';
import '../../../usecases/master_data_offline/payment_methods/save_data_local_payment_methods/save_data_local_payment_methods_uc_provider.dart';

part 'master_data_offline_payment_methods_provider.freezed.dart';
part 'master_data_offline_payment_methods_provider.g.dart';
part 'master_data_offline_payment_methods_state.dart';

@riverpod
class MasterDataOfflinePaymentMethods
    extends _$MasterDataOfflinePaymentMethods {
  @override
  MasterDataOfflinePaymentMethodsState build() {
    return const MasterDataOfflinePaymentMethodsState();
  }

  void getPaymentMethods() async {
    GetDataLocalPaymentMethodsUC getDataLocalPaymentMethodsUC =
        ref.read(getDataLocalPaymentMethodsUCProvider);
    final result = await getDataLocalPaymentMethodsUC(null);

    switch (result) {
      case Success(value: final listPaymentMethods):
        state = state.copyWith(paymentMethods: listPaymentMethods);
        break;
      case Failed(message: _):
        state = state.copyWith(paymentMethods: []);
        break;
    }
  }

  Future<void> savePaymentMethods(
      List<PaymentMethodModel> paymentMethods) async {
    SaveDataLocalPaymentMethodsUC saveDataLocalPaymentMethodsUC =
        ref.read(saveDataLocalPaymentMethodsUCProvider);
    final result = await saveDataLocalPaymentMethodsUC(paymentMethods);
    switch (result) {
      case Success():
        state = state.copyWith(paymentMethods: paymentMethods);
        break;
      case Failed(message: _):
        state = state.copyWith(paymentMethods: []);
        break;
    }
  }
}
