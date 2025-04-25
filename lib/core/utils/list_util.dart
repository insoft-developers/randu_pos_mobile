import '../../../domain/entities/report/transaction_management/transaction_management_model.dart';

enum FilterDateEnum {
  today,
  yesterday,
  range,
}

List<TransactionManagementModel> filterTransactionManagementModelByDate(
    List<TransactionManagementModel> items,
    {required FilterDateEnum filter,
    DateTime? startDate,
    DateTime? endDate}) {
  DateTime now = DateTime.now();
  DateTime todayStart = DateTime(now.year, now.month, now.day);
  DateTime todayEnd = todayStart
      .add(const Duration(days: 1))
      .subtract(const Duration(seconds: 1));

  DateTime yesterdayStart = todayStart.subtract(const Duration(days: 1));
  DateTime yesterdayEnd = todayStart.subtract(const Duration(seconds: 1));

  List<TransactionManagementModel> todayItems = [];
  List<TransactionManagementModel> yesterdayItems = [];
  List<TransactionManagementModel> rangeItems = [];

  for (TransactionManagementModel item in items) {
    if (item.created == null) continue;
    if (item.created!.isAfter(todayStart) && item.created!.isBefore(todayEnd)) {
      todayItems.add(item);
    } else if (item.created!.isAfter(yesterdayStart) &&
        item.created!.isBefore(yesterdayEnd)) {
      yesterdayItems.add(item);
    } else if (startDate != null &&
        endDate != null &&
        item.created!.isAfter(startDate) &&
        item.created!.isBefore(endDate)) {
      rangeItems.add(item);
    }
  }

  return switch (filter) {
    FilterDateEnum.today => todayItems,
    FilterDateEnum.yesterday => yesterdayItems,
    FilterDateEnum.range => rangeItems,
  };
}
