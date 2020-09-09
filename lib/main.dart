import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_liste.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Burç Rehberi",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: BurcListe(),
    );
  }
}
