import 'package:bookstore_data/bookstore_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:labs_week3/common_widgets.dart';

class const BookScreen({super.key, required final String bookId})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: switch (Bookstore.getBook(id: bookId)) {
        final book? => LayoutBuilder(
          builder: (context, constraints) => switch (constraints.maxWidth) {
            < 600 => _BookDetailsNarrow(book),
            _ => _BookDetailsWide(book),
          },
        ),
        null => Center(child: Text('Book with id $bookId not found')),
      },
    );
  }
}

class const _BookDetailsNarrow(final Book book) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(child: Cover(book.coverUrl)),
        const SizedBox(height: 32),
        PageTitle(book.title),
        const SizedBox(height: 26),
        _Author(book.author),
        const SizedBox(height: 20),
        _Genre(book.genre),
        const SizedBox(height: 26),
        _Published(book.publishDate),
        const SizedBox(height: 32),
        _Description(book.description),
      ],
    );
  }
}

class const _BookDetailsWide(final Book book) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(width: 200, child: Cover(book.coverUrl)),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsetsDirectional.only(
              top: 16,
              bottom: 16,
              end: 16,
            ),
            children: [
              PageTitle(book.title),
              const SizedBox(height: 26),
              _Author(book.author),
              const SizedBox(height: 20),
              _Genre(book.genre),
              const SizedBox(height: 26),
              _Published(book.publishDate),
              const SizedBox(height: 32),
              _Description(book.description),
            ],
          ),
        ),
      ],
    );
  }
}

class const _Author(final Author author) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(Icons.person_rounded, color: theme.colorScheme.onSurface),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            'By ${author.name}',
            style: theme.textTheme.titleLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          onPressed: () => context.push('/author/${author.id}'),
          icon: const Icon(Icons.open_in_new_rounded),
        ),
      ],
    );
  }
}

class const _Genre(final Genre genre) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(Icons.category_rounded, color: theme.colorScheme.onSurface),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            'Genre: ${genre.name}',
            style: theme.textTheme.titleLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          onPressed: () => context.push('/genre/${genre.id}'),
          icon: const Icon(Icons.open_in_new_rounded),
        ),
      ],
    );
  }
}

class const _Published(final DateTime publishDate) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(Icons.date_range_rounded, color: theme.colorScheme.onSurface),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            'Published: ${DateFormat.yMd().format(publishDate)}',
            style: theme.textTheme.titleLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class const _Description(final String description) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.description_rounded, color: theme.colorScheme.onSurface),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Description',
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
              description,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }
}
