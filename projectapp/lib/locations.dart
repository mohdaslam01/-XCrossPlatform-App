import 'package:flutter/material.dart';

class Locations extends StatelessWidget {
  const Locations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations'),
      ),
      body: const Center(
        child: Text('Welcome to the Locations Page'),
      ),
    );
  }
}
