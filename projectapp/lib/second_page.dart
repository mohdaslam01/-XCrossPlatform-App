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
        child: Column(
          children: [Text(
            'This is the second page!\n Powered by Google',
            style:  TextStyle(
              fontSize: 24,
            ),
          ),]
        )
      ),
    );
  }
}
