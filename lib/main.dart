import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quiz());

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
     home:Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Quiz',
           style: TextStyle(
              fontSize: 20.0,
             fontWeight: FontWeight.bold,
  ),),),
     backgroundColor: Colors.white,
      body: SafeArea(
         child: Padding(
           padding: EdgeInsets.symmetric(horizontal: 10.0),
           child: QuizPage(),
  ),
  ),

  ),
      );
}}

class QuizPage extends StatefulWidget{
  @override
  _QuizPageState createState() =>  _QuizPageState();

}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if(quizBrain.isFinished()==true){
        Alert(
          context: context,
          type: AlertType.error,
          title: "QUIZ FINISHED",
          desc: "You have reached the end.If you want,you can try again",
          buttons: [
            DialogButton(
              child: Text(
                "RESTART",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        quizBrain.reset();
        scoreKeeper=[];
      }
      else {
        if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red,));
      }
      quizBrain.nextQuestion();;
      ),
      }});
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),),
        Row(
          children:scoreKeeper,
        ),
      ],
    );
  }
}


