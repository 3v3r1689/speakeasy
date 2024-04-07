import 'package:flutter/material.dart';
import 'package:speakeasy/presentation/config/calculate_score.dart';
import 'package:speech_to_text/speech_to_text.dart';

class PhraseToListen extends StatefulWidget {
  final String wordToSpeak;
  const PhraseToListen({super.key, required this.wordToSpeak});

  @override
  State<PhraseToListen> createState() => _PhraseToListenState();
}

class _PhraseToListenState extends State<PhraseToListen> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _wordSpoken = "";
  double _confidence = 0;
  String _wordToSpeak = "";

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    if (_speechEnabled) {
      setState(() {});
    } else {
      const SnackBar(
        content: Text('device not compatible with voice recognition'),
      );
    }
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
    _wordSpoken = "";
    _confidence = 0;
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      _wordToSpeak = widget.wordToSpeak;
      _wordSpoken = "${result.recognizedWords}";
      _confidence = result.confidence;
    });
  }

  Color scoreColor() {
    double score =
        _confidence * coincidenceWords(_wordSpoken, _wordToSpeak) ;
    Color scoreColor = Colors.green;
    if (score <= 33.0) {
      scoreColor = Colors.red;
    }

    if (33.0 < score && score <= 66.0) {
      scoreColor = Colors.orange;
    }
    return scoreColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: const LinearGradient(colors: [
            Colors.indigo,
            Colors.deepPurple,
          ])),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: () {
              _speechToText.isListening ? _stopListening() : _startListening();
            },
            backgroundColor:
                _speechToText.isListening ? Colors.red : Colors.green,
            child: const Icon(Icons.mic,
                //_speechToText.isListening ? Icons.stop : Icons.mic,
                color: Colors.white),
          ),
        ),
        Container(
          // margin: const EdgeInsets.only(left: 8.0, right: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey[350]?.withOpacity(1),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _wordSpoken,
                    style:
                        const TextStyle(fontSize: 20.0, color: Colors.black54),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[350]?.withOpacity(1),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Text(
                    _confidence > 0
                        ? "${(_confidence * coincidenceWords(_wordSpoken, _wordToSpeak) * 1.1).toStringAsFixed(1)} %"
                        : "",
                    style: TextStyle(
                        fontFamily: 'worksans',
                        fontSize: 20.8,
                        color: scoreColor(),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
