import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function onReset;

  Result(this.resultScore, this.onReset);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
        TextButton(
            onPressed: onReset,
            child: Text('Restart'),
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
                foregroundColor: MaterialStateProperty.all(Colors.orange),
                backgroundColor:
                    MaterialStateProperty.all(Colors.transparent))),
      ],
    ));
  }
}
