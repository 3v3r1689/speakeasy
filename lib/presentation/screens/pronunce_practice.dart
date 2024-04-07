import 'package:flutter/material.dart';
import 'package:speakeasy/presentation/widgets/buttoms_widget.dart';
import 'package:speakeasy/presentation/widgets/phrase_speak.dart';
import 'package:speakeasy/presentation/widgets/phrase_to_listen.dart';
import 'package:speakeasy/presentation/widgets/text_title.dart';

class PronuncePractice extends StatefulWidget {
  final String showTextTitle;
  final List listToPractice;
  const PronuncePractice(
      {super.key, required this.listToPractice, required this.showTextTitle});

  @override
  State<PronuncePractice> createState() => _PronuncePracticeState();
}

class _PronuncePracticeState extends State<PronuncePractice> {
  int wordIndex = 0;

  void changeWord(int newIndex) {
    setState(() {
      wordIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text(
            'SpeakEasy',
            style: TextStyle(
                fontFamily: 'worksans', color: Colors.white, fontSize: 12.4),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          )),
      body: Stack(
        children: [
          Container(
              // Place as the child widget of a scaffold
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/gradient_background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container() // Place child here
              ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextTitle(
                textToShow: widget.showTextTitle,
              ),
              PhraseSpeak(phraseToSpeak: widget.listToPractice[wordIndex]),
              PhraseToListen(
                wordToSpeak: widget.listToPractice[wordIndex],
              ),
              ButtomsWidget(
                onPressed: changeWord,
                listToPractice: widget.listToPractice,
              )
            ],
          )
        ],
      ),
    );
  }
}
