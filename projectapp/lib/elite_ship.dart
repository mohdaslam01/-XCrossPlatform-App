import 'package:flutter/material.dart';

class EliteShip extends StatelessWidget {
  const EliteShip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elite Ship'),
      ),
      body: const Center(
        child: Text('Welcome to the Elite Ship Page'),
      ),
    );
  }
}
