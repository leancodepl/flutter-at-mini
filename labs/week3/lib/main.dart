import 'package:bookstore_data/bookstore_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:week3/author_screen.dart';
import 'package:week3/book_list_screen.dart';
import 'package:week3/book_screen.dart';
import 'package:week3/genre_screen.dart';

void main() {
  GoRouter.optionURLReflectsImperativeAPIs = true;
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
          seedColor: Colors.lightBlue,
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

class BookListCard extends StatelessWidget {
  const BookListCard({super.key, required this.book});
  final Book book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Card(
        color: const Color(0xFFFDEAE7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () => context.push('/book/${book.id}'),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.bookmark,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'by ${book.author.name}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black54,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
