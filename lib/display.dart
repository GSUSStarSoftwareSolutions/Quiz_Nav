import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/models1/ques.dart';
import 'package:quiz/result.dart';

void main() {
  runApp(Display());
}

class Display extends StatelessWidget {
  const Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaterialAppExam(),
    );
  }
}

class MaterialAppExam extends StatefulWidget {
  const MaterialAppExam({Key? key}) : super(key: key);

  @override
  State<MaterialAppExam> createState() => _MaterialAppExamState();
}

class _MaterialAppExamState extends State<MaterialAppExam> {
  int currentIndex = 0;
  int score = 0;
  List<Question> ques = [
    Question(
      'What are the main building blocks of Flutter UIs?',
      ['Widgets', 'Components', 'Functions', 'Blocks'],
      0, // Index of the correct answer in the options list
    ),
    Question(
      'How are Flutter UIs built?',
      [
        'By combining widgets in code',
        'By combining widgets in a visual editor',
        'By defining widgets in config files',
        'By using XCode for iOS and Android Studio for Android',
      ],
      2, // Index of the correct answer in the options list
    ),
    Question(
      'What\'s the purpose of a StatefulWidget?',
      [
        'Update UI as data changes',
        'Update data as UI changes',
        'Ignore data changes',
        'Render UI that does not depend on data',
      ],
      3,
    ),
    Question(
      'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
      [
        'StatelessWidget',
        'StatefulWidget',
        'Both are equally good',
        'None of the above',
      ],
      0,
    ),
    Question(
      'What happens if you change data in a StatelessWidget?',
      [
        'The UI is not updated',
        'The UI is updated',
        'The closest StatefulWidget is updated',
        'Any nested StatefulWidgets are updated',
      ],
      1,
    ),
    Question(
      'How should you update data inside of StatefulWidgets?',
      [
        'By calling setState()',
        'By calling updateData()',
        'By calling updateUI()',
        'By calling updateState()',
      ],
      3,
    ),
  ];
  // Add more questions here if needed
  List<int?> userAnswers = []; // List to store user answers

  void answer(int selectedAnswerIndex) {
    setState(() {
      userAnswers.add(selectedAnswerIndex); // Store user's selected answer

      if (selectedAnswerIndex == ques[currentIndex].correctAnswerIndex) {
        // Check if the user's answer is correct
        // Increment score if the answer is correct
        score++;
      }

      if (currentIndex < ques.length - 1) {
        currentIndex += 1;
      } else {
        // Navigate to the result screen when all questions are answered
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Results(ques: ques, userAnswers: userAnswers, score: score),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = ques[currentIndex];

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
                currentQuestion.text,
                style: GoogleFonts.lato(
                  color: Colors.teal[50],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              for (var i = 0; i < currentQuestion.options.length; i++)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    backgroundColor: Colors.white54,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  onPressed: () => answer(i),
                  child: Text(
                    currentQuestion.options[i],
                    style: TextStyle(color: Colors.black),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
