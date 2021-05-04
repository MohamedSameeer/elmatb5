import 'package:elmatb5/share/network/local/storage-manager.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    textTheme: TextTheme(
      headline4: TextStyle(
        color: Colors.white,
      )
    ),
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    textTheme: TextTheme(
        headline4: TextStyle(
          color: Colors.black,
        )
    ),
  );

  Future setThemeMode(bool value) async {
    return StorageManager.saveData('isDark',value);
  }

}