import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  const Service({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service'),
      ),
      body: const Center(
        child: Text('Welcome to the Service Page'),
      ),
    );
  }
}
