import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../domain/usecases/master_data_offline/payment_methods/save_data_local_payment_methods_uc.dart';
import '../../../../repositories/master_data_offline_repository/master_data_offline_repository.dart';

part 'save_data_local_payment_methods_uc_provider.g.dart';

@riverpod
SaveDataLocalPaymentMethodsUC saveDataLocalPaymentMethodsUC(
        SaveDataLocalPaymentMethodsUCRef ref) =>
    SaveDataLocalPaymentMethodsUC(
        repository: ref.watch(iMasterDataOfflineRepositoryProvider));
