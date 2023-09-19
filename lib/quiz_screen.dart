import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 50, 80),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: [
            const Text(
              'Preguntas y respuestas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            questionWidget(),
          ],
        ),
      ),
    );
  }
}

questionWidget() {
  return Column();
}
