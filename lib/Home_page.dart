import 'dart:async';
import 'dart:convert';

import 'package:daily_quotes/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);
  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  List data = [];
  String _cardText = '';
  String _author = '';

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  data = jsonDecode(await fetchQuotes());
                  print(data.length.toString());

                  setState(() {
                    _cardText = data[0]['quote'];
                    _author = data[0]['author'];
                  });

                  print(_cardText);
                },
                child: Text("get Today's Happiness Quote"),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _cardText,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height:15),
            Row(
              children: [
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _author,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
                
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<String> fetchQuotes() async {
    final headers = {'X-Api-Key': 'i5wWgmsDmunXM0ceIUsjCw==btebGDrJD05cXIJt'};
    final response = await http.get(
        Uri.parse('https://api.api-ninjas.com/v1/quotes?category=happiness'),
        headers: headers);
    print(response.body.runtimeType);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch quotes');
    }
  }
}

class Quote {
  final String author;
  final String quote;
  Quote.fromJson(Map<String, dynamic> json)
      : author = json['author'] as String,
        quote = json['quote'] as String;
}
