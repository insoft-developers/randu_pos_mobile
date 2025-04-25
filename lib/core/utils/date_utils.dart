import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../extensions/context_extension.dart';

String formatDateTimeAsString(dynamic dateTime,
    {String dateFormat = 'yyyy-MM-dd'}) {
  try {
    if (dateTime is DateTime) {
      return DateFormat(dateFormat).format(dateTime);
    } else {
      return DateFormat(dateFormat).format(DateTime.parse(dateTime));
    }
  } catch (e) {
    return '-';
  }
}

String formatDateTimeAgo(dynamic dateTime) {
  try {
    if (dateTime == null) return '';
    if (dateTime is DateTime) {
      return timeago.format(dateTime);
    } else {
      return timeago.format(DateTime.parse(dateTime));
    }
  } catch (e) {
    return '-';
  }
}

String addDaysDateFromNow({required int numberOfDayAdded}) {
  DateTime now = DateTime.now();
  return formatDateTimeAsString(
      DateTime(now.year, now.month, now.day + numberOfDayAdded));
}

int hoursBetween(DateTime? from, DateTime? to) {
  if (from != null && to != null) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    if (kDebugMode) {
      print('different hour from $from to $to ${to.difference(from).inHours}');
    }
    return to.difference(from).inHours;
  } else {
    return 0;
  }
}

Future<void> openDatePicker({
  required BuildContext context,
  Function(DateTime)? onDateSelected,
  DateTime? initialDate,
  DateTime? lastDate,
}) async {
  final DateTime dateTimeNow = DateTime.now();
  showDatePicker(
    initialDate: initialDate ?? DateTime.now(),
    lastDate: lastDate ?? DateTime(dateTimeNow.year + 100),
    firstDate: DateTime(1990),
    context: context,
    builder: (BuildContext context, Widget? child) => Theme(
      data: context.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: child ?? const SizedBox.shrink(),
    ),
  ).then(
    (date) {
      if (date != null && onDateSelected != null) {
        onDateSelected(date);
      }
    },
  );
}

String getCurrentDate() {
  // Get today's date
  DateTime now = DateTime.now();

  // Format the date
  String formattedDate = formatDateInIndonesian(now, format: 'dd/MM/yyyy');

  return formattedDate;
}

String formatDateInIndonesian(DateTime date,
    {String format = 'dd MMMM yyyy', bool withDay = true}) {
  // Define the date format for the day of the week in Indonesian
  String day = DateFormat('EEEE', 'id_ID').format(date);

  // Define the date format for the day, month, and year
  String formattedDate = DateFormat(format, 'id_ID').format(date);

  // Capitalize the first letter of the day
  String capitalizedDay = day[0].toUpperCase() + day.substring(1);

  // Combine the day and the formatted date
  return withDay ? '$capitalizedDay, $formattedDate' : formattedDate;
}

String? formatDateToString(DateTime? date,
    {String format = 'dd-MM-yyyy HH:mm:ss', String? locale = 'id_ID'}) {
  if (date == null) return null;

  String formattedDate = DateFormat(format, locale).format(date.toLocal());
  return formattedDate;
}
