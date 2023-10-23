import 'package:bookstore_data/bookstore_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:week3_lab_solution/link_text.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book store'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 48),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 210,
                height: 270,
                child: Image.network(
                  book.coverUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Title: ${book.title}'),
                    LinkText(
                      text: Text('Author: ${book.author.name}'),
                      onTap: () => context.push('/author/${book.author.id}'),
                    ),
                    LinkText(
                      text: Text('Genre: ${book.genre.name}'),
                      onTap: () => context.push('/genre/${book.genre.id}'),
                    ),
                    Text('Published: ${dateFormat.format(book.publishDate)}'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(book.description),
        ],
      ),
    );
  }
}
