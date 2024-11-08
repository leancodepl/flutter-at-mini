import 'package:bookstore_data/bookstore_data.dart';
import 'package:bookstore_data/bookstore_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:week3/main.dart';

class GenreScreen extends StatelessWidget {
  const GenreScreen({super.key, required this.genreId});

  final String genreId;

  @override
  Widget build(BuildContext context) {
    final genre = Bookstore.getGenre(id: genreId);
    if (genre == null) {
      context.go('/');
      return const Scaffold(
        backgroundColor: Colors.white,
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
            ),
            title: const Text('Genre'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () => context.go('/'),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  genre.name,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Authors',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return AuthorListCard(author: genre.authors.elementAt(index));
              },
              childCount: genre.authors.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              'Books',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return BookListCard(book: genre.books.elementAt(index));
              },
              childCount: genre.books.length,
            ),
          ),
        ],
      ),
    );
  }
}

class AuthorListCard extends StatelessWidget {
  const AuthorListCard({super.key, required this.author});
  final Author author;

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
          onTap: () => context.push('/author/${author.id}'),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.perm_identity,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      author.name,
                      style: Theme.of(context).textTheme.bodyLarge,
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
