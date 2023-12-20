import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:meals/screens/tabs.dart';

void main() {
  runApp(const MyApp());
}
// creating theme for the app

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 144, 68, 45),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: TabsScreen());
  }
}
