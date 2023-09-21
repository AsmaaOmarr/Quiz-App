
import 'package:flutter/material.dart';
import 'package:todo_app/data/qdata.dart';
import 'package:todo_app/screens/home.dart';
import 'package:todo_app/screens/questions.dart';
import 'package:todo_app/screens/results.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  Widget? activeScreen ;
  List<String>SelectedAnswers=[];

  void onSelectedAnswer(String answer){
    //print(answer);
    SelectedAnswers.add(answer);
    //print(SelectedAnswers);

    if(SelectedAnswers.length == questions.length){
      setState(() {
        activeScreen = Result(restart,SelectedAnswers);
        
      });
    }
  }

  void restart(){
    setState(() {
      SelectedAnswers = [];
      activeScreen = HomeScreen(switchScreen);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    activeScreen = HomeScreen(switchScreen);
  }

  void switchScreen(){
    setState(() {
      activeScreen = Questions(onSelectedAnswer);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blue,
              Color.fromARGB(255, 244, 186, 205),
            ]) 
          ),
          child: activeScreen,
          ),
      ),
    );
  }
}