import 'package:flutter/material.dart';

List<Color> colors = [
  Colors.white,
  const Color(0xFFAEFFB1),
  const Color(0xFF9AFF9D),
  const Color(0xFF7CFF80),
  const Color(0xFF5AFC5F),
  const Color(0xFF3CFB42),
  const Color(0xFF1BFC23),
  const Color(0xFF01F90A),
  const Color(0xFF00CF07),
  const Color(0xFF009805),
  const Color(0xFF006403),
];
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.green,
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              children: [
                ScoreCard(subject: "Flutter", score: 8),
                ScoreCard(subject: "Dart", score: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScoreCard extends StatefulWidget {
  const ScoreCard({super.key, required this.subject, required this.score});

  final String subject;
  final int score;

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  late int currentScore = widget.score;

  void increaseScore() {
    setState(() {
      currentScore = (currentScore + 1).clamp(0, 10);
    });
  }

  void decreaseScore() {
    setState(() {
      currentScore = (currentScore - 1).clamp(0, 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        spacing: 20,
        children: [
          Text(
            "My score in ${widget.subject}",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 100,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                tooltip: 'Decrease Score',
                onPressed: decreaseScore,
              ),
              IconButton(
                icon: const Icon(Icons.add),
                tooltip: 'Increase Score',
                onPressed: increaseScore,
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              border: Border.all(color: Colors.grey),
            ),
            child: ClipRRect(
              child: Row(
                children: [
                  Expanded(
                    flex: currentScore,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: colors[currentScore],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10 - currentScore,
                    child: Container(height: 100),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
