import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/screens/favorite_screen.dart';
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
      home: MainScreen(),
      // home: ProfileScreen(),
      // home: DetailScreen(candi: candiList[0]),
      // home: HomeScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //ToDo 1: Deklarasikan variabel
  int _currentIndex = 0;
  final List<Widget>_children=[
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ToDo 2: Buat Properti body berupa widget yang ditampilkan
      body: _children[_currentIndex],
      //ToDo 3: Buat Properti bottonMavigationBar dengan nilai theme
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.deepPurple[50],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex=index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.deepPurple,),
              label: 'Home',
          ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search,color:Colors.deepPurple,),
              label: 'Search',
          ),
            BottomNavigationBarItem(
              icon:Icon(Icons.favorite,color:Colors.deepPurple,),
              label: 'Favorite'
          ),
          ],
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.deepPurple[100],
          showUnselectedLabels: true,
        ),

      ),
      //Todo 4: Buat data dan child dari Theme
     
      
    );
  }
}
