import 'package:flutter/material.dart';
import 'package:sport/pages/entrainement.dart';
import 'package:sport/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {

  int _currentIndex = 0;

  setCurrentIndex(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: HomePage(data: [],),
      ),

    );
  }
}

