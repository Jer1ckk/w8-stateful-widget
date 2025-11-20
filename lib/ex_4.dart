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
          padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
          color: Colors.green,
          child: SingleChildScrollView(
            child: Column(spacing: 20, children: [Mycard(title: "Flutter", score: 10,)]),
          ),
        ),
      ),
    );
  }
}

class Mycard extends StatefulWidget {
  const Mycard({super.key, required this.title, required this.score});

  final String title;
  final int score;

  @override
  State<Mycard> createState() => _MycardState();
}

class _MycardState extends State<Mycard> {
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
        children: [
          TitleCard(title: widget.title),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 40,
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
                    flex: 1,
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                        color: colors[currentScore],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10 - currentScore,
                    child: Container(height: 20),
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

class TitleCard extends StatelessWidget {
  const TitleCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      "My score in $title",
      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
    );
  }
}
