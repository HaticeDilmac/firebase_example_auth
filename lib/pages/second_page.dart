import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anasayfa'),
      ),
      body: const Center(
        child: Text(
          'Merhaba, Flutter Anasayfa!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
