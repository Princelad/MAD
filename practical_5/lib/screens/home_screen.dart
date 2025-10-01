import 'package:flutter/material.dart';
import 'package:practical_5/screens/aptitude_screen.dart';
import 'package:practical_5/screens/coding_screen.dart';
import 'package:practical_5/screens/interview_screen.dart';
import 'package:practical_5/screens/resume_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const MainHomeScreen(),
    const AptitudeScreen(),
    const CodingScreen(),
    const InterviewScreen(),
    const ResumeScreen(),
  ];

  final List<String> _titles = [
    'Placement Prep',
    'Aptitude',
    'Coding',
    'Interview',
    'Resume',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_selectedIndex]), centerTitle: true),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Aptitude',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.code), label: 'Coding'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Interview'),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Resume',
          ),
        ],
      ),
    );
  }
}

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Student Info Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Student Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleLarge!.color,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.person, color: Color(0xFF89B4FA)),
                      const SizedBox(width: 8),
                      Text(
                        'Prince Lad',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.badge, color: Color(0xFF89B4FA)),
                      const SizedBox(width: 8),
                      Text(
                        'ID: 23CS037',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Welcome Message
          Text(
            'Welcome to Placement Preparation',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.titleLarge!.color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your comprehensive guide to crack placement interviews',
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
          ),
          const SizedBox(height: 20),

          // Quick Stats
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  context,
                  'Topics Covered',
                  '50+',
                  Icons.topic,
                  const Color(0xFFa6e3a1),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatCard(
                  context,
                  'Practice Questions',
                  '200+',
                  Icons.quiz,
                  const Color(0xFFf9e2af),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  context,
                  'Interview Tips',
                  '25+',
                  Icons.lightbulb,
                  const Color(0xFFfab387),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatCard(
                  context,
                  'Resume Templates',
                  '10+',
                  Icons.description,
                  const Color(0xFFcba6f7),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Features Overview
          Text(
            'Key Features',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.titleLarge!.color,
            ),
          ),
          const SizedBox(height: 16),
          _buildFeatureCard(
            context,
            'Aptitude Practice',
            'Master quantitative, logical, and verbal reasoning',
            Icons.calculate,
            const Color(0xFF89B4FA),
          ),
          const SizedBox(height: 12),
          _buildFeatureCard(
            context,
            'Coding Challenges',
            'Practice data structures, algorithms, and problem solving',
            Icons.code,
            const Color(0xFFa6e3a1),
          ),
          const SizedBox(height: 12),
          _buildFeatureCard(
            context,
            'Interview Preparation',
            'Technical and HR interview questions with answers',
            Icons.people,
            const Color(0xFFf9e2af),
          ),
          const SizedBox(height: 12),
          _buildFeatureCard(
            context,
            'Resume Building',
            'Professional templates and writing guidelines',
            Icons.description,
            const Color(0xFFfab387),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.titleMedium!.color,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
      ),
    );
  }
}
