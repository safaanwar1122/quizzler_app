//import 'package:quizzie/question_class.dart';
import 'question.dart';
import 'quiz_brain.dart';
class QuestionBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    // list have indices or an index it defines the position of the item in the list
    // it starts with 0 to ......

    Question('Mount Everest is in Japan', false),
    Question('Mount Everest is in Nepal', true),
    Question('K2 is in China', false),
    Question('K2  is in Pakistan', true),
    Question('Yosemite Park is in USA', true),
    Question('2+2 is 5', false),
    Question('Alexander the great was an American Soldier', false),
    Question('Napolean was a cricket in England', false),
    Question('In Japanese culture tipping is bad', true),
    Question('We are living in a simulation', false),
    Question(
        'If we walk earth 10000 times, we will cover distance to moon', true),
    Question('Instead is same as inspite', true),
    Question('This is a shit quiz', true),
  ];

  // getting question text

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  // whatever the question number
  // return the answer for it

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

//  next question

  void getNextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  // this resets everything back to 0

  void reset() {
    _questionNumber = 0;
  }

  // this returns boolean

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('quiz has run out of questions');
      return true;
    }
    else {
      return false;
    }
  }
}