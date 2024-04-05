import 'package:flutter/material.dart';

// Define the Question model with the correct answer index
class Question {
  String text;
  List<String> options;
  int correctAnswerIndex;

  Question(this.text, this.options, this.correctAnswerIndex);
}

// Define your list of questions
