import 'package:flutter/material.dart';

import '../models/joke.dart';

class JokesProvider with ChangeNotifier {
  final List<Joke> _favoriteJokes = [];
  List<Joke> _jokes = [];

  List<Joke> get jokes => _jokes;
  List<Joke> get favoriteJokes => _favoriteJokes;

  void setJokes(List<Joke> jokes) {
    _jokes = jokes;
    notifyListeners();
  }

  void toggleFavorite(Joke joke) {
    joke.isFavorite = !joke.isFavorite;

    if (joke.isFavorite) {
      _favoriteJokes.add(joke);
    } else {
      _favoriteJokes.remove(joke);
    }

    notifyListeners();
  }


  bool isFavorite(Joke joke) {
    return _favoriteJokes.contains(joke);
  }


}
