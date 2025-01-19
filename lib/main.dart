import 'package:flutter/material.dart';
import 'package:lab2_mis/screens/favourites.dart';
import 'package:lab2_mis/providers/joke_provider.dart';
import 'package:lab2_mis/screens/home.dart';
import 'package:provider/provider.dart';
import 'screens/random_joke.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  print("Handling background message: ${message.notification?.title}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission();

  String? token = await messaging.getToken();
  print("FCM Token: $token");

  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);

    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => JokesProvider(),
      child: MaterialApp(
        title: 'Lab 3',
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/randomJoke': (context) => const RandomJokeScreen(),
          '/favorite': (context) => const FavoritesScreen(),
        },
      ),
    );
  }
}
