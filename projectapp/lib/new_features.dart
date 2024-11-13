import 'package:flutter/material.dart';

class NewFeatures extends StatelessWidget {
  const NewFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Features'),
      ),
      body: const Center(
        child: Text('Welcome to the New Features Page'),
      ),
    );
  }
}
