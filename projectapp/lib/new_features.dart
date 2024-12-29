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
        child: Padding(
          padding: EdgeInsets.all(16.0), // Add padding for better layout
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to the New Features Page',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20), // Space between title and content
              Text(
                '📢 Exciting Enhancements Await!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                '🌟 Our application will be enhanced with new features and timely updates.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                '📌 Flexibility and dynamic use cases will be prioritized to meet your needs.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                '🌍 New geo-static features and usage instructions will be included soon.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                '🤝 Share this app with your loved ones.\n'
                'Build a great team and achieve great results together!',
                style: TextStyle(fontSize: 16, color: Colors.teal),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                '📍 Note: Currently limited to New Jersey, New York,\n'
                'and other neighboring NJ states.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
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
