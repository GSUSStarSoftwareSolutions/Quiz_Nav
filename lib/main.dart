import 'package:flutter/material.dart';
import 'package:quiz/display.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaterialAppExam(),
    );
  }
}

class MaterialAppExam extends StatefulWidget {
  const MaterialAppExam({Key? key});

  @override
  State<MaterialAppExam> createState() => _MaterialAppExamState();
}

class _MaterialAppExamState extends State<MaterialAppExam> {
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
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('images/quiz-logo.png', width: 300),
              SizedBox(height: 60.0),
              Text(
                'Learn Flutter the fun way!',
                style: TextStyle(fontSize: 28.0, color: Colors.white),
              ),
              SizedBox(height: 40.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Display()),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_right_alt, color: Colors.black),
                    SizedBox(
                        width: 5), // Add some spacing between the icon and text
                    Text(
                      'Start',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
