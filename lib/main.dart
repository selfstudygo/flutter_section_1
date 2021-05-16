import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyAppQuiz(title: 'Flutter MyApp'),
    );
  }
}

class MyAppQuiz extends StatefulWidget {
  MyAppQuiz({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyAppQuizState createState() => _MyAppQuizState();
}

class _MyAppQuizState extends State<MyAppQuiz> {
  final List<Map> _question = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 2},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 4}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Dog', 'score': 2},
        {'text': 'Cat', 'score': 3},
        {'text': 'Lion', 'score': 4}
      ],
    },
    {
      'questionText': 'What\'s your favorite food?',
      'answers': [
        {'text': 'Sandwich', 'score': 1},
        {'text': 'Soup', 'score': 2},
        {'text': 'Pizza', 'score': 3},
        {'text': 'Steak', 'score': 4}
      ]
    },
  ];
  int _questionIdx = 0;
  bool _ended = false;
  int _score = 0;

  void _onAnswer(int score) {
    setState(() {
      if (_ended) {
        return;
      }
      _score += score;
      _questionIdx = _questionIdx + 1;
      if (_questionIdx == _question.length) {
        _ended = true;
      }
    });
  }

  void _onReset() {
    setState(() {
      _ended = false;
      _score = 0;
      _questionIdx = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.only(top: _ended ? 20 : 10),
        child: _ended
            ? Result(_score, _onReset)
            : Quiz(
                question: _question[_questionIdx]['questionText'],
                answers: _question[_questionIdx]['answers'],
                answerHandler: _onAnswer),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
