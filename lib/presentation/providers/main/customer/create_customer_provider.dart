import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../domain/entities/result.dart';
import '../../../../domain/entities/customer/customer_model.dart';
import '../../../../domain/usecases/customer/create_customer/create_customer_uc.dart';
import '../../usecases/customer/create_customer/create_customer_uc_provider.dart';

part 'create_customer_provider.g.dart';

@riverpod
class CreateCustomer extends _$CreateCustomer {
  @override
  FutureOr<CustomerModel?> build() => CustomerModel();

  Future<void> createCustomer(
      {required String name, required String phone}) async {
    state = const AsyncLoading();
    CreateCustomerUC createCustomerUC = ref.read(createCustomerUCProvider);
    var result =
        await createCustomerUC(CreateCustomerParams(name: name, phone: phone));
    switch (result) {
      case Success(value: final generalResponse):
        state = AsyncData(generalResponse.data);
      case Failed(message: _):
        state = const AsyncData(null);
    }
  }

  void setCustomerName(String? name) {
    state = AsyncData(state.value?.copyWith(name: name, id: null));
    log(state.value.toString());
  }

  void setCustomerPhone(String? phone) {
    state = AsyncData(state.value?.copyWith(phone: phone, id: null));
  }
}
