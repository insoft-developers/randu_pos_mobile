import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/remote/api_master_data_repository.dart';
import '../../../../data/repositories/i_master_data_repository.dart';
import '../../cores/http_client/dio_provider.dart';

part 'master_data_repository.g.dart';

@riverpod
IMasterDataRepository iMasterDataRepository(IMasterDataRepositoryRef ref) {
  return ApiMasterDataRepository(dio: ref.read(dioProvider));
}
