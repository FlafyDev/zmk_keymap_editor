import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final zmkKeycodesProvider = FutureProvider((ref) async {
  final keysHeader = await rootBundle.loadString("assets/data/keys.h");
  final keycodes = keysHeader
      .split("\n")
      .where((line) => line.startsWith("#define"))
      .map((line) => line.split(" "))
      .where((parts) => parts.length >= 2)
      .map((parts) => parts[1])
      .toList();
  return keycodes;
});
