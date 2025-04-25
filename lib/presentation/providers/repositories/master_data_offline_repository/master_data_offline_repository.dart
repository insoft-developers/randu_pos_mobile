import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/local/hive_master_data_offline_repository.dart';
import '../../../../data/repositories/i_master_data_offline_repository.dart';

part 'master_data_offline_repository.g.dart';

@riverpod
IMasterDataOfflineRepository iMasterDataOfflineRepository(
    IMasterDataOfflineRepositoryRef ref) {
  return HiveMasterDataOfflineRepository();
}
