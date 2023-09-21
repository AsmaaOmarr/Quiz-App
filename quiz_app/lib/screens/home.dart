// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen(this.switchScreen,{super.key});

  //final --> statlesswidget
  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/clipart3432912.png",
          width: 200,
          color:Colors.white.withOpacity(0.8),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 20,
              color:Colors.white, 
              fontWeight: FontWeight.w500
            ),
          ),
          SizedBox(
            height: 50,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.white30,
              surfaceTintColor: Colors.black54,
            ),
            onPressed: switchScreen,
            label: Text("Start Quiz"),
            icon: Icon(Icons.arrow_right),
          )
        ], 
      ),
    );
  }
}