import 'dart:async';
import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget{
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';

  bool _isSignedIn = false;

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context)
  {
   return Scaffold(
    appBar: AppBar(title: Text('Sign In'),),
    body: Center(
      child: SingleChildScrollView(
        child:Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "Nama Pengguna",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20,),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "Kata Sandi",
                errorText: _errorText.isNotEmpty ? _errorText : null,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off:Icons.visibility,
                  ),
                ) 
              ),
              obscureText: _obscurePassword,
            ),

            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){},
              child: Text('Sign In')
            ),
            SizedBox(height: 10,),
            RichText(
              text:TextSpan(
                text: 'Belum punya Akun?',
                style: TextStyle(fontSize: 16,color: Colors.deepPurple),
                children: <TextSpan>[
                  TextSpan(
                    text:'Daftar di Sini.',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 16
                    ),
                    recognizer: TapGestureRecognizer()
                    ..onTap=(){},
                  )
                ]
              )
            )

            // TextButton(
            //   onPressed: (){},
            //   child: Text('Belum Punya akun? Daftar di sini.'),
            // )
          ],
        ),
      ),
      ),
      ),
      
      
    ),
   );
  }
}