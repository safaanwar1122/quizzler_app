import 'package:flutter/material.dart';
import 'question.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
void main() => runApp(MyApp());

QuestionBrain brain = new QuestionBrain();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = brain.getCorrectAnswer(); // getting the correct answer

    setState(() {
      if (brain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        // question number is set to 0 again
        brain.reset();

        scoreKeeper.clear();
        // scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          // navtive method of list to add something
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
            size: 25.0,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
            size: 25.0,
          ));
        }

        brain.getNextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QUIZZIE'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(15),
                color: Colors.blueGrey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: Text(
                          brain.getQuestionText(),
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        //color: Colors.green,
                        onPressed: () {
                          checkAnswer(true);
                        },
                        child: Text(
                          'TRUE',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Expanded(
                      child: TextButton(
                        //color: Colors.red,
                        onPressed: () {
                          checkAnswer(false);
                        },
                        child: Text(
                          'FALSE',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: scoreKeeper,
                    ),
                  ],
                ),
            ),
          ),
        ],
      ),
    );
  }
}