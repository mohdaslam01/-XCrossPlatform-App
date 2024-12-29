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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Talk to Us Page',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20), // Space between text
            Text(
              'Email Address:\n'
              'khan.web.publishers@gmail.com\n'
              'mm2954@njit.edu',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10), // Space between sections
            Text(
              'Phone Number:\n'
              '973-289-4107 (Text Messages Only)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10), // Space between sections
            Text(
              'Postal Address:\n'
              '2 Center Street, #901,\nNewark, NJ 07102.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10), // Space between sections
            Text(
              'For feedback or recommendations,\n'
              'use the above details.\n'
              'For immediate questions or reports,\n'
              'use email for a quicker response.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10), // Space between sections
            Text(
              'Responses to queries will be addressed\n'
              'in FIFO order. Thank you for downloading\n'
              'our application. Have a great life ahead!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
