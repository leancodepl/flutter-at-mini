import 'package:bookstore_data/bookstore_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lab4_boilerplate/widgets/app_scaffold.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({
    super.key,
    required this.bookId,
  });

  final String bookId;

  @override
  Widget build(BuildContext context) {
    final book = Bookstore.books.firstWhere((book) => book.id == bookId);

    final dateFormat = DateFormat.yMd();

    return AppScaffold(
      title: 'Book store',
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 48),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  width: 210,
                  height: 270,
                  child: Image.network(
                    book.coverUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.title),
                      title: Text('Title: ${book.title}'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: Text('Author: ${book.author.name}'),
                      trailing: const Icon(Icons.open_in_new),
                      onTap: () => context.push('/author/${book.author.id}'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.category),
                      title: Text('Genre: ${book.genre.name}'),
                      trailing: const Icon(Icons.open_in_new),
                      onTap: () => context.push('/genre/${book.genre.id}'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.calendar_month),
                      title: Text(
                        'Published: ${dateFormat.format(book.publishDate)}',
                      ),
                    ),
                    // HINT: the "favorite" button tile fits here nicely
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // HINT: replace this with your own collapsible widget
          Text(book.description),
        ],
      ),
    );
  }
}

class _CollapsibleDescription extends StatefulWidget {
  const _CollapsibleDescription({
    required this.text,
  });

  final String text;

  @override
  State<_CollapsibleDescription> createState() =>
      __CollapsibleDescriptionState();
}

class __CollapsibleDescriptionState extends State<_CollapsibleDescription> {
  var _expanded = true;

  void _toggle() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (_expanded) Text(widget.text),
        const SizedBox(height: 8),
        Align(
          alignment: AlignmentDirectional.topStart,
          child: TextButton(
            onPressed: _toggle,
            child: Text(_expanded ? 'Hide description' : 'Show description'),
          ),
        ),
      ],
    );
  }
}
