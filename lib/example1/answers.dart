import 'package:quiz/models1/ques.dart';

class UserAnswer {
  final Question question;
  final int selectedAnswerIndex;

  UserAnswer(this.question,
      this.selectedAnswerIndex); // Change UserAnswers to UserAnswer
}
