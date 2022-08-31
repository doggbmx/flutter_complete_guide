import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyAppPurete());
}

class MyAppPurete extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp2();
  }
}

class _MyApp2 extends State<MyAppPurete> {
  final _preguntas = const [
    {
      'questionText': 'KOMO DICE KAYUKEKI',
      'answers': [
        {'text': 'E E', 'score': 10},
        {'text': 'O O', 'score': 5},
        {'text': 'A A', 'score': 3},
        {'text': 'WEEESA', 'score': 1}
      ],
    },
    {
      'questionText': 'what\'s the use?',
      'answers': [
        {'text': 'no idea', 'score': 6},
        {'text': 'for study puposes', 'score': 10},
        {'text': 'pocas fotos tiene', 'score': 3},
        {'text': 'bimbambum', 'score': 1}
      ],
    },
    {
      'questionText': 'pq no anda el android emulator?',
      'answers': [
        {'text': 'no se banca', 'score': 10},
        {'text': 'gilada', 'score': 1},
        {'text': 'por gil', 'score': 3},
        {'text': 'niideabro', 'score': 4}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('respondido');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Mi App Chota de Kayukeki'),
          ),
          body: _questionIndex < _preguntas.length
              ? Quiz(
                  preguntas: _preguntas,
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
