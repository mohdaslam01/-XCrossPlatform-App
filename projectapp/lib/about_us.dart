import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.black, Colors.deepPurple, Colors.blue],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  ),
        child: const SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'The Birth of Quick Team',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 104, 255, 255),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'It all began with a simple yet powerful idea—to create an anonymous platform '
                    'where people could connect based solely on their skills, without the influence '
                    'of names or backgrounds. This idea struck us during a hackathon that we attended '
                    'somewhat randomly.\n\n'
                    'Person A had a clear vision for the project but faced the daunting challenge of '
                    'forming a team. In reality, people often judge others based on appearances—a hard '
                    'fact that\'s rarely shown in highlight reels. Unfortunately, no one was interested '
                    'if you didn\'t fit into their predefined criteria. This was a common situation for '
                    'many other participants as well.\n\n'
                    'Despite these challenges, Person A pursued a different project plan. During the event, '
                    'we came across others who were also struggling to form teams. Eventually, we joined forces, '
                    'creating a diverse and understanding team.\n\n'
                    'From this experience, we began brainstorming solutions for the hackathon, leading to the spark '
                    'of the QuickTeam Up idea. Our teammates were enthusiastic and quickly embraced the concept without hesitation. '
                    'Through discussions and collaboration, QuickTeam Up evolved into Quick Team, enriched with innovative ideas for '
                    'future developments.\n\n'
                    'Although we couldn\'t fully deliver the end product due to struggles in the design phase, we learned invaluable '
                    'lessons from our journey. We observed other brilliant teams with well-structured projects. Despite not winning the '
                    'hackathon, we won in terms of learning—our mistakes taught us how to find solutions for real-world problems and leverage '
                    'software to provide those solutions.\n\n'
                    'Our motto throughout this journey has been, "You can do it." This proverb drove us to complete this app.\n\n'
                    'So, my tip to you and your team is to always be consistent in your ideas. Just being consistent will lead to greater '
                    'achievements, and if you add some hard work, there is no limit to what you can achieve. We can change the world.\n\n'
                    'Thank you for your support and belief in our vision.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
