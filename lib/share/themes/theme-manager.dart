import 'package:elmatb5/share/network/local/storage-manager.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeManager {
  final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: HexColor('#242526'),
    brightness: Brightness.dark,
    backgroundColor: HexColor('#18191A'),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    selectedRowColor: HexColor('#13B9FD'),
    dividerColor: Colors.black12,
    textTheme: TextTheme(
      headline4: TextStyle(
        color: Colors.white,
      )
    ),
    dialogTheme: DialogTheme(

    ),
    dividerTheme: DividerThemeData(
      color: Colors.grey
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
    dividerTheme: DividerThemeData(
        color: Colors.grey
    ),
  );

  Future setThemeMode(bool value) async {
    return StorageManager.saveData('isDark',value);
  }

}