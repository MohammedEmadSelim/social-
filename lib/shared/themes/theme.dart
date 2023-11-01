import 'package:flutter/material.dart';
import 'Colors.dart';
import 'text.dart';

var theme = ThemeData(
    appBarTheme: AppBarTheme(
      color: transparent,
      titleTextStyle: h4Bold
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      displayLarge: h1,
      displayMedium: h2,
      displaySmall: h3,
      headlineMedium: h4,
      headlineSmall: h5,
      titleMedium: title1,
      titleSmall: title2,
      bodyLarge: body,
      bodySmall: caption,
    ));
