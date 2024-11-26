import 'package:flutter/material.dart';
import 'package:smart_yoga_mat/home_screen.dart';

void main() {
  runApp(const SmartYogaApp());
}

class SmartYogaApp extends StatelessWidget {
  const SmartYogaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Yoga Mat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
