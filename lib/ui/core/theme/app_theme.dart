import 'package:flutter/material.dart';
import 'app_text_styles.dart';

class AppTheme {
  static final TextTheme lightTextTheme = AppTextStyles.lightTextTheme;

  static final ThemeData lightTheme = ThemeData(
    // fontFamily: 'Dancing Script',
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: Brightness.light,
    ),
    textTheme: lightTextTheme,
    scaffoldBackgroundColor: Colors.grey[50],
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: lightTextTheme.titleLarge?.copyWith(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size.fromHeight(48),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        textStyle: lightTextTheme.labelLarge?.copyWith(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.green, width: 2),
      ),
      labelStyle: const TextStyle(color: Colors.green),
    ),
  );
}
