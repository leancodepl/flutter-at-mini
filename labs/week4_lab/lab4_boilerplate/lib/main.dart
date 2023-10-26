import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lab4_boilerplate/screens/author_screen.dart';
import 'package:lab4_boilerplate/screens/book_list_screen.dart';
import 'package:lab4_boilerplate/screens/book_screen.dart';
import 'package:lab4_boilerplate/screens/genre_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'Lab 4 solution',
      // HINT: use this property to override theme
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
    );
  }
}

final _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: 'home',
    builder: (context, state) => const BookListScreen(),
    routes: [
      GoRoute(
        path: 'book/:bookId',
        builder: (context, state) => BookScreen(
          bookId: state.pathParameters['bookId']!,
        ),
      ),
      GoRoute(
        path: 'author/:authorId',
        builder: (context, state) => AuthorScreen(
          authorId: state.pathParameters['authorId']!,
        ),
      ),
      GoRoute(
        path: 'genre/:genreId',
        builder: (context, state) => GenreScreen(
          genreId: state.pathParameters['genreId']!,
        ),
      ),
    ],
  ),
]);
