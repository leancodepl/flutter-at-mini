import 'package:bookstore_data/bookstore_data.dart';
import 'package:flutter/material.dart';
import 'package:week4/common_widgets.dart';

class AuthorScreen extends StatelessWidget {
  const AuthorScreen({super.key, required this.authorId});

  final String authorId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: switch (Bookstore.getAuthor(id: authorId)) {
        final author? => LayoutBuilder(
          builder: (context, constraints) => switch (constraints.maxWidth) {
            < 600 => _AuthorDetailsNarrow(author),
            _ => _AuthorDetailsWide(author),
          },
        ),
        null => Center(child: Text('Author with id $authorId not found')),
      },
    );
  }
}

class _AuthorDetailsNarrow extends StatelessWidget {
  const _AuthorDetailsNarrow(this.author);

  final Author author;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverMainAxisGroup(
            slivers: [
              SliverList.list(
                children: [
                  Center(child: Cover(author.pictureUrl)),
                  const SizedBox(height: 32),
                  PageTitle(author.name),
                  const SizedBox(height: 32),
                  _Bio(author.bio),
                  const SizedBox(height: 32),
                ],
              ),
              _SliverBooksByAuthor(author),
            ],
          ),
        ),
      ],
    );
  }
}

class _AuthorDetailsWide extends StatelessWidget {
  const _AuthorDetailsWide(this.author);

  final Author author;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Cover(author.pictureUrl),
        ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsetsDirectional.only(
                  top: 16,
                  bottom: 16,
                  end: 16,
                ),
                sliver: SliverMainAxisGroup(
                  slivers: [
                    SliverList.list(
                      children: [
                        PageTitle(author.name),
                        const SizedBox(height: 32),
                        _Bio(author.bio),
                        const SizedBox(height: 32),
                      ],
                    ),
                    _SliverBooksByAuthor(author),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Bio extends StatelessWidget {
  const _Bio(this.bio);

  final String bio;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.person_rounded, color: theme.colorScheme.onSurface),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Bio',
                style: theme.textTheme.titleLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 32),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Text(
              bio,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }
}

class _SliverBooksByAuthor extends StatelessWidget {
  const _SliverBooksByAuthor(this.author);

  final Author author;

  @override
  Widget build(BuildContext context) {
    final books = author.books;

    return SliverList.separated(
      itemCount: books.length,
      itemBuilder: (context, index) => BookEntry(book: books.elementAt(index)),
      separatorBuilder: (context, _) => const SizedBox(height: 16),
    );
  }
}
