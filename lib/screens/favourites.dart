import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/joke_provider.dart';
import '../widgets/joke/joke_tile.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteJokes = context.watch<JokesProvider>().favoriteJokes;

    return Scaffold(
      appBar: AppBar(title: const Text('Favorite jokes')),
      body: favoriteJokes.isEmpty
          ? const Center(child: Text('No favorite jokes yet!'))
          : ListView.builder(
        itemCount: favoriteJokes.length,
        itemBuilder: (context, index) {
          return JokeTile(
            joke: favoriteJokes[index],
            onFavoriteToggle: () {
              context.read<JokesProvider>().toggleFavorite(favoriteJokes[index]);
            },
          );
        },
      ),
    );
  }
}
