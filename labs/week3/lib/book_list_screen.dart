import 'package:bookstore_data/bookstore_data.dart';
import 'package:flutter/material.dart';
import 'package:week3/common_widgets.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final books = Bookstore.books;

    return Scaffold(
      appBar: AppBar(title: const Text('Bookstore')),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsetsDirectional.all(16),
            sliver: SliverList.separated(
              itemCount: books.length,
              itemBuilder: (context, index) =>
                  BookEntry(book: books.elementAt(index)),
              separatorBuilder: (context, _) => const SizedBox(height: 16),
            ),
          ),
        ],
      ),
    );
  }
}
