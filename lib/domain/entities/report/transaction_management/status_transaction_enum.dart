enum StatusTransactionEnum {
  pending(0, 'Pending', true),
  process(1, 'Process', true),
  cookingPacking(2, 'Cooking/Packing', true),
  shipped(3, 'Shipped', true),
  completed(4, 'Completed', true),
  canceled(5, 'Canceled', true),
  voids(-2, 'Void', false),
  unknown(null, 'Unknown', false); // code is null for 'Unknown'

  final int? code; // Nullable code
  final String name;
  final bool activeTransaction;
  const StatusTransactionEnum(this.code, this.name, this.activeTransaction);

  static StatusTransactionEnum fromCode(int code) {
    return StatusTransactionEnum.values.firstWhere(
      (status) => status.code == code,
      orElse: () => StatusTransactionEnum.unknown,
    );
  }
}
