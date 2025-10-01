import 'package:flutter/material.dart';
import 'package:practical_5/screens/home_screen.dart';

void main() {
  runApp(const PlacementPrepApp());
}

class PlacementPrepApp extends StatelessWidget {
  const PlacementPrepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Placement Preparation',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1e1e2e),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF89B4FA),
          foregroundColor: Color(0xFF1e1e2e),
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF11111b),
          selectedItemColor: Color(0xFF89B4FA),
          unselectedItemColor: Color(0xFFcdd6f4),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFFcdd6f4)),
          bodyMedium: TextStyle(color: Color(0xFFcdd6f4)),
          titleLarge: TextStyle(color: Color(0xFFcdd6f4)),
          titleMedium: TextStyle(color: Color(0xFFcdd6f4)),
          titleSmall: TextStyle(color: Color(0xFFcdd6f4)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF89B4FA),
            foregroundColor: const Color(0xFF1e1e2e),
          ),
        ),
        cardTheme: const CardThemeData(color: Color(0xFF313244), elevation: 4),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
