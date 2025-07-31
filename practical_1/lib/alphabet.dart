import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'main.dart';
import 'numbers.dart';

class Alphabet extends StatefulWidget {
  const Alphabet({super.key});

  @override
  State<Alphabet> createState() => _AlphabetState();
}

class _AlphabetState extends State<Alphabet> {
  int _selectedIndex = 1;
  final player = AudioPlayer();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainApp()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Numbers()),
      );
    }
  }

  void playSound(String letter) async {
    await player.play(AssetSource('sounds/$letter.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alphabets", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFF89B4FA),
        foregroundColor: Color(0xFFcdd6f4),
      ),
      body: Container(
        color: Color(0xFF1e1e2e),
        child: Center(
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            shrinkWrap: true,
            children: List.generate(26, (index) {
              String letter = String.fromCharCode(65 + index);
              return ElevatedButton(
                onPressed: () {
                  playSound(letter);
                },
                style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Color(0xFFcdd6f4)),
                  backgroundColor: WidgetStatePropertyAll(Color(0xFF11111b)),
                  textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 60)),
                  shape: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.pressed)) {
                      return CircleBorder(
                        side: BorderSide(color: Color(0xFFb4befe), width: 3),
                      );
                    }
                    return CircleBorder(
                      side: BorderSide(color: Color(0xFF6c7086), width: 3),
                    );
                  }),
                ),
                child: Text(letter),
              );
            }),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF11111b),
        selectedItemColor: Color(0xFF89B4FA),
        unselectedItemColor: Color(0xFF6c7086),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Alphabets'),
          BottomNavigationBarItem(icon: Icon(Icons.numbers), label: 'Numbers'),
        ],
      ),
    );
  }
}
