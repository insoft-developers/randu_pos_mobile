import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String toStringWithDecimal({int decimalPlaces = 0}) =>
      toStringAsFixed(decimalPlaces);
}

extension CurrencyFormat on double {
  String convertToCurrencyDecimal(
      {String symbol = '', String? locale, int decimalDigits = 2}) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      symbol: symbol,
      locale: locale,
      decimalDigits: decimalDigits,
    );
    return currencyFormatter.format(this);
  }
}
