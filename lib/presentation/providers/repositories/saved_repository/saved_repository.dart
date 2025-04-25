import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/local/hive_saved_repository.dart';
import '../../../../data/repositories/i_saved_repository.dart';

part 'saved_repository.g.dart';

@riverpod
ISavedRepository iSavedRepository(ISavedRepositoryRef ref) {
  return HiveSavedRepository();
}
