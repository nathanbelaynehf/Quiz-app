import 'package:flutter/material.dart';
import 'question.dart';
import 'main.dart'; // Import main.dart to access quizKey

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'Professional wrestling is cool.', a: true),
    Question(q: 'Cena is gonna be a 17-time world champion.', a: true),
    Question(q: 'Cody Rhodes is better than Roman Reigns.', a: false),
    Question(q: 'Triple H is cooking.', a: true),
  ];

  void nextQuestion(BuildContext context) {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    } else {
      // Show an alert dialog when the quiz ends
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Quiz Finished!'),
            content: Text('You\'ve reached the end of the quiz.'),
            actions: <Widget>[
              TextButton(
                child: Text('Restart'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the alert box
                  _resetQuiz(); // Call your reset logic here
                },
              ),
            ],
          );
        },
      );
    }
  }

  // Method to reset the quiz
  void _resetQuiz() {
    _questionNumber = 0; // Reset the question number
    quizKey.currentState?.resetScoreKeeper(); // Clear the scorekeeper
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
}
