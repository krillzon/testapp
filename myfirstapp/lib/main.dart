// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex += 1;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = ["whats your favorite animal?",
                     "whats your favorite color?"];
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My App!"),
          ),
          body: Center(child: Column(
            children: [
              Text(questions[questionIndex]),
              ElevatedButton(child: Text("answer1"), onPressed: answerQuestion),
              ElevatedButton(child: Text("answer2"), onPressed: 
                             () => print("answer 2 chosen")),
              ElevatedButton(child: Text("answer3"), onPressed: answerQuestion)
            ],
          ))),
    );
  }
}
