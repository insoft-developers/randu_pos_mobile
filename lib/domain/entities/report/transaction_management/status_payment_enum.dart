enum StatusPaymentEnum {
  voids(-2, 'VOID'),
  refunded(-1, 'REFUNDED'),
  paid(1, 'PAID'),
  unpaid(0, 'UNPAID'),
  unknown(null, 'Unknown'); // code is null for 'Unknown'

  final int? code; // Nullable code
  final String name;

  const StatusPaymentEnum(this.code, this.name);

  static StatusPaymentEnum fromCode(int code) {
    return StatusPaymentEnum.values.firstWhere(
      (status) => status.code == code,
      orElse: () => StatusPaymentEnum.unknown,
    );
  }
}
