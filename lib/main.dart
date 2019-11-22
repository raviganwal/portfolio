import 'package:flutter/material.dart';

import 'Portfolio.dart';

void main() {
  ThemeData _buildDarkTheme() {
    final Color primaryColor = Color(0xff121212);
    final Color secondaryColor = Colors.purple.shade200;
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base =
    ThemeData(brightness: Brightness.dark,
        colorScheme: colorScheme,
        iconTheme: IconThemeData(color: Colors.white70));
    return base;
  }

  ThemeData _buildLightTheme() {
    const Color primaryColor = Colors.teal;
    const Color secondaryColor = Colors.purple;

    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData(
        brightness: Brightness.light,
        accentColorBrightness: Brightness.dark,
        primaryColor: primaryColor,
        colorScheme: colorScheme,
        iconTheme: IconThemeData(color: Colors.teal));
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
