// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../data/qdata.dart';
import 'answerbutton.dart';

class Questions extends StatefulWidget {
  const Questions(this.onSelectedAnswer , {super.key});


  final void Function(String) onSelectedAnswer;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {

  var currentQuestionIndex = 0;

  void questionIterator(String answer){
    widget.onSelectedAnswer(answer);
    setState(() {
      currentQuestionIndex+=1;
    });
  }
  
  @override
  Widget build(BuildContext context) {

    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign:TextAlign.center,
            currentQuestion.text,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //... sperate operator bc the return of map is list of widget not widget
          ...currentQuestion.answers.map((e) {
            return Container(
              margin: EdgeInsets.all(10),
              child: AnswerButton(
                answer: e,
                onPressed: (){
                  questionIterator(e);
                },
              ),
            );
          }),
        ], 
      ),
    );
  }
}