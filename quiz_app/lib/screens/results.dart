// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/data/qdata.dart';
import 'package:todo_app/screens/home.dart';

class Result extends StatelessWidget {
  const Result(this.restart, this.SelectedAnswers, {super.key});

  final List<String> SelectedAnswers;
  final Function() restart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < SelectedAnswers.length; i++) {
      int indexOfCorrect = questions[i].indexOfAnswer;
      summary.add({
        'questionIndex': i + 1,
        'question': questions[i].text,
        'correctAnswer': questions[i].answers[indexOfCorrect],
        'userAnswer': SelectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    int numOfCorrectAnswers = summaryData
        .where((element) => element['correctAnswer'] == element["userAnswer"])
        .toList()
        .length;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            Text(
              "You Answered ${numOfCorrectAnswers} out of ${SelectedAnswers.length} questions correctly ",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 30,
            ),
            ...summaryData.map((e) {
              return Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(8),
                    child: Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.white70,
                        shadowColor: Colors.white,
                        margin: EdgeInsets.all(10),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Question ${e['questionIndex']}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                e['question'].toString(),
                                softWrap: true,
                              ),
                              Row(
                                children: [
                                  e['userAnswer'] == e['correctAnswer']
                                      ? Icon(Icons.check_circle_rounded,
                                          color: Colors.green)
                                      : Icon(Icons.close, color: Colors.red),
                                  Flexible(
                                    child: Text(
                                      ' Your Answer : ${e['userAnswer']}',
                                      softWrap: true,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.green,
                                  ),
                                  Flexible(
                                    child: Text(
                                      ' Correct Answer : ${e['correctAnswer']}',
                                      softWrap: true,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
            SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.white30,
                surfaceTintColor: Colors.black54,
              ),
              onPressed: restart,
              label: Text("Restart Quiz"),
              icon: Icon(Icons.replay),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
