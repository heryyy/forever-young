import 'package:flutter/material.dart';

void main() => runApp(LyricsApp());

class LyricsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lyrics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LyricsPage(),
    );
  }
}

class LyricsPage extends StatefulWidget {
  @override
  _LyricsPageState createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage> with SingleTickerProviderStateMixin {
  List<String> lyrics = [
    "So many adventures couldn't happen today",
    "So many songs we forgot to play",
    "So many dreams swinging out of the blue",
    "We'll let 'em come true",
    "Forever young",
    "I want to be forever young",
    "Do you really want to live forever?",
    "Forever, and ever",
    "Forever young",
    "I want to be forever young",
    "Do you really want to live forever?",
    "Forever, and ever",
    "Forever young",
    "I wanna be forever young",
    "Do you really want to live forever? (Forever)"
  ];

  List<int> delays = [
    3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000,
    3000, 3000
  ];

  int currentIndex = 0;
  String currentLine = "";
  int currentCharIndex = 0;

  late AnimationController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );

    _controller.addListener(() {
      setState(() {
        if (currentCharIndex < lyrics[currentIndex].length) {
          currentLine += lyrics[currentIndex][currentCharIndex];
          currentCharIndex++;
        } else {
          _controller.stop();
          Future.delayed(Duration(milliseconds: delays[currentIndex]), () {
            setState(() {
              currentIndex++;
              currentLine = "";
              currentCharIndex = 0;
              if (currentIndex < lyrics.length) {
                _controller.repeat();
              } else {
                isPlaying = false;
              }
            });
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void startLyrics() {
    setState(() {
      currentIndex = 0;
      currentLine = "";
      currentCharIndex = 0;
      isPlaying = true;
      _controller.repeat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/biru.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Text(
              currentLine,
              style: const TextStyle(
                color: Color.fromARGB(255, 17, 37, 82),
                fontSize: 24,
                fontFamily: 'Serif',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          if (!isPlaying)
            Center(
              child: ElevatedButton(
                onPressed: startLyrics,
                child: const Text("Start"),
              ),
            ),
        ],
      ),
    );
  }
}