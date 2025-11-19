import 'package:flutter/material.dart';

List<String> images = [
  "assets/ex3/bird.jpg",
  "assets/ex3/bird2.jpg",
  "assets/ex3/insect.jpg",
  "assets/ex3/girl.jpg",
  "assets/ex3/man.jpg",
];

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
    home: NextPreviousImageButton(),
  ),
);

class NextPreviousImageButton extends StatefulWidget {
  const NextPreviousImageButton({super.key});

  @override
  State<NextPreviousImageButton> createState() =>
      _NextPreviousImageButtonState();
}

class _NextPreviousImageButtonState extends State<NextPreviousImageButton> {
  int currentImageIndex = 0;

  void nextImage() {
    setState(() {
      currentImageIndex = currentImageIndex + 1 < images.length
          ? currentImageIndex + 1
          : 0;
    });
  }

  void previousImage() {
    setState(() {
      currentImageIndex = currentImageIndex - 1 >= 0
          ? currentImageIndex - 1
          : images.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: nextImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: previousImage,
            ),
          ),
        ],
      ),
      body: Image.asset(images[currentImageIndex]),
    );
  }
}
