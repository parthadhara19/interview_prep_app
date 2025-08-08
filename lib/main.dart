import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const InterviewPrepApp());
}

class InterviewPrepApp extends StatelessWidget {
  const InterviewPrepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interview Prep App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}
