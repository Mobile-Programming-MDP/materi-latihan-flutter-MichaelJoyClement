import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/models/candi.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //ToDo 1 : Deklarasikan Variabel yang dibutuhkan
  List<Candi> _filteredCandis=candiList;
  String _searchQuery ="";
  final TextEditingController _searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ToDo 2: Buat appbar dengan judul Pencarian Candi
      appBar: AppBar(title: Text('Pencarian Candi'),),

      //ToDo 3 Buat body baru berupa Column
      body: Column(
        children: [
          //ToDo 4 Buat textfield pencarian sebagai anak dari Column
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.deepPurple,
              ),
              child: const TextField(
                autofocus: false,
                //ToDo 6 Implementasi Fitur pencarian
                decoration: InputDecoration(
                  hintText: 'Cari Candi ...',
                  prefixIcon: Icon(Icons.search),

                //ToDo 7 Implementasi Pengosongan Input
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.deepPurple) 
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12)
                ),
              ),
            ),
          ),
          //ToDo 5 Buat ListView Hasil Pencarian Sebagai Anak dari Column
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCandis.length,
              itemBuilder: (context,index){
                final candi = _filteredCandis[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(candi.imageAsset,
                                fit: BoxFit.cover,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(candi.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(candi.location)
                          ],
                        ),
                      )
          
          
                    ],
                    
                    
                  )
                );
              },
            ),
          )
        ],
      ),
    );
  }
}