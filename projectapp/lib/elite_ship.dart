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
        child: Padding(
          padding: EdgeInsets.all(16.0), // Add padding for better layout
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to the Elite Ship Page',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20), // Space between title and content
              Text(
                '🤝 Join Our Exclusive Community!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                '🌟 To join, please share our app with three close\n'
                'family members or friends. Your support helps\n'
                'us grow and connect even more amazing people!',
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                '📩 For future improvements and feedback,\n'
                'please write to us at email.',
                style: TextStyle(fontSize: 16, color: Colors.teal),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                '💖 Thank you for being a part of our journey!\n'
                'Together, we can achieve greatness.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20), // Add extra space for better design
              Text(
                'Let\'s grow and connect! 🌐',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
