import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  Answer({required this.answerText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Color.fromRGBO(185, 236, 171, 100),
            foregroundColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            minimumSize: Size(239, 50)),
        onPressed: () {},
        child: Text(
          answerText,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
