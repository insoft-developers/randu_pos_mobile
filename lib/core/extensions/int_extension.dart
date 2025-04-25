extension DateTimeExtension on int {
  String get toMmSs =>
      '${(this ~/ 60).toString().padLeft(2, '0')}:${(this % 60).toString().padLeft(2, '0')}';
}
