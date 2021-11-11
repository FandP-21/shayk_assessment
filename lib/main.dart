import 'package:flutter/material.dart';
import 'package:shayk_assesment/assessmentTask.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shayk Demo',
      debugShowCheckedModeBanner: false,
      home: AssessmentTask()
    );
  }
}

