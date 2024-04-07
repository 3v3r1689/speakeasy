import 'package:flutter/material.dart';

import 'dart:math';

class ButtomsWidget extends StatelessWidget {
  final List listToPractice;
  final void Function(int) onPressed;

  const ButtomsWidget(
      {super.key, required this.onPressed, required this.listToPractice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Colors.indigo,
              Colors.deepPurple,
            ]),
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8.0)),
        child: TextButton(
          onPressed: () {
            // Genera un índice aleatorio y lo pasa a la función de devolución de llamada
            final Random random = Random();
            final int index = random.nextInt(listToPractice.length);
            onPressed(index);
          },
          child: const Text(
            "Next",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
