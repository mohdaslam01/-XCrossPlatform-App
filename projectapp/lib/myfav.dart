import 'package:flutter/material.dart';

class MyFav extends StatelessWidget {
  const MyFav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
      ),
      body: const Center(
        child: Text('Welcome to the My Favorites Page'),
      ),
    );
  }
}
