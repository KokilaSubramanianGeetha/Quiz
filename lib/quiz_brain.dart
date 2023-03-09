import 'question.dart';

class QuizBrain{

  int _questionNumber = 0;

  List <Question> _questionBank = [
    Question('Sharks are mammals.',false),
    Question('Sea otters have a favorite rock they use to break open food.',true),
    Question('The blue whale is the biggest animal to have ever lived.',true),
    Question('The hummingbird egg is the world\'s smallest bird egg.',true),
    Question('Pigs roll in the mud because they don’t like being clean.',false),
    Question('Bats are blind.',false),
    Question('A dog sweats by panting its tongue.',false),
    Question(' It takes a sloth two weeks to digest a meal.',true),
    Question('The largest living frog is the Goliath frog of West Africa,',true),
    Question('An ant can lift 1,000 times its body weight.',false),
    Question('When exiting a cave, bats always go in the direction of the wind.',false),
    Question('Galapagos tortoises sleep up to 16 hours a day',true),
    Question('An octopus has seven hearts.',false),
    Question('The goat is the national animal of Scotland.',false),
    Question('Herbivores are animal eaters.',false),

  ];



  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if(_questionNumber < _questionBank.length){
      _questionNumber++;
    }
  }

void reset(){
    _questionNumber=0;

}
 bool isFinished() {
  if (_questionNumber >= _questionBank.length-1) {
   return true;
  }
  else{
    return false;
}
  }
}