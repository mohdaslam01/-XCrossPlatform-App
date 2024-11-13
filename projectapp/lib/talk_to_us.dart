import 'package:flutter/material.dart';

class TalkToUs extends StatelessWidget {
  const TalkToUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Talk to Us'),
      ),
      body: const Center(
        child: Text('Welcome to the Talk to Us Page'),
      ),
    );
  }
}
