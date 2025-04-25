import 'package:collection/collection.dart';

enum TableStatusEnum {
  available('Available'),
  reserved('Reserved');

  final String name;

  const TableStatusEnum(this.name);

  static TableStatusEnum findByString(String status) =>
      TableStatusEnum.values
          .firstWhereOrNull((element) => element.name == status) ??
          TableStatusEnum.available;
}
