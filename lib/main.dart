import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Quote App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String quote = "";
  String author = "";

  @override
  void initState() {
    super.initState();
    _loadQuote();
  }

  void _loadQuote() async {
    // Load the JSON file from the assets directory
    String jsonString = await DefaultAssetBundle.of(context).loadString('assets/quotes.json');

    // Parse the JSON string into a Map
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    // Get a random quote and author from the Map
    int randomIndex = Random().nextInt(jsonMap['quotes'].length);
    Map<String, dynamic> randomQuote = jsonMap['quotes'][randomIndex];
    quote = randomQuote['quote'];
    author = randomQuote['author'];

    // Update the UI with the new quote and author
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Quote App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              quote,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              '- $author',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadQuote,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}