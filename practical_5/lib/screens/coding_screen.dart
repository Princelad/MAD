import 'package:flutter/material.dart';

class CodingScreen extends StatefulWidget {
  const CodingScreen({super.key});

  @override
  State<CodingScreen> createState() => _CodingScreenState();
}

class _CodingScreenState extends State<CodingScreen> {
  int _selectedDifficulty = 0;

  final List<String> _difficulties = ['Easy', 'Medium', 'Hard'];
  final List<Color> _difficultyColors = [
    const Color(0xFFa6e3a1), // Green for Easy
    const Color(0xFFf9e2af), // Yellow for Medium
    const Color(0xFFf38ba8), // Red for Hard
  ];

  final Map<String, List<Map<String, dynamic>>> _problems = {
    'Easy': [
      {
        'title': 'Two Sum',
        'description':
            'Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.',
        'example':
            'Input: nums = [2,7,11,15], target = 9\nOutput: [0,1]\nExplanation: nums[0] + nums[1] = 2 + 7 = 9',
        'concepts': ['Array', 'Hash Table'],
        'solution': '''
def twoSum(nums, target):
    hashmap = {}
    for i, num in enumerate(nums):
        complement = target - num
        if complement in hashmap:
            return [hashmap[complement], i]
        hashmap[num] = i
    return []
        ''',
      },
      {
        'title': 'Valid Parentheses',
        'description':
            'Given a string s containing just the characters \'(\', \')\', \'{\', \'}\', \'[\' and \']\', determine if the input string is valid.',
        'example':
            'Input: s = "()[]{}"\nOutput: true\n\nInput: s = "([)]"\nOutput: false',
        'concepts': ['String', 'Stack'],
        'solution': '''
def isValid(s):
    stack = []
    mapping = {")": "(", "}": "{", "]": "["}
    
    for char in s:
        if char in mapping:
            if not stack or stack.pop() != mapping[char]:
                return False
        else:
            stack.append(char)
    
    return not stack
        ''',
      },
      {
        'title': 'Merge Two Sorted Lists',
        'description':
            'You are given the heads of two sorted linked lists list1 and list2. Merge the two lists into one sorted list.',
        'example':
            'Input: list1 = [1,2,4], list2 = [1,3,4]\nOutput: [1,1,2,3,4,4]',
        'concepts': ['Linked List', 'Recursion'],
        'solution': '''
def mergeTwoLists(list1, list2):
    dummy = ListNode(0)
    current = dummy
    
    while list1 and list2:
        if list1.val <= list2.val:
            current.next = list1
            list1 = list1.next
        else:
            current.next = list2
            list2 = list2.next
        current = current.next
    
    current.next = list1 or list2
    return dummy.next
        ''',
      },
    ],
    'Medium': [
      {
        'title': 'Longest Substring Without Repeating Characters',
        'description':
            'Given a string s, find the length of the longest substring without repeating characters.',
        'example':
            'Input: s = "abcabcbb"\nOutput: 3\nExplanation: The answer is "abc", with the length of 3.',
        'concepts': ['String', 'Sliding Window', 'Hash Table'],
        'solution': '''
def lengthOfLongestSubstring(s):
    char_set = set()
    left = 0
    max_length = 0
    
    for right in range(len(s)):
        while s[right] in char_set:
            char_set.remove(s[left])
            left += 1
        char_set.add(s[right])
        max_length = max(max_length, right - left + 1)
    
    return max_length
        ''',
      },
      {
        'title': 'Add Two Numbers',
        'description':
            'You are given two non-empty linked lists representing two non-negative integers stored in reverse order.',
        'example':
            'Input: l1 = [2,4,3], l2 = [5,6,4]\nOutput: [7,0,8]\nExplanation: 342 + 465 = 807.',
        'concepts': ['Linked List', 'Math'],
        'solution': '''
def addTwoNumbers(l1, l2):
    dummy = ListNode(0)
    current = dummy
    carry = 0
    
    while l1 or l2 or carry:
        val1 = l1.val if l1 else 0
        val2 = l2.val if l2 else 0
        
        total = val1 + val2 + carry
        carry = total // 10
        current.next = ListNode(total % 10)
        
        current = current.next
        l1 = l1.next if l1 else None
        l2 = l2.next if l2 else None
    
    return dummy.next
        ''',
      },
    ],
    'Hard': [
      {
        'title': 'Median of Two Sorted Arrays',
        'description':
            'Given two sorted arrays nums1 and nums2, return the median of the two sorted arrays.',
        'example':
            'Input: nums1 = [1,3], nums2 = [2]\nOutput: 2.00000\nExplanation: merged array = [1,2,3] and median is 2.',
        'concepts': ['Array', 'Binary Search', 'Divide and Conquer'],
        'solution': '''
def findMedianSortedArrays(nums1, nums2):
    if len(nums1) > len(nums2):
        nums1, nums2 = nums2, nums1
    
    m, n = len(nums1), len(nums2)
    left, right = 0, m
    
    while left <= right:
        partition1 = (left + right) // 2
        partition2 = (m + n + 1) // 2 - partition1
        
        max_left1 = float('-inf') if partition1 == 0 else nums1[partition1-1]
        min_right1 = float('inf') if partition1 == m else nums1[partition1]
        
        max_left2 = float('-inf') if partition2 == 0 else nums2[partition2-1]
        min_right2 = float('inf') if partition2 == n else nums2[partition2]
        
        if max_left1 <= min_right2 and max_left2 <= min_right1:
            if (m + n) % 2 == 0:
                return (max(max_left1, max_left2) + min(min_right1, min_right2)) / 2
            else:
                return max(max_left1, max_left2)
        elif max_left1 > min_right2:
            right = partition1 - 1
        else:
            left = partition1 + 1
        ''',
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
          // Difficulty Selector
          Row(
            children: [
              Text(
                'Difficulty Level: ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.titleLarge!.color,
                ),
              ),
              Expanded(
                child: Row(
                  children: _difficulties.asMap().entries.map((entry) {
                    int index = entry.key;
                    String difficulty = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(difficulty),
                        selected: _selectedDifficulty == index,
                        onSelected: (selected) {
                          setState(() {
                            _selectedDifficulty = index;
                          });
                        },
                        selectedColor: _difficultyColors[index],
                        backgroundColor: const Color(0xFF313244),
                        labelStyle: TextStyle(
                          color: _selectedDifficulty == index
                              ? const Color(0xFF1e1e2e)
                              : const Color(0xFFcdd6f4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Problems List
          Text(
            '${_difficulties[_selectedDifficulty]} Problems',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.titleLarge!.color,
            ),
          ),
          const SizedBox(height: 16),

          ..._problems[_difficulties[_selectedDifficulty]]!.asMap().entries.map(
            (entry) {
              int problemIndex = entry.key;
              Map<String, dynamic> problemData = entry.value;

              return _buildProblemCard(
                problemIndex + 1,
                problemData['title'],
                problemData['description'],
                problemData['example'],
                problemData['concepts'],
                problemData['solution'],
                _difficultyColors[_selectedDifficulty],
              );
            },
          ),

          // Tips Section
          const SizedBox(height: 20),
          _buildTipsSection(),
        ],
      ),
    );
  }

  Widget _buildProblemCard(
    int problemNumber,
    String title,
    String description,
    String example,
    List<String> concepts,
    String solution,
    Color difficultyColor,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: difficultyColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _difficulties[_selectedDifficulty],
                    style: const TextStyle(
                      color: Color(0xFF1e1e2e),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '$problemNumber. $title',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.titleLarge!.color,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Concepts tags
            Wrap(
              spacing: 8,
              children: concepts
                  .map(
                    (concept) => Chip(
                      label: Text(
                        concept,
                        style: const TextStyle(fontSize: 12),
                      ),
                      backgroundColor: const Color(0xFF89B4FA).withOpacity(0.2),
                      labelStyle: const TextStyle(color: Color(0xFF89B4FA)),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 12),

            // Description
            Text(
              description,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium!.color,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12),

            // Example
            ExpansionTile(
              title: const Text(
                'Example',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFf9e2af),
                ),
              ),
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF313244),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    example,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      color: Color(0xFFcdd6f4),
                    ),
                  ),
                ),
              ],
            ),

            // Solution
            ExpansionTile(
              title: const Text(
                'Solution',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFa6e3a1),
                ),
              ),
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF313244),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      solution,
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        color: Color(0xFFcdd6f4),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipsSection() {
    final tips = [
      'Start with easy problems to build confidence',
      'Practice different data structures: Arrays, Linked Lists, Trees, Graphs',
      'Master common algorithms: Sorting, Searching, Dynamic Programming',
      'Use the two-pointer technique for array problems',
      'Learn to identify patterns in problems',
      'Practice time and space complexity analysis',
      'Solve problems daily to maintain consistency',
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.lightbulb, color: Color(0xFFf9e2af)),
                const SizedBox(width: 8),
                Text(
                  'Coding Tips',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.titleLarge!.color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...tips
                .map(
                  (tip) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '• ',
                          style: TextStyle(color: Color(0xFF89B4FA)),
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
          ],
        ),
      ),
    );
  }
}
