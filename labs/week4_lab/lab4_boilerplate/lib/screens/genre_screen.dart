import 'package:bookstore_data/bookstore_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lab4_boilerplate/utils.dart';
import 'package:lab4_boilerplate/widgets/app_scaffold.dart';

class GenreScreen extends StatelessWidget {
  const GenreScreen({
    super.key,
    required this.genreId,
  });

  final String genreId;

  @override
  Widget build(BuildContext context) {
    final genre = Bookstore.genres.firstWhere((genre) => genre.id == genreId);
    final books = genre.books.toList();
    final authors = genre.authors.toList();

    return AppScaffold(
      title: 'Book store - ${genre.name}',
      body: CustomScrollView(
        slivers: [
          const SizedBox(height: 24).sliver,
          const SizedBox(height: 32).sliver,
          const Text('Authors', style: TextStyle(fontSize: 24))
              .columnPadded
              .sliver,
          const SizedBox(height: 16).sliver,
          SliverList.builder(
            itemBuilder: (context, index) {
              final author = authors[index];
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(author.name),
                onTap: () => context.push('/author/${author.id}'),
              );
            },
            itemCount: authors.length,
          ).sliverColumnPadded,
          const SizedBox(height: 32).sliver,
          const Text('Books', style: TextStyle(fontSize: 24))
              .columnPadded
              .sliver,
          const SizedBox(height: 16).sliver,
          SliverList.builder(
            itemBuilder: (context, index) {
              final book = books[index];
              return ListTile(
                leading: const Icon(Icons.book),
                title: Text(book.title),
                onTap: () => context.push('/book/${book.id}'),
              );
            },
            itemCount: books.length,
          ).sliverColumnPadded,
          const SizedBox(height: 48).sliver,
        ],
      ),
    );
  }
}
