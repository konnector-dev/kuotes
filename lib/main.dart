import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const QuoteApp());

class QuoteApp extends StatefulWidget {
  const QuoteApp({super.key});

  @override
  State<QuoteApp> createState() => _QuoteAppState();
}

class _QuoteAppState extends State<QuoteApp> {
  List<Map<String, dynamic>> quotes = [];
  String quote = 'Quote of the Day';
  String author = 'Kuotes';
  int quodex = 1;

  Future<List<Map<String, dynamic>>> loadQuotes() async {
    String data = await rootBundle.loadString('assets/quotes.json');
    List<dynamic> quotes = jsonDecode(data);
    return quotes.cast<Map<String, dynamic>>();
  }

  @override
  void initState() {
    super.initState();
    loadQuotes().then((loadedQuotes) {
      quotes = loadedQuotes;
      updateQuote();
    });
  }

  void updateQuote() {
    setState(() {
      quodex = Random().nextInt(quotes.length);
      quote = quotes[quodex]['quote'] as String;
      author = quotes[quodex]['author'] as String;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Kuotes',
            style: TextStyle(
              color: Colors.brown,
              fontSize: 18.0,
            ),
          ),
          backgroundColor: Colors.grey[900],
        ),
        backgroundColor: Colors.grey[850],
        body: Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quote,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                author,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[700],
          onPressed: () {
            setState(() {
              updateQuote();
            });
          }, // Add your quote changing function here
          child: const Icon(Icons.refresh, color: Colors.white),
        ),
      ),
    );
  }
}
