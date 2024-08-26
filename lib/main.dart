// main.dart
import 'package:flutter/material.dart';
import 'views/bid_number.dart';
import 'views/splash_view.dart';
import 'widgets/reusable_pinput.dart'; // Import the PinputPage widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFF1C1C1E)),
        useMaterial3: true,
      ),
      home: SplashScreen(), // Use PinputPage as the home widget
    );
  }
}
