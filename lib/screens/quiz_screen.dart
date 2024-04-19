import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Icon> scoreKeeper = [];
  void checkerAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(1, 34, 34, 34),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                quizBrain.getquestionText(),
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: GestureDetector(
                onTap: () {
                  checkerAnswer(true);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.green),
                  child: Center(
                      child: Text(
                    "True",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: GestureDetector(
                onTap: () {
                  checkerAnswer(false);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Colors.red),
                  child: Center(
                      child: Text(
                    "False",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
            Wrap(
              children: scoreKeeper,
            ),
          ],
        ),
      ),
    );
  }
}
