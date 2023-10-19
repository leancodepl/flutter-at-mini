import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:week3_lab/author_screen.dart';
import 'package:week3_lab/book_list_screen.dart';
import 'package:week3_lab/book_screen.dart';
import 'package:week3_lab/genre_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
