import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/joke.dart';
import '../../providers/joke_provider.dart';

class JokeTile extends StatelessWidget {
  final Joke joke;
  final VoidCallback onFavoriteToggle;

  const JokeTile({
    super.key,
    required this.joke,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    bool isFavorite = context.watch<JokesProvider>().isFavorite(joke);

    return ListTile(
      title: Text(joke.setup),
      subtitle: Text(joke.punchline),
      trailing: IconButton(
        icon: Icon(
          Icons.favorite,
          color: isFavorite ? Colors.red : Colors.grey,
        ),
        onPressed: onFavoriteToggle,
      ),
    );
  }
}
