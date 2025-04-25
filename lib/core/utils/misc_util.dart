import 'dart:math';

String generateAlias(String name) {
  final random = Random();

  // Extract the first letters of each word, ignoring empty strings
  String alias = name
      .split(' ')
      .where((word) => word.isNotEmpty) // Filter out empty strings
      .map((word) => word[0].toUpperCase())
      .join();

  // Generate a 4-digit random number
  String randomNumber =
      (random.nextInt(9000) + 1000).toString(); // Ensures 4 digits

  // Generate 2 random uppercase letters
  String randomLetters = String.fromCharCode(random.nextInt(26) + 65) +
      String.fromCharCode(random.nextInt(26) + 65);

  // Combine all parts together
  return '$alias-$randomNumber$randomLetters';
}
