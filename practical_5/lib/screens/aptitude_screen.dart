import 'package:flutter/material.dart';

class AptitudeScreen extends StatefulWidget {
  const AptitudeScreen({super.key});

  @override
  State<AptitudeScreen> createState() => _AptitudeScreenState();
}

class _AptitudeScreenState extends State<AptitudeScreen> {
  int _selectedCategory = 0;

  final List<String> _categories = [
    'Quantitative',
    'Logical Reasoning',
    'Verbal Ability',
    'Data Interpretation',
  ];

  final Map<String, List<Map<String, dynamic>>> _questions = {
    'Quantitative': [
      {
        'question':
            'If a train travels 60 km in 1 hour, how far will it travel in 2.5 hours?',
        'options': ['120 km', '150 km', '180 km', '200 km'],
        'correct': 1,
        'explanation': 'Distance = Speed × Time = 60 × 2.5 = 150 km',
      },
      {
        'question': 'What is 15% of 240?',
        'options': ['30', '36', '40', '45'],
        'correct': 1,
        'explanation': '15% of 240 = (15/100) × 240 = 36',
      },
      {
        'question':
            'The sum of three consecutive numbers is 42. What is the largest number?',
        'options': ['13', '14', '15', '16'],
        'correct': 2,
        'explanation':
            'Let the numbers be n, n+1, n+2. So n + (n+1) + (n+2) = 42. 3n + 3 = 42. n = 13. Largest = 15',
      },
    ],
    'Logical Reasoning': [
      {
        'question': 'All roses are flowers. Some flowers are red. Therefore:',
        'options': [
          'All roses are red',
          'Some roses are red',
          'No roses are red',
          'Cannot be determined',
        ],
        'correct': 3,
        'explanation':
            'We cannot determine from the given statements whether roses are red or not.',
      },
      {
        'question':
            'In a certain code, MOUSE is written as NNTRD. How is HORSE written?',
        'options': ['GNQRD', 'IPSTF', 'GNRQD', 'IPQSE'],
        'correct': 0,
        'explanation':
            'Each letter is replaced by the previous letter in alphabet: H→G, O→N, R→Q, S→R, E→D',
      },
    ],
    'Verbal Ability': [
      {
        'question': 'Choose the correct synonym for "Meticulous":',
        'options': ['Careless', 'Careful', 'Quick', 'Lazy'],
        'correct': 1,
        'explanation':
            'Meticulous means showing great attention to detail; very careful and precise.',
      },
      {
        'question':
            'Fill in the blank: "The project was completed _____ schedule."',
        'options': ['behind', 'ahead of', 'on', 'all of the above'],
        'correct': 3,
        'explanation':
            'All options can be correct depending on the context: behind schedule, ahead of schedule, on schedule.',
      },
    ],
    'Data Interpretation': [
      {
        'question':
            'A pie chart shows: Sales 40%, Marketing 25%, R&D 20%, Others 15%. If total budget is ₹100,000, what is R&D budget?',
        'options': ['₹15,000', '₹20,000', '₹25,000', '₹40,000'],
        'correct': 1,
        'explanation': 'R&D budget = 20% of ₹100,000 = ₹20,000',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Selector
          Text(
            'Choose Category',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.titleLarge!.color,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(_categories[index]),
                    selected: _selectedCategory == index,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = index;
                      });
                    },
                    selectedColor: const Color(0xFF89B4FA),
                    backgroundColor: const Color(0xFF313244),
                    labelStyle: TextStyle(
                      color: _selectedCategory == index
                          ? const Color(0xFF1e1e2e)
                          : const Color(0xFFcdd6f4),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // Questions List
          Text(
            '${_categories[_selectedCategory]} Questions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.titleLarge!.color,
            ),
          ),
          const SizedBox(height: 16),

          ..._questions[_categories[_selectedCategory]]!.asMap().entries.map((
            entry,
          ) {
            int questionIndex = entry.key;
            Map<String, dynamic> questionData = entry.value;

            return _buildQuestionCard(
              questionIndex + 1,
              questionData['question'],
              questionData['options'],
              questionData['correct'],
              questionData['explanation'],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(
    int questionNumber,
    String question,
    List<String> options,
    int correctAnswer,
    String explanation,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ExpansionTile(
        title: Text(
          'Question $questionNumber',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.titleMedium!.color,
          ),
        ),
        subtitle: Text(
          question,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...options.asMap().entries.map((entry) {
                  int index = entry.key;
                  String option = entry.value;
                  bool isCorrect = index == correctAnswer;

                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isCorrect
                            ? const Color(0xFFa6e3a1)
                            : const Color(0xFF313244),
                        foregroundColor: isCorrect
                            ? const Color(0xFF1e1e2e)
                            : const Color(0xFFcdd6f4),
                        alignment: Alignment.centerLeft,
                      ),
                      child: Text(
                        '${String.fromCharCode(65 + index)}. $option',
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF89B4FA).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFF89B4FA),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explanation:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF89B4FA),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        explanation,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
