import 'package:flutter/material.dart';
import 'package:project/page/HomePage.dart';
import 'package:project/page/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rose Data',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff800000),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
