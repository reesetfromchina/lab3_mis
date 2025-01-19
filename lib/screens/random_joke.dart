import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../service/api_services.dart';

class RandomJokeScreen extends StatelessWidget {
  const RandomJokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder<Joke>(
        future: ApiServices.getRandomJoke(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            Joke joke = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(joke.setup, style: const TextStyle(fontSize: 24, color: Colors.purple),),
                  Text(joke.punchline, style: const TextStyle(fontSize: 28, color: Colors.deepPurpleAccent),),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No joke available'));
          }
        },
      ),
    );
  }
}
