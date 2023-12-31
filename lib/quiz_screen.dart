import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_simple_quiz_app/questionModel.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //definimos los datos

  List<question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 50, 80),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Preguntas y respuestas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            questionWidget(),
            answerList(),
            nextButton(),
          ],
        ),
      ),
    );
  }

  questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Questios ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
              color: Colors.orange, borderRadius: BorderRadius.circular(15)),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answerList
          .map(
            (e) => answerButton(e),
          )
          .toList(),
    );
  }

  Widget answerButton(answer Answer) {
    bool isSelected = Answer == selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(Answer.answerText),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: isSelected ? Colors.orangeAccent : Colors.white,
          onPrimary: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            if (Answer.isCorrect) {
              score++;
            }
            setState(() {
              selectedAnswer = Answer;
            });
          }
        },
      ),
    );
  }

  nextButton() {
    bool siguientePregunta = false;
    if (currentQuestionIndex == questionList.length - 1) {
      siguientePregunta = true;
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(siguientePregunta ? "Submit" : 'Next'),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.blueAccent,
          onPrimary: Colors.white,
        ),
        onPressed: () {
          if (siguientePregunta) {
            //display score
            showDialog(context: context, builder: (_) => mostrarScore());
          } else {
            //next
            setState(() {
              selectedAnswer = null;
              currentQuestionIndex++;
            });
          }
        },
      ),
    );
  }

  mostrarScore() {
    bool aprobado = false;

    if (score >= questionList.length * 0.6) {
      aprobado = true;
    }

    String title = aprobado ? 'Aprobaste :,)' : 'No aprobaste :,(';

    return AlertDialog(
      title: Text(
        title + " |Score is $score",
        style: TextStyle(
          color: aprobado ? Colors.greenAccent : Colors.redAccent,
        ),
      ),
      content: ElevatedButton(
        child: const Text("Jugar de nuevo?"),
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            currentQuestionIndex = 0;
            score = 0;
            selectedAnswer = null;
          });
        },
      ),
    );
  }
}
