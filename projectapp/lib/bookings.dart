import 'package:flutter/material.dart';

class Bookings extends StatelessWidget {
  const Bookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookings'),
      ),
      body: const Center(
        child: Text('Welcome to the Bookings Page'),
      ),
    );
  }
}
