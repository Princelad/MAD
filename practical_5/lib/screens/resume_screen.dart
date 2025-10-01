import 'package:flutter/material.dart';

class ResumeScreen extends StatefulWidget {
  const ResumeScreen({super.key});

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  int _selectedSection = 0;

  final List<String> _sections = [
    'Resume Tips',
    'Templates',
    'Sample Resume',
    'Cover Letter',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Selector
          Text(
            'Resume Builder',
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
              itemCount: _sections.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(_sections[index]),
                    selected: _selectedSection == index,
                    onSelected: (selected) {
                      setState(() {
                        _selectedSection = index;
                      });
                    },
                    selectedColor: const Color(0xFF89B4FA),
                    backgroundColor: const Color(0xFF313244),
                    labelStyle: TextStyle(
                      color: _selectedSection == index
                          ? const Color(0xFF1e1e2e)
                          : const Color(0xFFcdd6f4),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // Content based on selected section
          if (_selectedSection == 0) _buildResumeTips(),
          if (_selectedSection == 1) _buildTemplates(),
          if (_selectedSection == 2) _buildSampleResume(),
          if (_selectedSection == 3) _buildCoverLetter(),
        ],
      ),
    );
  }

  Widget _buildResumeTips() {
    final tips = [
      {
        'title': 'Resume Structure',
        'content': '''
1. Contact Information
   • Full name, phone number, email
   • LinkedIn profile, GitHub (for tech roles)
   • City, State (no need for full address)

2. Professional Summary/Objective
   • 2-3 lines highlighting your key skills
   • Tailored to the specific job

3. Education
   • Degree, Institution, Graduation year
   • GPA (if above 3.5)
   • Relevant coursework, honors

4. Technical Skills
   • Programming languages
   • Frameworks and tools
   • Databases, operating systems

5. Experience/Projects
   • Use action verbs
   • Quantify achievements
   • Focus on impact

6. Additional Sections
   • Certifications
   • Publications
   • Awards and achievements
        ''',
        'icon': Icons.account_tree,
        'color': const Color(0xFF89B4FA),
      },
      {
        'title': 'Writing Tips',
        'content': '''
DO:
• Use action verbs (developed, implemented, optimized)
• Quantify results (improved performance by 30%)
• Tailor resume for each job application
• Use consistent formatting
• Keep it to 1-2 pages
• Use professional email address
• Proofread multiple times

DON'T:
• Use personal pronouns (I, me, my)
• Include irrelevant information
• Use fancy fonts or colors
• Include photos (unless required)
• Lie or exaggerate
• Use generic objective statements
• Include references (save space)

POWER WORDS:
Achieved, Analyzed, Built, Created, Designed, 
Developed, Enhanced, Implemented, Improved, 
Led, Managed, Optimized, Resolved, Streamlined
        ''',
        'icon': Icons.edit,
        'color': const Color(0xFFa6e3a1),
      },
      {
        'title': 'ATS Optimization',
        'content': '''
Applicant Tracking Systems (ATS) scan resumes:

• Use standard section headings
• Include keywords from job description
• Use simple, clean formatting
• Avoid tables, graphics, headers/footers
• Save as .pdf or .docx
• Use standard fonts (Arial, Calibri, Times)
• Don't use images or logos
• Spell out abbreviations first time

KEYWORD STRATEGY:
• Mirror job description language
• Include both acronyms and full terms
• Use industry-specific terminology
• Include soft skills mentioned in posting

FORMATTING TIPS:
• Use bullet points, not paragraphs
• Left-align text
• Use standard date formats
• Consistent spacing and indentation
        ''',
        'icon': Icons.scanner,
        'color': const Color(0xFFf9e2af),
      },
    ];

    return Column(
      children: tips
          .map(
            (tip) => Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          tip['icon'] as IconData,
                          color: tip['color'] as Color,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          tip['title'] as String,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(
                              context,
                            ).textTheme.titleLarge!.color,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      tip['content'] as String,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildTemplates() {
    final templates = [
      {
        'name': 'Technical Resume',
        'description': 'Perfect for software engineering and IT roles',
        'features': [
          'Technical skills section',
          'Project showcase',
          'GitHub integration',
        ],
        'suitable': 'Software Engineers, Data Scientists, Web Developers',
      },
      {
        'name': 'Fresh Graduate',
        'description': 'Ideal for recent graduates with limited experience',
        'features': [
          'Education emphasis',
          'Academic projects',
          'Internship highlights',
        ],
        'suitable': 'Recent graduates, Entry-level positions',
      },
      {
        'name': 'Professional',
        'description': 'Clean and formal design for corporate roles',
        'features': [
          'Professional summary',
          'Achievement focus',
          'Clean layout',
        ],
        'suitable': 'Business roles, Management positions, Corporate jobs',
      },
      {
        'name': 'Creative',
        'description': 'Modern design for creative and design roles',
        'features': ['Portfolio links', 'Creative projects', 'Visual elements'],
        'suitable': 'Designers, Marketing, Creative roles',
      },
    ];

    return Column(
      children: [
        Card(
          color: const Color(0xFF89B4FA).withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.info, color: const Color(0xFF89B4FA)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Choose a template that matches your field and experience level. Remember to customize it for each application.',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        ...templates
            .map(
              (template) => Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        template['name'] as String,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.titleLarge!.color,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        template['description'] as String,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Key Features:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF89B4FA),
                        ),
                      ),
                      const SizedBox(height: 4),
                      ...(template['features'] as List<String>)
                          .map(
                            (feature) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: 2,
                                left: 8,
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    '• ',
                                    style: TextStyle(color: Color(0xFFa6e3a1)),
                                  ),
                                  Text(
                                    feature,
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium!.color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          ,
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFf9e2af).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Best for: ${template['suitable']}',
                          style: const TextStyle(
                            color: Color(0xFFf9e2af),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            ,
      ],
    );
  }

  Widget _buildSampleResume() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sample Resume - Software Engineer',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.titleLarge!.color,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF313244)),
              ),
              child: SingleChildScrollView(
                child: Text(
                  '''PRINCE LAD
Software Engineer | 23CS037
📧 prince.lad@email.com | 📱 +91-9999999999
🔗 linkedin.com/in/princelad | 💻 github.com/princelad

PROFESSIONAL SUMMARY
Passionate Computer Science student with strong programming skills in Java, Python, and web technologies. Experienced in full-stack development with hands-on project experience. Seeking to leverage technical skills and problem-solving abilities in a software engineering role.

EDUCATION
Bachelor of Computer Science Engineering
ABC University, Gujarat
Expected Graduation: May 2025
CGPA: 8.5/10
Relevant Coursework: Data Structures, Algorithms, Database Management, Software Engineering, Web Development

TECHNICAL SKILLS
Programming Languages: Java, Python, JavaScript, C++, HTML, CSS
Frameworks & Tools: React, Node.js, Express.js, Flutter, Git, Docker
Databases: MySQL, MongoDB, PostgreSQL
Cloud & DevOps: AWS basics, Docker, Linux
Development Tools: VS Code, IntelliJ IDEA, Postman

PROJECTS
E-Commerce Web Application | Jan 2024 - Mar 2024
• Developed full-stack e-commerce platform using React.js and Node.js
• Implemented user authentication, product catalog, and payment integration
• Optimized database queries resulting in 40% faster page load times
• Technologies: React, Node.js, MongoDB, Stripe API

Student Management System | Sep 2023 - Nov 2023
• Built comprehensive system for managing student records and attendance
• Designed responsive UI serving 200+ concurrent users
• Implemented role-based access control for admin and student users
• Technologies: Java, Spring Boot, MySQL, Bootstrap

Mobile Learning App | Flutter | Mar 2024 - May 2024
• Created educational mobile app with audio integration and interactive UI
• Implemented multi-page navigation with consistent design system
• Deployed app with 95% crash-free rate during testing phase
• Technologies: Flutter, Dart, Android Studio

EXPERIENCE
Software Development Intern | XYZ Tech Solutions | Jun 2024 - Aug 2024
• Collaborated with senior developers on client projects using React and Node.js
• Fixed 15+ bugs and implemented 5 new features improving user experience
• Participated in code reviews and agile development processes
• Gained experience with Git workflows and continuous integration

ACHIEVEMENTS & CERTIFICATIONS
• First Place - College Hackathon 2024 (Team of 4)
• AWS Certified Cloud Practitioner (2024)
• Oracle Certified Associate, Java SE 8 Programmer (2023)
• Dean's List - Fall 2023, Spring 2024

ADDITIONAL INFORMATION
• Languages: English (Fluent), Hindi (Native), Gujarati (Native)
• Interests: Open source contribution, Competitive programming, Tech blogging
• Active member of Computer Science Student Association
                  ''',
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 11,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF89B4FA).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF89B4FA), width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Key Points of This Resume:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF89B4FA),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...const [
                        '• Clear contact information with relevant links',
                        '• Concise professional summary targeting software roles',
                        '• Technical skills prominently displayed',
                        '• Projects with specific technologies and achievements',
                        '• Quantified results (40% faster, 200+ users, 15+ bugs)',
                        '• Relevant experience and internships',
                        '• Certifications and achievements that add value',
                        '• Clean, ATS-friendly formatting',
                      ]
                      .map(
                        (point) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            point,
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.color,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      )
                      ,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoverLetter() {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.email, color: Color(0xFF89B4FA)),
                    const SizedBox(width: 8),
                    Text(
                      'Cover Letter Guide',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.titleLarge!.color,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  '''A cover letter should complement your resume, not repeat it. Here's the structure:

PARAGRAPH 1 - Opening
• State the position you're applying for
• Mention how you learned about the role
• Brief hook that grabs attention

PARAGRAPH 2 - Why You're Interested
• Show knowledge about the company
• Explain why you want to work there
• Connect your values with company values

PARAGRAPH 3 - What You Bring
• Highlight 2-3 key qualifications
• Use specific examples and achievements
• Show how you can solve their problems

PARAGRAPH 4 - Closing
• Reiterate your interest
• Request an interview
• Professional sign-off

TIPS:
• Keep it to one page
• Address it to a specific person if possible
• Use the same font and header as your resume
• Proofread carefully
• Customize for each application''',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sample Cover Letter',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.titleLarge!.color,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFF313244)),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      '''Prince Lad
prince.lad@email.com
+91-9999999999

[Date]

Dear Hiring Manager,

I am writing to express my strong interest in the Software Engineer position at [Company Name] that I discovered through your careers page. As a final-year Computer Science student with a passion for developing innovative solutions, I am excited about the opportunity to contribute to your team's mission of [company-specific mission/goal].

What particularly attracts me to [Company Name] is your commitment to [specific company value/project/technology]. Your recent work on [specific project/product] aligns perfectly with my interests in [relevant technology/field]. I am impressed by how your team leverages [specific technology] to solve real-world problems, and I would love to contribute to such impactful work.

Through my academic projects and internship experience, I have developed strong skills in full-stack development, particularly with React.js, Node.js, and database management. During my recent internship at XYZ Tech Solutions, I successfully implemented features that improved user experience and collaborated effectively with senior developers in an agile environment. Additionally, my project developing an e-commerce platform resulted in 40% faster page load times through database optimization - demonstrating my ability to write efficient, scalable code.

I am particularly excited about the opportunity to work with your technology stack and contribute to [specific project/team]. My experience with [relevant technologies mentioned in job description] and my passion for continuous learning make me well-suited for this role. I would welcome the opportunity to discuss how my technical skills and enthusiasm can contribute to [Company Name]'s continued success.

Thank you for considering my application. I look forward to hearing from you.

Sincerely,
Prince Lad''',
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 11,
                        color: Colors.black87,
                        height: 1.4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
