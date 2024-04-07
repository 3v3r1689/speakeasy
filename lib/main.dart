import 'package:flutter/material.dart';

import 'package:speakeasy/presentation/config/famous_quotes.dart';
import 'package:speakeasy/presentation/config/question_to_practice.dart';
import 'package:speakeasy/presentation/config/verbs_to_practice.dart';
import 'package:speakeasy/presentation/config/words_to_practice.dart';
import 'package:speakeasy/presentation/screens/home_menu.dart';
import 'package:speakeasy/presentation/screens/pronunce_practice.dart';

void main() {
  // Bloquear la rotación de la pantalla
  //SystemChrome.setPreferredOrientations([
  //DeviceOrientation.portraitUp,
  //]); // Bloquea la rotación a vertical
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpeakEasy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const HomeMenu(),
      routes: {
        '/home': (context) => const HomeMenu(),
        '/words': (context) => PronuncePractice(
            listToPractice: WordsToPractice.wordsList, showTextTitle: "Words"),
        '/verbs': (context) => PronuncePractice(
            listToPractice: VerbsToPractice.mostUsedVerbs,
            showTextTitle: "Verbs"),
        '/questions': (context) => PronuncePractice(
            listToPractice: QuestionsToPractice.questionList,
            showTextTitle: "Questions"),
        '/quotes': (context) => PronuncePractice(
            listToPractice: FamousQuote.famousQuotes,
            showTextTitle: "Famous Quotes"),
      },
    );
  }
}
