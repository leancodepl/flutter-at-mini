import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:week3/author_screen.dart';
import 'package:week3/book_list_screen.dart';
import 'package:week3/book_screen.dart';
import 'package:week3/genre_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Week 3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
        ),
      ),
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
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
  ],
);
