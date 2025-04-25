import 'package:collection/collection.dart';

import '../../../presentation/widgets/core/buttons/primary_button.dart';

enum PrinterModeEnum {
  single(name: 'single'), multiple(name: 'multiple');

  final String name;
  const PrinterModeEnum({required this.name});

  static PrinterModeEnum findByName(String name) {
    return values.firstWhereOrNull((element) => element.name == name)??PrinterModeEnum.single;
  }
}

enum PrinterTypeEnum {
  allReceipt(
    name: 'Print Semua',
    buttonPrimaryType: ButtonPrimaryType.solidSuccess,
    isReceipt: true,
  ),
  cashier(
    name: 'Struk Konsumen',
    buttonPrimaryType: ButtonPrimaryType.solidPrimary,
    isReceipt: true,
  ),
  checker(
    name: 'Struk Checker',
    buttonPrimaryType: ButtonPrimaryType.solidOrange,
    isReceipt: true,
  ),
  dailyRecap(
    name: 'Rekapitulasi Harian',
    buttonPrimaryType: ButtonPrimaryType.solidWarning,
    isReceipt: false,
  );

  final String name;
  final ButtonPrimaryType buttonPrimaryType;
  final bool isReceipt;

  const PrinterTypeEnum(
      {required this.name,
      required this.buttonPrimaryType,
      required this.isReceipt});
}
