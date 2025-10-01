import 'package:flutter/material.dart';

void main() {
  runApp(const GujaratSchemesApp());
}

class GujaratSchemesApp extends StatelessWidget {
  const GujaratSchemesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gujarat Government Schemes',
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
      home: const SchemesHomePage(),
    );
  }
}

class SchemesHomePage extends StatelessWidget {
  const SchemesHomePage({super.key});

  final List<Scheme> schemes = const [
    Scheme(
      name: 'PM-KISAN',
      description: 'Financial assistance to farmers',
      category: 'Agriculture',
      icon: Icons.agriculture,
    ),
    Scheme(
      name: 'Beti Bachao Beti Padhao',
      description: 'Girl child education and empowerment',
      category: 'Women & Child',
      icon: Icons.school,
    ),
    Scheme(
      name: 'Ayushman Bharat',
      description: 'Health insurance for poor families',
      category: 'Health',
      icon: Icons.medical_services,
    ),
    Scheme(
      name: 'MGNREGA',
      description: 'Rural employment guarantee scheme',
      category: 'Employment',
      icon: Icons.work,
    ),
    Scheme(
      name: 'Jan Aushadhi',
      description: 'Affordable medicines for all',
      category: 'Health',
      icon: Icons.local_pharmacy,
    ),
    Scheme(
      name: 'Digital Gujarat',
      description: 'Digital services and governance',
      category: 'Technology',
      icon: Icons.computer,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gujarat Government Schemes',
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
                Icon(Icons.account_balance, size: 48, color: Color(0xFF89B4FA)),
                SizedBox(height: 12),
                Text(
                  'Government of Gujarat',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFcdd6f4),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Citizen Services & Welfare Schemes',
                  style: TextStyle(fontSize: 16, color: Color(0xFFb4befe)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Schemes List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: schemes.length,
              itemBuilder: (context, index) {
                final scheme = schemes[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  color: const Color(0xFF313244),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFF89B4FA),
                      child: Icon(scheme.icon, color: const Color(0xFF1e1e2e)),
                    ),
                    title: Text(
                      scheme.name,
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
                          scheme.description,
                          style: const TextStyle(color: Color(0xFFb4befe)),
                        ),
                        const SizedBox(height: 8),
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
                            scheme.category,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF89B4FA),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF89B4FA),
                      size: 16,
                    ),
                    onTap: () {
                      _showSchemeDetails(context, scheme);
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

  void _showSchemeDetails(BuildContext context, Scheme scheme) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF313244),
          title: Row(
            children: [
              Icon(scheme.icon, color: const Color(0xFF89B4FA)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  scheme.name,
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
              Text(
                'Category: ${scheme.category}',
                style: const TextStyle(
                  color: Color(0xFF89B4FA),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                scheme.description,
                style: const TextStyle(color: Color(0xFFb4befe), fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'For more information, visit the official Gujarat Government portal or contact your local government office.',
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
                'Close',
                style: TextStyle(
                  color: Color(0xFF89B4FA),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class Scheme {
  final String name;
  final String description;
  final String category;
  final IconData icon;

  const Scheme({
    required this.name,
    required this.description,
    required this.category,
    required this.icon,
  });
}
