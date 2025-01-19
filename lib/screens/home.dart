import 'package:flutter/material.dart';
import '../service/api_services.dart';
import '../widgets/joke/joke_card.dart';
import 'joke_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          'lab3 joke-app',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/randomJoke');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              child: const Text(
                'Random joke',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/favorite');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              child: const Text(
                'Favorite jokes',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<String>>(
              future: ApiServices.getJokeTypes(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<String> jokeTypes = snapshot.data!;
                  return ListView.builder(
                    itemCount: jokeTypes.length,
                    itemBuilder: (context, index) {
                      return JokeCard(
                        jokeType: jokeTypes[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JokesListScreen(
                                jokeType: jokeTypes[index],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text(
                      'No joke types available',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
