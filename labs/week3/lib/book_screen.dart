import 'package:bookstore_data/bookstore_data.dart';
import 'package:bookstore_data/bookstore_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context) {
    final book = Bookstore.getBook(id: bookId);
    if (book == null) {
      throw Exception('book is null');
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
            title: const Text('Book'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () => context.go('/'),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isSmallScreen = constraints.maxWidth < 600;

                  return isSmallScreen
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  image: NetworkImage(book.coverUrl),
                                ),
                              ),
                            ),
                            _buildBookDetails(
                              context,
                              book,
                              constraints.maxWidth,
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  image: NetworkImage(book.coverUrl),
                                ),
                              ),
                            ),
                            Expanded(
                              child: _buildBookDetails(
                                context,
                                book,
                                constraints.maxWidth / 2,
                              ),
                            ),
                          ],
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookDetails(BuildContext context, Book book, double width) {
    final formattedDate = DateFormat.yMMMd().format(book.publishDate);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            book.title,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.perm_identity, size: 20),
              const SizedBox(width: 8),
              Text(
                book.author.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () => context.push('/author/${book.author.id}'),
                child: const Icon(Icons.open_in_new, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.category, size: 20),
              const SizedBox(width: 8),
              Text(
                book.genre.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () => context.push('/genre/${book.genre.id}'),
                child: const Icon(
                  Icons.open_in_new,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.date_range, size: 20),
              const SizedBox(width: 8),
              Text(
                formattedDate,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.description),
              const SizedBox(width: 8),
              Text(
                'Description',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: width - 30,
            child: Text(
              book.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
