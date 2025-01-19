import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final String jokeType;
  final Function onTap;

  const JokeCard({super.key, required this.jokeType, required this.onTap});


  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
      ),
      onPressed: ()  =>onTap(),
      child: Text(jokeType),
    );
  }
}
