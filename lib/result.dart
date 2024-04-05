import 'package:flutter/material.dart';
import 'package:quiz/models1/ques.dart';

class Results extends StatelessWidget {
  final List<Question> ques;
  final List<int?> userAnswers;
  final int score;

  const Results(
      {Key? key,
      required this.ques,
      required this.userAnswers,
      required this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 65, 5, 120),
              Color.fromARGB(245, 60, 4, 90),
            ],
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Your score: $score out of ${ques.length}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              for (var i = 0; i < ques.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Question: ${ques[i].text}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Correct Answer: ${ques[i].options[ques[i].correctAnswerIndex]}',
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      'Your Answer: ${ques[i].options[userAnswers[i] ?? -1]}',
                      style: TextStyle(
                          color: userAnswers[i] == ques[i].correctAnswerIndex
                              ? Colors.green
                              : Colors.red),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              SizedBox(height: 20.0),
              TextButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  backgroundColor: Colors.white54,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: () {
                  // Restart quiz
                  Navigator.pop(context);
                },
                child:
                    Text('Restart quiz', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
