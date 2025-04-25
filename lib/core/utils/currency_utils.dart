import 'dart:developer';

import 'package:intl/intl.dart';

String formatStringIDRToCurrency(
    {required String text, String symbol = '', bool isDouble = true}) {
  final NumberFormat currencyFormat =
      NumberFormat.currency(locale: 'id_ID', symbol: symbol, decimalDigits: 0);

  if (text.isEmpty) return '';

  // Remove non-digit characters except the decimal point
  if (isDouble) {
    text = text.replaceAll(RegExp(r'[^\d.]'), '');
  } else {
    text = text.replaceAll(RegExp(r'[^\d]'), '');
  }

  // Parse the number and format it
  double value = double.tryParse(text) ?? 0;
  String formattedString = currencyFormat.format(value);

  return formattedString;
}

String formatIDRCurrencyToStringDigit(String text) {
  if (text.isEmpty) return '0';
  return text.replaceAll(RegExp(r'[^\d]'), '');
}

double formatIDRCurrencyToDouble(String text) {
  String cleannedText = text.replaceAll(RegExp(r'[^\d]'), '');
  return double.tryParse(cleannedText) ?? 0;
}

List<int> getDenominationsAboveAmount(int amount) {
  List<int> denominations = [5000, 10000, 20000, 50000, 70000, 100000];
  double underOneHundred = amount % 100000;
  int hundredThousand = (amount - underOneHundred).toInt();

  List<int> result = denominations
      .where((denomination) =>
          denomination > underOneHundred && denomination <= 100000)
      .map((e) => e + hundredThousand)
      .toList();

  log('Denom $underOneHundred');
  log('Denom $result');

  return result;
}

class CurrencyInputFormatter {
  final String symbol;
  final bool isDouble;

  CurrencyInputFormatter({
    this.symbol = '',
    this.isDouble = true,
  });

  String formatCurrency(String value) {
    // If empty, return empty string
    if (value.isEmpty) return '';

    // Remove all non-digit characters (except decimal point if isDouble is true)
    String cleanValue = isDouble
        ? value.replaceAll(RegExp(r'[^\d.]'), '')
        : value.replaceAll(RegExp(r'[^\d]'), '');

    // Handle decimal points for double values
    if (isDouble && cleanValue.contains('.')) {
      var parts = cleanValue.split('.');
      if (parts.length > 2) {
        cleanValue = '${parts[0]}.${parts[1]}';
      }
    }

    // Convert to double and format
    double? number = double.tryParse(cleanValue);
    if (number == null) return '';

    // Create formatter
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: symbol,
      decimalDigits: 0,
    );

    return formatter.format(number);
  }

  // Method to strip formatting
  String stripFormat(String value) {
    return value.replaceAll(RegExp(r'[^\d]'), '');
  }
}
