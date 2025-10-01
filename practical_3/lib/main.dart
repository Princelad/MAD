import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MatchingGame(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFF1e1e2e),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF89B4FA),
          foregroundColor: Color(0xFF1e1e2e),
          elevation: 0,
        ),
      ),
    ),
  );
}

class MatchingGame extends StatefulWidget {
  const MatchingGame({super.key});

  @override
  State<MatchingGame> createState() => _MatchingGameState();
}

class GameItem {
  final String id;
  final String emoji;
  final String word;
  bool isMatched;
  bool isSelected;

  GameItem({
    required this.id,
    required this.emoji,
    required this.word,
    this.isMatched = false,
    this.isSelected = false,
  });
}

class _MatchingGameState extends State<MatchingGame>
    with TickerProviderStateMixin {
  List<GameItem> gameItems = [
    GameItem(id: '1', emoji: '🐱', word: 'CAT'),
    GameItem(id: '2', emoji: '🐶', word: 'DOG'),
    GameItem(id: '3', emoji: '🐦', word: 'BIRD'),
    GameItem(id: '4', emoji: '🦁', word: 'LION'),
    GameItem(id: '5', emoji: '🐰', word: 'RABBIT'),
    GameItem(id: '6', emoji: '🐸', word: 'FROG'),
    GameItem(id: '7', emoji: '🐯', word: 'TIGER'),
    GameItem(id: '8', emoji: '🐼', word: 'PANDA'),
  ];

  List<String> leftColumn = [];
  List<String> rightColumn = [];
  String? selectedLeft;
  String? selectedRight;
  int score = 0;
  int matches = 0;
  late AnimationController _celebrationController;
  late Animation<double> _celebrationAnimation;

  @override
  void initState() {
    super.initState();
    _celebrationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    _celebrationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _celebrationController, curve: Curves.elasticOut),
    );
    _initializeGame();
  }

  @override
  void dispose() {
    _celebrationController.dispose();
    super.dispose();
  }

  void _initializeGame() {
    // Reset all items
    for (var item in gameItems) {
      item.isMatched = false;
      item.isSelected = false;
    }

    // Shuffle and create columns
    List<String> emojis = gameItems.map((item) => item.id).toList();
    List<String> words = gameItems.map((item) => item.id).toList();

    emojis.shuffle();
    words.shuffle();

    setState(() {
      leftColumn = emojis;
      rightColumn = words;
      selectedLeft = null;
      selectedRight = null;
      score = 0;
      matches = 0;
    });
  }

  void _selectItem(String itemId, bool isLeft) {
    setState(() {
      if (isLeft) {
        selectedLeft = selectedLeft == itemId ? null : itemId;
        // Clear selection from right if selecting new left item
        if (selectedLeft == itemId) selectedRight = null;
      } else {
        selectedRight = selectedRight == itemId ? null : itemId;
        // Clear selection from left if selecting new right item
        if (selectedRight == itemId) selectedLeft = null;
      }
    });

    // Check for match
    if (selectedLeft != null && selectedRight != null) {
      _checkMatch();
    }
  }

  void _checkMatch() {
    if (selectedLeft == selectedRight) {
      // Correct match!
      setState(() {
        GameItem item = gameItems.firstWhere((item) => item.id == selectedLeft);
        item.isMatched = true;
        score += 10;
        matches++;
        selectedLeft = null;
        selectedRight = null;
      });

      _celebrationController.forward().then((_) {
        _celebrationController.reset();
      });

      // Check if game is complete
      if (matches == gameItems.length) {
        _showCompletionDialog();
      }
    } else {
      // Wrong match
      Future.delayed(Duration(milliseconds: 1000), () {
        setState(() {
          selectedLeft = null;
          selectedRight = null;
        });
      });
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFF313244),
          title: Text(
            '🎉 Congratulations! 🎉',
            style: TextStyle(
              color: Color(0xFFcdd6f4),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'You completed the matching game!',
                style: TextStyle(color: Color(0xFFcdd6f4), fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF89B4FA),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Final Score: $score',
                  style: TextStyle(
                    color: Color(0xFF1e1e2e),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _initializeGame();
              },
              child: Text(
                'Play Again',
                style: TextStyle(
                  color: Color(0xFF89B4FA),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildGameCard(String itemId, bool isLeft, bool isSelected) {
    GameItem item = gameItems.firstWhere((item) => item.id == itemId);
    bool isMatched = item.isMatched;
    String displayText = isLeft ? item.emoji : item.word;

    return AnimatedBuilder(
      animation: _celebrationAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: isMatched ? (1.0 + _celebrationAnimation.value * 0.1) : 1.0,
          child: GestureDetector(
            onTap: isMatched ? null : () => _selectItem(itemId, isLeft),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isMatched
                    ? Color(0xFF98d982) // Green for matched
                    : isSelected
                    ? Color(0xFF89B4FA) // Blue for selected
                    : Color(0xFF313244), // Default dark
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected
                      ? Color(0xFFfab387)
                      : isMatched
                      ? Color(0xFF98d982)
                      : Color(0xFF585b70),
                  width: isSelected || isMatched ? 3 : 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isSelected
                        ? Color(0xFF89B4FA).withOpacity(0.3)
                        : isMatched
                        ? Color(0xFF98d982).withOpacity(0.3)
                        : Colors.black.withOpacity(0.1),
                    blurRadius: isSelected || isMatched ? 12 : 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  displayText,
                  style: TextStyle(
                    fontSize: isLeft ? 48 : 24,
                    fontWeight: FontWeight.bold,
                    color: isMatched
                        ? Color(0xFF1e1e2e)
                        : isSelected
                        ? Color(0xFF1e1e2e)
                        : Color(0xFFcdd6f4),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "🎯 Matching Game 🎯",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Color(0xFF1e1e2e),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Score: $score',
              style: TextStyle(
                color: Color(0xFFcdd6f4),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Instructions
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF313244),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFF585b70)),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Color(0xFF89B4FA), size: 24),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Match the animals with their names! Tap one item from each column.',
                    style: TextStyle(color: Color(0xFFcdd6f4), fontSize: 16),
                  ),
                ),
              ],
            ),
          ),

          // Progress indicator
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: LinearProgressIndicator(
              value: matches / gameItems.length,
              backgroundColor: Color(0xFF313244),
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF98d982)),
              minHeight: 8,
            ),
          ),

          SizedBox(height: 8),

          Text(
            'Progress: $matches/${gameItems.length} matches',
            style: TextStyle(
              color: Color(0xFFcdd6f4),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),

          // Game area
          Expanded(
            child: Row(
              children: [
                // Left column (Emojis)
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFF89B4FA),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '🖼️ Images',
                          style: TextStyle(
                            color: Color(0xFF1e1e2e),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: leftColumn.length,
                          itemBuilder: (context, index) {
                            String itemId = leftColumn[index];
                            bool isSelected = selectedLeft == itemId;
                            return _buildGameCard(itemId, true, isSelected);
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // Divider
                Container(
                  width: 2,
                  margin: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF89B4FA),
                        Color(0xFFb4befe),
                        Color(0xFF89B4FA),
                      ],
                    ),
                  ),
                ),

                // Right column (Words)
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Color(0xFFb4befe),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '📝 Words',
                          style: TextStyle(
                            color: Color(0xFF1e1e2e),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: rightColumn.length,
                          itemBuilder: (context, index) {
                            String itemId = rightColumn[index];
                            bool isSelected = selectedRight == itemId;
                            return _buildGameCard(itemId, false, isSelected);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom controls
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _initializeGame,
                  icon: Icon(Icons.refresh),
                  label: Text('New Game'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF89B4FA),
                    foregroundColor: Color(0xFF1e1e2e),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: Color(0xFF313244),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Color(0xFF585b70)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.emoji_events,
                        color: Color(0xFFfab387),
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Best: $score',
                        style: TextStyle(
                          color: Color(0xFFcdd6f4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Student info
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              'Created by Prince Lad (23CS037)',
              style: TextStyle(color: Color(0xFF585b70), fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
