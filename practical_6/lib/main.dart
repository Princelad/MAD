import 'package:flutter/material.dart';

void main() {
  runApp(const ITQuizApp());
}

class ITQuizApp extends StatelessWidget {
  const ITQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IT Quiz App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1e1e2e),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF89B4FA),
          foregroundColor: Color(0xFF1e1e2e),
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFFcdd6f4)),
          bodyMedium: TextStyle(color: Color(0xFFcdd6f4)),
        ),
      ),
      home: QuizHomePage(),
    );
  }
}

class QuizHomePage extends StatelessWidget {
  QuizHomePage({super.key});

  final List<QuizSubject> subjects = [
    const QuizSubject(
      name: 'Programming Languages',
      description: 'Test your knowledge of Java, Python, C++, and more',
      difficulty: 'Intermediate',
      icon: Icons.code,
      questionCount: 10,
    ),
    const QuizSubject(
      name: 'Data Structures & Algorithms',
      description: 'Arrays, trees, graphs, sorting, and searching algorithms',
      difficulty: 'Advanced',
      icon: Icons.account_tree,
      questionCount: 12,
    ),
    const QuizSubject(
      name: 'Database Management',
      description: 'SQL, NoSQL, DBMS concepts, and database design',
      difficulty: 'Intermediate',
      icon: Icons.storage,
      questionCount: 8,
    ),
    const QuizSubject(
      name: 'Web Development',
      description: 'HTML, CSS, JavaScript, React, and web technologies',
      difficulty: 'Beginner',
      icon: Icons.web,
      questionCount: 15,
    ),
    const QuizSubject(
      name: 'Computer Networks',
      description: 'OSI model, TCP/IP, protocols, and network security',
      difficulty: 'Advanced',
      icon: Icons.wifi,
      questionCount: 10,
    ),
    const QuizSubject(
      name: 'Mobile Development',
      description: 'Flutter, React Native, Android, and iOS development',
      difficulty: 'Intermediate',
      icon: Icons.phone_android,
      questionCount: 9,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'IT Quiz App',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF89B4FA).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFF89B4FA).withOpacity(0.3),
              ),
            ),
            child: const Column(
              children: [
                Icon(Icons.quiz, size: 48, color: Color(0xFF89B4FA)),
                SizedBox(height: 12),
                Text(
                  'IT Knowledge Quiz',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFcdd6f4),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Test your IT skills across different subjects',
                  style: TextStyle(fontSize: 16, color: Color(0xFFb4befe)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Quiz Subjects List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                final subject = subjects[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  color: const Color(0xFF313244),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFF89B4FA),
                      child: Icon(subject.icon, color: const Color(0xFF1e1e2e)),
                    ),
                    title: Text(
                      subject.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFcdd6f4),
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          subject.description,
                          style: const TextStyle(color: Color(0xFFb4befe)),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF89B4FA).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                subject.difficulty,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF89B4FA),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFb4befe).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '${subject.questionCount} questions',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFb4befe),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: const Icon(
                      Icons.play_arrow,
                      color: Color(0xFF89B4FA),
                      size: 24,
                    ),
                    onTap: () {
                      _showQuizDetails(context, subject);
                    },
                  ),
                );
              },
            ),
          ),

          // Student Info Footer
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: const Column(
              children: [
                Text(
                  'Student ID: 23CS037',
                  style: TextStyle(
                    color: Color(0xFFb4befe),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Prince Lad',
                  style: TextStyle(
                    color: Color(0xFFcdd6f4),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showQuizDetails(BuildContext context, QuizSubject subject) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF313244),
          title: Row(
            children: [
              Icon(subject.icon, color: const Color(0xFF89B4FA)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  subject.name,
                  style: const TextStyle(
                    color: Color(0xFFcdd6f4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Difficulty: ${subject.difficulty}',
                    style: const TextStyle(
                      color: Color(0xFF89B4FA),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${subject.questionCount} Questions',
                    style: const TextStyle(
                      color: Color(0xFFb4befe),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                subject.description,
                style: const TextStyle(color: Color(0xFFb4befe), fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Are you ready to test your knowledge in this subject? Click "Start Quiz" to begin!',
                style: TextStyle(color: Color(0xFFcdd6f4), fontSize: 14),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Color(0xFFb4befe),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _startQuiz(context, subject);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF89B4FA),
                foregroundColor: const Color(0xFF1e1e2e),
              ),
              child: const Text(
                'Start Quiz',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  void _startQuiz(BuildContext context, QuizSubject subject) {
    // For now, show a simple message. Later this can navigate to actual quiz
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Starting ${subject.name} quiz...'),
        backgroundColor: const Color(0xFF89B4FA),
      ),
    );
  }
}

class QuizSubject {
  final String name;
  final String description;
  final String difficulty;
  final IconData icon;
  final int questionCount;

  const QuizSubject({
    required this.name,
    required this.description,
    required this.difficulty,
    required this.icon,
    required this.questionCount,
  });
}
