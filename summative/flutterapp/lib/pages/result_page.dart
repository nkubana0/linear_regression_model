import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double predictedGPA;

  const ResultPage({super.key, required this.predictedGPA});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prediction Result')),
      body: Center(
        child: Text(
          'Your Predicted GPA: $predictedGPA',
          style: const TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }
}
