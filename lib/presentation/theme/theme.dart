import "package:flutter/material.dart";

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color.fromRGBO(63, 207, 142, 1),
    background: const Color.fromRGBO(1, 17, 29, 1),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromRGBO(1, 17, 29, 1),
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 30,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontFamily: "Inter",
      fontWeight: FontWeight.w900,
      fontSize: 30,
    ),
    elevation: 0.0,
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      fontFamily: "Inter",
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      fontFamily: "Inter",
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      fontFamily: "Inter",
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
    titleLarge: TextStyle(
      fontFamily: "Inter",
      fontSize: 35,
      color: Colors.white,
      fontWeight: FontWeight.w900,
    ),
    labelSmall: TextStyle(
      fontFamily: "Inter",
      fontSize: 16,
      color: Color.fromRGBO(127, 133, 140, 1),
      fontWeight: FontWeight.w700,
    ),
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Colors.red,
    contentTextStyle: TextStyle(
      fontFamily: "Inter",
      fontSize: 16,
      color: Colors.white,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromRGBO(63, 207, 142, 1),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      textStyle: const TextStyle(
        fontFamily: "Inter",
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color.fromRGBO(63, 207, 412, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      textStyle: const TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w500,
        fontSize: 17,
      ),
    ),
  ),
  useMaterial3: true,
);
