import 'package:bookstore_data/bookstore_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:week4/app_theme.dart';
import 'package:week4/common_widgets.dart';
import 'package:week4/favorite_books.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key, required this.bookId});

  final String bookId;

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  var _descriptionExpanded = true;

  @override
  Widget build(BuildContext context) {
    final book = Bookstore.getBook(id: widget.bookId);

    return Scaffold(
      appBar: AppBar(
        actions: [
          if (book != null) BookFavoriteButton(book: book),
          const AppThemeSwitcher(),
        ],
      ),
      body: switch (book) {
        final book? => LayoutBuilder(
          builder: (context, constraints) => switch (constraints.maxWidth) {
            < 600 => _BookDetailsNarrow(
              book,
              descriptionExpanded: _descriptionExpanded,
              onToggleDescriptionExpanded: () {
                setState(() => _descriptionExpanded = !_descriptionExpanded);
              },
            ),
            _ => _BookDetailsWide(
              book,
              descriptionExpanded: _descriptionExpanded,
              onToggleDescriptionExpanded: () {
                setState(() => _descriptionExpanded = !_descriptionExpanded);
              },
            ),
          },
        ),
        null => Center(child: Text('Book with id ${widget.bookId} not found')),
      },
    );
  }
}

class _BookDetailsNarrow extends StatelessWidget {
  const _BookDetailsNarrow(
    this.book, {
    required this.descriptionExpanded,
    required this.onToggleDescriptionExpanded,
  });

  final Book book;
  final bool descriptionExpanded;
  final VoidCallback onToggleDescriptionExpanded;

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
        const SizedBox(height: 26),
        _Description(
          book,
          expanded: descriptionExpanded,
          onToggleExpanded: onToggleDescriptionExpanded,
        ),
      ],
    );
  }
}

class _BookDetailsWide extends StatelessWidget {
  const _BookDetailsWide(
    this.book, {
    required this.descriptionExpanded,
    required this.onToggleDescriptionExpanded,
  });

  final Book book;
  final bool descriptionExpanded;
  final VoidCallback onToggleDescriptionExpanded;

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
              const SizedBox(height: 26),
              _Description(
                book,
                expanded: descriptionExpanded,
                onToggleExpanded: onToggleDescriptionExpanded,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Author extends StatelessWidget {
  const _Author(this.author);

  final Author author;

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

class _Genre extends StatelessWidget {
  const _Genre(this.genre);

  final Genre genre;

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

class _Published extends StatelessWidget {
  const _Published(this.publishDate);

  final DateTime publishDate;

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

class _Description extends StatelessWidget {
  _Description(
    this.book, {
    required this.expanded,
    required this.onToggleExpanded,
  }) : super(key: PageStorageKey(book.id));

  final Book book;
  final bool expanded;
  final VoidCallback onToggleExpanded;

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
            Flexible(
              child: Text(
                'Description',
                style: theme.textTheme.titleLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              icon: AnimatedRotation(
                turns: expanded ? -0.25 : 0.25,
                duration: Durations.long1,
                curve: Curves.easeInOutCubicEmphasized,
                child: const Icon(Icons.chevron_right_rounded),
              ),
              onPressed: onToggleExpanded,
            ),
          ],
        ),
        if (expanded) ...[
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Text(
                book.description,
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class BookFavoriteButton extends StatelessWidget {
  const BookFavoriteButton({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final favoriteBooks = context.watch<FavoriteBooks>();
    final isFavorite = favoriteBooks.value.contains(book.id);

    return IconButton(
      onPressed: isFavorite
          ? () => favoriteBooks.removeBook(book)
          : () => favoriteBooks.addBook(book),
      icon: Icon(
        isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
        color: isFavorite ? theme.colorScheme.primary : null,
      ),
    );
  }
}
