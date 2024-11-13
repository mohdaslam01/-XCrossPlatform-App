import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key}); // or use ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: const Center(
        child: Text(
          'This is the second page!',
          style:  TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
