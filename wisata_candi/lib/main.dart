
import 'package:wisata_candi/data/candi_data.dart';
import 'data/candi_data.dart';

import 'screens/detail_screen.dart';
import 'dart:html';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DetailScreen(candi:candiList[0]),
    );
  }
}




