import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme:
      const ColorScheme.light(background: Color.fromARGB(255, 231, 230, 223)),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: AutofillHints.addressCityAndState),
    bodyMedium: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 25,
        fontWeight: FontWeight.bold,
        fontFamily: AutofillHints.addressCityAndState),
    bodySmall: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: AutofillHints.addressCityAndState),
    displayLarge: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 20,
        fontWeight: FontWeight.bold),
    displaySmall: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: AutofillHints.addressCityAndState),
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStatePropertyAll(Colors.white)
    )
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: Color.fromARGB(255, 3, 0, 15),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: AutofillHints.addressCityAndState),
    bodyMedium: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: AutofillHints.addressCityAndState),
    bodySmall: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: AutofillHints.addressCityAndState),
    displayLarge: TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: AutofillHints.addressCityAndState),
  ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStatePropertyAll(Colors.white)
    )
  ),
);
