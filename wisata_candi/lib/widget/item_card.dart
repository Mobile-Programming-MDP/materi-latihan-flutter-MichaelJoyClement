import 'package:flutter/material.dart';
import 'package:wisata_candi/models/candi.dart';
import 'package:wisata_candi/screens/detail_screen.dart';

class ItemCard extends StatelessWidget {
  //Deklarasikan ariabel yang dibutuhkan dan pasang pada konstruktor
  final Candi candi;
  const ItemCard({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(candi: candi),
          )
          );
      },
      child: Card(
        //ToDo 2: Tetapkan parameter shape, margin, dan elevtion dari Cari
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
        margin: EdgeInsets.all(4),
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //ToDo 3: buat image sebagai anak dari column
            Expanded(
              child: ClipRRect(
                
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(candi.imageAsset,
                width: double.infinity,
                fit: BoxFit.cover,),
              ),
            ),
            //Todo 4 Buat text sebagai anak dari column
            Padding(
              padding: const EdgeInsets.only(left: 16,top: 8),
              child: Text(candi.name,
              style: TextStyle(fontSize:16),
              ),
            ),
            //Todo 5 buat text sebagai anak dari column
            Padding(
              padding: const EdgeInsets.only(left: 16,bottom: 8),
              child: Text(candi.type,style: TextStyle(fontSize: 12),),
            )
          ],
        ),
      ),
    );
  }
}