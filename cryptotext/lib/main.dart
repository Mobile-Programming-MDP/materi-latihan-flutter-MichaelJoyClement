import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

void main() {
  runApp(CryptoText());
}

class CryptoText extends StatelessWidget {
  const CryptoText({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CryptoText',
      home: Homescreen(),
    );
  }
}

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final encrypt.Key _key = encrypt.Key.fromLength(32);
  final iv = encrypt.IV.fromLength(16);

  String _encryptedText = '';
  String _decryptedText = '';
  String? _errortext;
  bool _isDecryptButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CryptoText'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Input Text',
                errorText: _errortext,
                border: const OutlineInputBorder(),
              ),
              onChanged: _onTextChanged,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  String inputText = _textEditingController.text;

                  if (inputText.isNotEmpty) {
                    _encryptText(inputText);
                  } else {
                    setState(() {
                      _errortext = 'Input Cannot Be Empty';
                    });
                  }
                },
                child: const Text('Encrypt')),
            SizedBox(
              height: 10,
            ),
            Text(
              'Encrypted Text ; $_encryptedText',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: _isDecryptButtonEnabled && _encryptedText.isNotEmpty
                    ? () {
                        String inputText = _encryptedText;
                        final ecnrypted =
                            encrypt.Encrypted.fromBase64(inputText);
                        _decryptText(ecnrypted.base64);
                      }
                    : null,
                child: const Text('Decrypt')),
            const SizedBox(height: 10),
            Text(
              'Decrypted text: $_decryptedText',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void _onTextChanged(String text) {
    setState(() {
      _isDecryptButtonEnabled = text.isNotEmpty;
      _encryptedText = '';
      _decryptedText = '';
      _errortext = null;
    });
  }

  void _encryptText(String text) {
    try {
      if (text.isNotEmpty) {
        final encrypter = encrypt.Encrypter(encrypt.AES(_key));
        final encrypted = encrypter.encrypt(text, iv: iv);
        setState(() {
          _encryptedText = encrypted.base64;
        });
      } else {
        print('Text to encrypt cannot be empty');
      }
    } catch (e, stackTrace) {
      print('Error encrypting text: $e, stackTrace: $stackTrace');
    }
  }

  void _decryptText(String text) {
    try {
      if (text.isNotEmpty) {
        final encrypter = encrypt.Encrypter(encrypt.AES(_key));
        final decrypted = encrypter.decrypt64(text, iv: iv);
        setState(() {
          _decryptedText = decrypted;
        });
      } else {
        print('Text to decrypt cannot be empty');
      }
    } catch (e, stackTrace) {
      print('Error decrypting text: $e, stackTrace: $stackTrace');
    }
  }
}
