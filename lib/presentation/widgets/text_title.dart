import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String textToShow;
  const TextTitle({super.key, required this.textToShow});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: const LinearGradient(colors: [
          Colors.indigo,
          Colors.deepPurple,
        ]),
      ),
      child: Center(
        child: Text(textToShow,
            style: const TextStyle(
                fontFamily: 'worksans', fontSize: 35.0, color: Colors.white)),
      ),
    );
  }
}
