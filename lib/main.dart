// main.dart
import 'package:access_is_king/views/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFF1C1C1E)),
        useMaterial3: true,
      ),
      home: MyBottomNavigationBar(), // Use PinputPage as the home widget
    );
  }
}
