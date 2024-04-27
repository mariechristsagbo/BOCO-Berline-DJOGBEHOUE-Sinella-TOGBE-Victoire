import 'package:flutter/material.dart';
import 'package:devoir_election/pages/liste_candidats.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Election',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Candidats(),
    );
  }
}