import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget{
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO( 255, 0, 0, 20),
      body: Container(
        child: Column(children: [
          const Text('Preguntas y respuestas',style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            ),
            ),
          ],
        ),
        ),
      );
      }
  }
