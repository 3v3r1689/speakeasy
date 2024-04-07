import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScoreWidget extends StatelessWidget {
  double score;
  ScoreWidget({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    score >= 100 ? score = 100 : score;
    score < 0 ? score = 0 : score;

    Color scoreColor = Colors.green;

    if (score <= 33.0) {
      scoreColor = Colors.red;
    }

    if (33.0 < score && score <= 66.0) {
      scoreColor = Colors.orange;
    }
    return Container(
      margin: const EdgeInsets.only(left: 8.0, right: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[350]?.withOpacity(1),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Text(
          "$score %",
          style: TextStyle(
              fontFamily: 'worksans',
              fontSize: 20.8,
              color: scoreColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
