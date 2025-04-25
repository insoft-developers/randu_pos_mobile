import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/local/hive_printer_repository.dart';
import '../../../../data/repositories/i_printer_repository.dart';

part 'printer_repository.g.dart';

@riverpod
IPrinterRepository iPrinterRepository(Ref ref) {
  return HivePrinterRepository();
}
