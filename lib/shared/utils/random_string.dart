import "dart:math";

String randomString(int length) {
  const charset =
      "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
  final random = Random.secure();
  final codeUnits = List<int>.generate(
    length,
    (index) => charset.codeUnitAt(random.nextInt(charset.length)),
  );
  return String.fromCharCodes(codeUnits);
}
