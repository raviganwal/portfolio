import 'package:flutter/material.dart';

import 'Portfolio.dart';

void main() {
  ThemeData _buildDarkTheme() {
    final Color primaryColor = Color(0xff121212);
    const Color secondaryColor = Color(0xffff5722);
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base =
        ThemeData(brightness: Brightness.dark, colorScheme: colorScheme);
    return base;
  }

  ThemeData _buildLightTheme() {
    const Color primaryColor = Color(0xFF008FD1);
    const Color secondaryColor = Color(0xffff5722);

    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData(
        brightness: Brightness.light,
        accentColorBrightness: Brightness.dark,
        primaryColor: primaryColor,
        colorScheme: colorScheme);
    return base;
  }

  final ThemeData kLightGalleryTheme = _buildLightTheme();
  final ThemeData kDarkGalleryTheme = _buildDarkTheme();

  runApp(MaterialApp(
    theme: kLightGalleryTheme,
    darkTheme: kDarkGalleryTheme,
    debugShowCheckedModeBanner: false,
    title: 'Portfolio',
    // Start the app with the "/" named route. In our case, the app will start
    // on the FirstScreen Widget
    initialRoute: '/',
    routes: {
      // When we navigate to the "/" route, build the FirstScreen Widget
      '/': (context) => Portfolio(),
    },
  ));
}
