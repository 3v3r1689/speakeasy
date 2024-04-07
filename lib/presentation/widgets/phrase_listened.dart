import 'package:flutter/material.dart';

class PhraseListened extends StatefulWidget {
  final String phraseListened;

  const PhraseListened({
    super.key,
    required this.phraseListened,
  });

  @override
  State<PhraseListened> createState() => _PhraseListenedState();
}

class _PhraseListenedState extends State<PhraseListened> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0, right: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[350]?.withOpacity(1),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              widget.phraseListened,
              style: const TextStyle(fontSize: 20.0, color: Colors.black54),
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
            ),
          ),
          /*
          Container(
              margin: const EdgeInsets.all(5.0),
              child: IconButton(
                icon: const Icon(
                  Icons.play_circle,
                  color: Colors.blue,
                ),
                onPressed: (() {
                
                }),
              ))*/
        ],
      ),
    );
  }
}
