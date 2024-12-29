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
        child: Padding(
          padding: EdgeInsets.all(16.0), // Add padding for better layout
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to the Service Page',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20), // Space between title and content
              Text(
                '🤝 Connect and Collaborate!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                'This app is designed to connect individuals\n'
                'based on their skills, enabling them to form\n'
                'teams and collaborate on projects.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                '🔑 Focus on skills, team up, start working.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                'Step 1: Explore Skills\n'
                'Visit the home page to see others who\n'
                'have published their skills. You can connect\n'
                'using the available details.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                'Step 2: Publish Your Skills\n'
                'Log in using your Gmail account on the second page.\n'
                'After logging in, publish your skills to share with others.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                '🌟 Be good at what you publish\n Learning never stops!'
                ,style: TextStyle(fontSize: 16, color: Colors.deepOrange),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                'Start your journey today and build amazing teams!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
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
