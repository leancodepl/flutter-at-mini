import 'package:bookstore_data/bookstore_data.dart';
import 'package:flutter/material.dart';
import 'package:week4/common_widgets.dart';

class GenreScreen extends StatelessWidget {
  const GenreScreen({super.key, required this.genreId});

  final String genreId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: switch (Bookstore.getGenre(id: genreId)) {
        final genre? => CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: _SliverGenreContent(genre),
              ),
            ],
          ),
        null => Center(child: Text('Genre with id $genreId not found')),
      },
    );
  }
}

class _SliverGenreContent extends StatelessWidget {
  const _SliverGenreContent(this.genre);

  final Genre genre;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Genre(:name, :authors, :books) = genre;

    return SliverMainAxisGroup(
      slivers: [
        SliverList.list(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16),
              child: PageTitle(name),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16),
              child: Text(
                'Authors',
                style: theme.textTheme.headlineSmall,
              ),
            ),
          ],
        ),
        SliverList.separated(
          itemCount: authors.length,
          itemBuilder: (context, index) =>
              AuthorEntry(author: authors.elementAt(index)),
          separatorBuilder: (context, _) => const SizedBox(height: 16),
        ),
        SliverList.list(
          children: [
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16),
              child: Text(
                'Books',
                style: theme.textTheme.headlineSmall,
              ),
            ),
          ],
        ),
        SliverList.separated(
          itemCount: books.length,
          itemBuilder: (context, index) =>
              BookEntry(book: books.elementAt(index)),
          separatorBuilder: (context, _) => const SizedBox(height: 16),
        ),
      ],
    );
  }
}
