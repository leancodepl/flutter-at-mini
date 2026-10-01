import 'package:bookstore_data/bookstore_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:labs_week4/app_theme.dart';
import 'package:labs_week4/common_widgets.dart';
import 'package:labs_week4/favorite_books.dart';
import 'package:provider/provider.dart';

class const BookScreen({super.key, required final String bookId})
    extends StatefulWidget {
  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState() extends State<BookScreen> {
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

class const _BookDetailsNarrow(
  final Book book, {
  required final bool descriptionExpanded,
  required final VoidCallback onToggleDescriptionExpanded,
}) extends StatelessWidget {
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

class const _BookDetailsWide(
  final Book book, {
  required final bool descriptionExpanded,
  required final VoidCallback onToggleDescriptionExpanded,
}) extends StatelessWidget {
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

// Bug in the lint: https://github.com/dart-lang/sdk/issues/64037
// ignore: prefer_const_constructors_in_immutables
class _Description(
  final Book book, {
  required final bool expanded,
  required final VoidCallback onToggleExpanded,
}) extends StatelessWidget {
  this : super(key: PageStorageKey(book.id));

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

class const BookFavoriteButton({super.key, required final Book book})
    extends StatelessWidget {
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
