import 'package:flutter/cupertino.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget{
  final String question;
  final List<Map<String, Object>> answers;
  final Function answerHandler;
  Quiz({this.question, this.answers, this.answerHandler});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Question(
          question,
        ),
        ...answers.map((answer) {
          return Answer(answerHandler, answer);
        }),
      ],
    );
  }
}
