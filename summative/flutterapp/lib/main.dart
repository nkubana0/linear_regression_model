import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const PredictionApp());
}

class PredictionApp extends StatelessWidget {
  const PredictionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prediction App',
      theme: ThemeData(
        brightness: Brightness.dark, // Use dark mode
        primaryColor: Colors.green, // Dark green color for primary elements
        hintColor: Colors.greenAccent, // Lighter green accent
        scaffoldBackgroundColor: Colors.transparent, // Set to transparent
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 5.0,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.greenAccent, // Green button color
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
          titleLarge: TextStyle(color: Colors.white),
        ),
      ),
      home: const BackgroundWrapper(child: HomePage()),
    );
  }
}

class BackgroundWrapper extends StatelessWidget {
  final Widget child;

  const BackgroundWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('../../assets/student.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(
            0.7,
          ), // Semi-transparent black overlay
        ),
        // Child widget
        child,
      ],
    );
  }
}
