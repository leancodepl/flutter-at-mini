import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:week4/app_theme.dart';
import 'package:week4/author_screen.dart';
import 'package:week4/book_list_screen.dart';
import 'package:week4/book_screen.dart';
import 'package:week4/genre_screen.dart';
import 'package:week4/global_providers.dart';

void main() {
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const GlobalProviders(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = context.watch<AppTheme>().value;

    return MaterialApp.router(
      routerConfig: _router,
      title: 'Week 4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
          brightness: brightness,
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
