import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final Map<String, Object> answer;
  Answer(this.selectHandler, this.answer);

  @override
  Widget build(BuildContext buildContext) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white)),
          child: Text(answer['text']),
          onPressed: () => selectHandler(answer['score']),
        ));
  }
}
