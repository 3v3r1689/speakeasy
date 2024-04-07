// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speakeasy/presentation/widgets/slider_bar.dart';

class PhraseSpeak extends StatelessWidget {
  final String phraseToSpeak;
  double speechRate = 0.5;

  PhraseSpeak({super.key, required this.phraseToSpeak});

  final FlutterTts textToSpeech = FlutterTts();

  rate(double v) async {
    speechRate = v / 100;
  }

  speak(String text) async {
    await textToSpeech.setLanguage("en-US");
    await textToSpeech.setPitch(0.9);
    await textToSpeech
        .setSpeechRate(speechRate); // Value can be between 0(slow) and 1(fast)
    await textToSpeech.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0, right: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[350]?.withOpacity(1),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  phraseToSpeak,
                  style: const TextStyle(fontSize: 20, color: Colors.black54),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                child: IconButton(
                    icon: const Icon(
                      Icons.play_circle,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      speak(phraseToSpeak);
                    }),
              )
            ],
          ),
          Material(
            child: SliderFb2(
              min: 0.0,
              max: 100.0,
              gradient:
                  const LinearGradient(colors: [Colors.indigo, Colors.purple]),
              onChange: (v) {
                rate(v);
              },
            ),
          )
        ],
      ),
    );
  }
}
