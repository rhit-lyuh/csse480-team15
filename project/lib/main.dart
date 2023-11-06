import 'package:flutter/material.dart';
import 'package:project/page/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      debugShowCheckedModeBanner: false,
      // home: const HomePage(),
      home: const LoginPage(),
    );
  }
}
