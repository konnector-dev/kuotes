import 'package:flutter/material.dart';
// Import dart main package
import 'dart:math';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Kuotes!'),
          backgroundColor: Colors.black87,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        body: const MyScreen(),
      ),
    );
  }
}

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        setState(() {
          _backgroundColor = _getRandomColor();
        });
      },
      child: Container(
        color: _backgroundColor,
        child: const Center(
          child: Text(
            'Hello world',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }

  Color _getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
