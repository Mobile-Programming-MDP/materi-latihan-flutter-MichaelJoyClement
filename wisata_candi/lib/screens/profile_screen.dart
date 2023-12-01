import 'package:flutter/material.dart';
import 'package:wisata_candi/screens/sign_in.dart';
import 'package:wisata_candi/widget/profile_info_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //TODO 1: Deklarasi variabel (state) yang dibutuhkan
  bool isSignIn= true;
  String fullName = "";
  String userName= "";
  int favoriteCandiCount = 0;
  late Color iconColor;

  void signIn()
  {
    Navigator.pushNamed(context, '/signIn');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 200-50),
                  child:Stack(
                    alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepOrange,width: 2),
                      shape: BoxShape.circle
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("images/placeholder_image.png"),
                    ),
                  ),
                  if(isSignIn)
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.camera_alt,color: Colors.blue)),
                ],
              ) ,
            ),
            ),
             Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Divider(
                      color: Colors.deepPurple[100],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    ProfileInfoItem(
                      icon: Icons.lock,
                      label: 'Pengguna',
                      value: userName,
                      iconColor: Colors.amber,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: Colors.deepPurple[100],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    ProfileInfoItem(
                        icon: Icons.person,
                        label: 'Nama',
                        value: fullName,
                        showEditIcon: isSignIn,
                        onEditPressed: () {
                          debugPrint('Icon edit ditekan ...');
                        },
                        iconColor: Colors.blue),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: Colors.deepPurple[100],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    ProfileInfoItem(
                        icon: Icons.favorite,
                        label: 'Favorit',
                        value:
                            favoriteCandiCount > 0 ? '$favoriteCandiCount' : '',
                        iconColor: Colors.red),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: Colors.deepPurple[100],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    isSignIn
                        ? TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,MaterialPageRoute(builder: (context) => SignInScreen()));
                            },
                            child: Text('Sign Out'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.amber,
                                padding: const EdgeInsets.all(20),
                                elevation: 5),
                          )
                        : TextButton(
                            onPressed: () {},
                            child: Text('Sign In'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.amber,
                                padding: const EdgeInsets.all(20),
                                elevation: 5),
                          )
                  ],
                ),
              ),
            ],
          ),
        
      ),
      ],
    )
    );
  }
}
 //TODO 2: Buat bagian ProfileHeader yang berisi foto Profil
              
              //TODO 3: 
