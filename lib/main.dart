import 'package:flutter/material.dart';

import 'portfolio.dart';

void main() {
  ThemeData _buildDarkTheme() {
    final Color primaryColor = Color(0xff121212);
    final Color secondaryColor = Colors.pink;
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      brightness: Brightness.dark,
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base =
    ThemeData(brightness: Brightness.dark,
        colorScheme: colorScheme,
        cardTheme: CardTheme(
          elevation: 6.0,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),),
        iconTheme: IconThemeData(color: Colors.white));
    return base;
  }

  ThemeData _buildLightTheme() {
    const Color primaryColor = Colors.blue;
    const Color secondaryColor = Colors.pink;

    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData(
        brightness: Brightness.light,
        accentColorBrightness: Brightness.dark,
        primaryColor: primaryColor,
        colorScheme: colorScheme,
        iconTheme: IconThemeData(color: Colors.white));
    return base;
  }

  final ThemeData kLightGalleryTheme = _buildLightTheme();
  final ThemeData kDarkGalleryTheme = _buildDarkTheme();

  runApp(MaterialApp(
    theme: kDarkGalleryTheme,
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
