import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/screens/home_screen.dart';
import 'package:wisata_candi/screens/profile_screen.dart';
import 'package:wisata_candi/screens/serach_screen.dart';
import 'package:wisata_candi/screens/sign_in.dart';
// import 'package:wisata_candi/screens/detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.lightBlue),
          titleTextStyle: TextStyle(
            color: Colors.lightGreen,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )
        ),
        colorScheme:
         ColorScheme.fromSeed(seedColor: Colors.lightBlue).copyWith(
          primary: Colors.lightBlue,
          surface: Colors.lightBlue,
         ),
        useMaterial3: true,
      ),
      // home: ProfileScreen(),
      // home: DetailScreen(candi: candiList[0]),
      home: HomeScreen(),
    );
  }
}
