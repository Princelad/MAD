import 'package:flutter/material.dart';

class InterviewScreen extends StatefulWidget {
  const InterviewScreen({super.key});

  @override
  State<InterviewScreen> createState() => _InterviewScreenState();
}

class _InterviewScreenState extends State<InterviewScreen> {
  int _selectedCategory = 0;

  final List<String> _categories = [
    'Technical',
    'HR Questions',
    'Behavioral',
    'Company Specific',
  ];

  final Map<String, List<Map<String, dynamic>>> _questions = {
    'Technical': [
      {
        'question':
            'What is the difference between Abstract class and Interface?',
        'answer': '''
Abstract Class:
• Can have both abstract and concrete methods
• Can have instance variables
• Supports single inheritance
• Can have constructors
• Can have access modifiers (private, protected, public)

Interface:
• All methods are abstract by default (before Java 8)
• Only constants (final static variables)
• Supports multiple inheritance
• Cannot have constructors
• All methods are public by default

Example:
abstract class Animal {
    abstract void sound();
    void sleep() { System.out.println("Sleeping"); }
}

interface Flyable {
    void fly();
}
        ''',
        'category': 'OOP',
      },
      {
        'question': 'Explain the concept of polymorphism with an example.',
        'answer': '''
Polymorphism means "many forms" - the ability of objects to take multiple forms.

Types:
1. Compile-time Polymorphism (Method Overloading)
2. Runtime Polymorphism (Method Overriding)

Example:
class Shape {
    void draw() { System.out.println("Drawing shape"); }
}

class Circle extends Shape {
    @Override
    void draw() { System.out.println("Drawing circle"); }
}

class Rectangle extends Shape {
    @Override
    void draw() { System.out.println("Drawing rectangle"); }
}

// Usage
Shape shape1 = new Circle();
Shape shape2 = new Rectangle();
shape1.draw(); // Output: Drawing circle
shape2.draw(); // Output: Drawing rectangle
        ''',
        'category': 'OOP',
      },
      {
        'question': 'What is the difference between ArrayList and LinkedList?',
        'answer': '''
ArrayList:
• Uses dynamic array internally
• Fast random access O(1)
• Slow insertion/deletion in middle O(n)
• Better for frequent access operations
• Less memory overhead

LinkedList:
• Uses doubly linked list internally
• Slow random access O(n)
• Fast insertion/deletion O(1)
• Better for frequent modification operations
• More memory overhead (stores pointers)

When to use:
• ArrayList: More reads, less modifications
• LinkedList: More modifications, less random access
        ''',
        'category': 'Data Structures',
      },
      {
        'question': 'Explain database normalization and its types.',
        'answer': '''
Database Normalization: Process of organizing data to reduce redundancy and improve data integrity.

1NF (First Normal Form):
• Eliminate duplicate columns
• Each cell contains atomic values
• Each column has unique name

2NF (Second Normal Form):
• Must be in 1NF
• Remove partial dependencies
• Non-key attributes fully depend on primary key

3NF (Third Normal Form):
• Must be in 2NF
• Remove transitive dependencies
• Non-key attributes don't depend on other non-key attributes

BCNF (Boyce-Codd Normal Form):
• Stricter version of 3NF
• Every determinant is a candidate key

Benefits:
• Reduces data redundancy
• Improves data consistency
• Saves storage space
• Easier maintenance
        ''',
        'category': 'Database',
      },
    ],
    'HR Questions': [
      {
        'question': 'Tell me about yourself.',
        'answer': '''
Structure your answer using the STAR method:

"I am a final-year Computer Science student with a passion for software development. During my academic journey, I have gained proficiency in Java, Python, and web technologies.

I completed an internship at [Company] where I developed a web application that improved user engagement by 30%. I enjoy solving complex problems and have participated in several coding competitions.

I am particularly interested in [specific area like AI/Web Development/Mobile Apps] and have worked on projects including [mention 1-2 relevant projects].

I am looking forward to starting my career with a company where I can contribute my technical skills while continuing to learn and grow professionally."

Tips:
• Keep it concise (2-3 minutes)
• Focus on professional aspects
• Highlight relevant achievements
• Connect to the role you're applying for
        ''',
        'category': 'General',
      },
      {
        'question': 'Why do you want to work for our company?',
        'answer': '''
Research-based answer structure:

"I am excited about the opportunity to work at [Company Name] for several reasons:

1. Company Mission: I align with your mission of [specific mission]. This resonates with my personal values and career goals.

2. Innovation: Your recent work on [specific project/technology] demonstrates the company's commitment to innovation, which excites me as someone passionate about [relevant area].

3. Growth Opportunities: The company's focus on employee development and the clear career progression paths would help me grow as a professional.

4. Team Culture: From my research and conversations, I understand that the company values collaboration and learning, which matches my working style.

5. Technical Stack: The opportunity to work with [specific technologies] would allow me to apply my skills while learning new ones.

I believe my background in [relevant skills] and passion for [relevant area] would allow me to contribute meaningfully to your team."

Preparation Tips:
• Research the company thoroughly
• Know their products/services
• Understand their values and culture
• Find specific aspects that genuinely interest you
        ''',
        'category': 'General',
      },
      {
        'question': 'What are your strengths and weaknesses?',
        'answer': '''
STRENGTHS - Choose relevant ones with examples:

"One of my key strengths is problem-solving. During my final year project, I encountered a performance issue that was causing system slowdowns. I systematically analyzed the code, identified the bottleneck in the database queries, and optimized them, resulting in 50% faster response times.

Another strength is my ability to learn quickly. When I needed to work with React for a project but only knew basic JavaScript, I dedicated time to learning it through online courses and practice projects, and was able to deliver a functional web application within the deadline."

WEAKNESSES - Show self-awareness and improvement:

"One area I'm working to improve is public speaking. I used to feel nervous when presenting to large groups. However, I've been actively addressing this by volunteering to present in class projects and joining the college debate club. I've noticed significant improvement in my confidence and communication skills.

Another area is that I sometimes focus too much on perfecting details, which can slow down my work. I'm learning to balance quality with efficiency by setting specific time limits for tasks and focusing on meeting requirements first, then optimizing if time permits."

Key Points:
• Be honest but strategic
• Show self-awareness
• Demonstrate growth mindset
• Provide specific examples
        ''',
        'category': 'General',
      },
    ],
    'Behavioral': [
      {
        'question':
            'Describe a time when you faced a challenging situation and how you overcame it.',
        'answer': '''
Use the STAR method (Situation, Task, Action, Result):

Example Answer:

SITUATION: "During my third year, I was working on a team project to develop a student management system. Two weeks before the deadline, one of our team members had to drop out due to personal reasons, leaving us short-handed with critical modules incomplete."

TASK: "As the team lead, I needed to ensure we delivered the project on time while maintaining quality, despite being down a team member and having significant work remaining."

ACTION: "I immediately called a team meeting to reassess our situation. I:
1. Redistributed the remaining tasks based on each member's strengths
2. Took on the most complex module myself (the database integration)
3. Extended our daily standups to identify and resolve blockers quickly
4. Reached out to our professor to explain the situation and get a 3-day extension
5. Organized coding sessions where we worked together to help each other"

RESULT: "We successfully delivered the project with the extension. Our solution received an A grade, and the professor praised our teamwork and adaptability. This experience taught me the importance of quick decision-making, clear communication, and leveraging team strengths during crises."

Key Tips:
• Choose a real, relevant example
• Show problem-solving skills
• Demonstrate leadership/teamwork
• Highlight positive outcomes
• Reflect on lessons learned
        ''',
        'category': 'Problem Solving',
      },
      {
        'question':
            'Tell me about a time when you had to work with a difficult team member.',
        'answer': '''
STAR Method Example:

SITUATION: "In my final year project, I was working with a team of 4 to develop a mobile application. One team member consistently missed meetings, submitted work late, and didn't communicate about delays, which was affecting our project timeline."

TASK: "I needed to address this situation without creating conflict while ensuring our project stayed on track."

ACTION: "I decided to approach this diplomatically:
1. First, I had a private, one-on-one conversation with the team member to understand if there were any personal challenges
2. I discovered they were struggling with the technology stack and felt embarrassed to ask for help
3. I offered to pair program with them and share learning resources
4. I restructured our workflow to include knowledge-sharing sessions
5. I also implemented a buddy system where each member had a partner for accountability"

RESULT: "The team member's performance improved significantly. They became more engaged and started contributing meaningfully. Our project was completed on time and received excellent feedback. The experience taught me that apparent 'difficult' behavior often stems from underlying issues, and empathetic leadership can transform team dynamics."

Alternative scenarios you can prepare:
• Disagreement on technical approach
• Different work styles/preferences
• Communication barriers
• Conflicting priorities

Key Points:
• Show emotional intelligence
• Demonstrate conflict resolution skills
• Focus on positive outcomes
• Highlight learning and growth
        ''',
        'category': 'Teamwork',
      },
    ],
    'Company Specific': [
      {
        'question': 'Questions to ask the interviewer',
        'answer': '''
Asking thoughtful questions shows your interest and helps you evaluate the company:

ABOUT THE ROLE:
• "Can you describe a typical day or week in this position?"
• "What are the biggest challenges someone in this role would face?"
• "What skills or qualities make someone successful in this role?"
• "How do you measure success for this position?"

ABOUT THE TEAM:
• "Can you tell me about the team I'd be working with?"
• "How does the team collaborate on projects?"
• "What's the team's approach to code reviews and knowledge sharing?"

ABOUT GROWTH:
• "What opportunities are there for learning and professional development?"
• "What does a typical career progression look like for this role?"
• "Are there mentorship programs available?"

ABOUT THE COMPANY:
• "What do you enjoy most about working here?"
• "How would you describe the company culture?"
• "What are the company's goals for the next few years?"
• "How does the company support work-life balance?"

TECHNICAL QUESTIONS:
• "What technologies and tools does the team currently use?"
• "How does the team stay updated with new technologies?"
• "What's the development process like here?"

AVOID ASKING:
• Questions easily answered by basic research
• Salary/benefits in first interview
• "Do you have any questions for me?"
• Negative questions about company problems

Remember: This is a two-way conversation. You're also evaluating if the company is right for you!
        ''',
        'category': 'General',
      },
      {
        'question': 'How to research a company before interview',
        'answer': '''
COMPANY RESEARCH CHECKLIST:

1. COMPANY WEBSITE:
• Mission, vision, and values
• Products and services
• Recent news and announcements
• Leadership team
• Company history and milestones

2. SOCIAL MEDIA & NEWS:
• LinkedIn company page
• Recent press releases
• Industry news mentions
• Company blog posts
• Twitter/social media updates

3. EMPLOYEE INSIGHTS:
• Glassdoor reviews (culture, salary, pros/cons)
• LinkedIn employee profiles
• Company culture videos
• Employee testimonials

4. FINANCIAL INFORMATION:
• Revenue and growth trends
• Recent funding rounds (for startups)
• Stock performance (for public companies)
• Market position and competitors

5. JOB-SPECIFIC RESEARCH:
• Job description keywords
• Required technologies/skills
• Team structure
• Reporting relationships

6. INDUSTRY CONTEXT:
• Industry trends and challenges
• Company's position in the market
• Major competitors
• Future outlook

WHAT TO LOOK FOR:
✓ Company growth trajectory
✓ Technology stack alignment
✓ Culture fit indicators
✓ Learning opportunities
✓ Career advancement paths
✓ Work-life balance
✓ Diversity and inclusion efforts

USE THIS RESEARCH TO:
• Tailor your answers to company values
• Ask informed questions
• Show genuine interest
• Identify how you can contribute
• Prepare specific examples
• Understand the role better

TOOLS TO USE:
• Company website and careers page
• LinkedIn (company + employees)
• Glassdoor
• Crunchbase (for startups)
• Google News
• Industry publications
        ''',
        'category': 'Preparation',
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
            'Interview Categories',
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
              questionData['answer'],
              questionData['category'],
            );
          }),

          // Interview Tips
          const SizedBox(height: 20),
          _buildInterviewTips(),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(
    int questionNumber,
    String question,
    String answer,
    String category,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ExpansionTile(
        title: Text(
          'Q$questionNumber. $question',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.titleMedium!.color,
          ),
        ),
        subtitle: Chip(
          label: Text(category),
          backgroundColor: const Color(0xFF89B4FA).withOpacity(0.2),
          labelStyle: const TextStyle(color: Color(0xFF89B4FA), fontSize: 12),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF313244),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFF89B4FA).withOpacity(0.3),
                ),
              ),
              child: SingleChildScrollView(
                child: Text(
                  answer,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                    height: 1.5,
                    fontFamily:
                        answer.contains('class ') || answer.contains('def ')
                        ? 'monospace'
                        : null,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInterviewTips() {
    final tips = [
      {
        'title': 'Before the Interview',
        'tips': [
          'Research the company thoroughly',
          'Practice common interview questions',
          'Prepare your STAR stories',
          'Get a good night\'s sleep',
          'Plan your route and arrive early',
        ],
      },
      {
        'title': 'During the Interview',
        'tips': [
          'Maintain eye contact and good posture',
          'Listen carefully to questions',
          'Take a moment to think before answering',
          'Use specific examples in your answers',
          'Ask thoughtful questions',
        ],
      },
      {
        'title': 'After the Interview',
        'tips': [
          'Send a thank-you email within 24 hours',
          'Reflect on your performance',
          'Follow up appropriately',
          'Continue applying to other opportunities',
          'Learn from the experience',
        ],
      },
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.tips_and_updates, color: Color(0xFFf9e2af)),
                const SizedBox(width: 8),
                Text(
                  'Interview Tips',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.titleLarge!.color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...tips
                .map(
                  (section) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        section['title'] as String,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF89B4FA),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...(section['tips'] as List<String>)
                          .map(
                            (tip) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: 6,
                                left: 16,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '• ',
                                    style: TextStyle(color: Color(0xFFa6e3a1)),
                                  ),
                                  Expanded(
                                    child: Text(
                                      tip,
                                      style: TextStyle(
                                        color: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium!.color,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          ,
                      const SizedBox(height: 12),
                    ],
                  ),
                )
                ,
          ],
        ),
      ),
    );
  }
}
