import 'package:bookstore_data/bookstore_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisItemCount;
          if (constraints.maxWidth < 400) {
            crossAxisItemCount = 1;
          } else if (constraints.maxWidth < 600) {
            crossAxisItemCount = 2;
          } else if (constraints.maxWidth < 900) {
            crossAxisItemCount = 3;
          } else {
            crossAxisItemCount = 4;
          }
          return CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Text('Bookstore'),
                pinned: true,
                expandedHeight: 50,
                backgroundColor: Colors.white,
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisItemCount,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return BookCard(
                      book: Bookstore.books[index],
                    );
                  },
                  childCount: Bookstore.books.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.book,
  });
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _getColorForGenre(book.genre.name),
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () => context.go('/book/${book.id}'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Flexible(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                    image: NetworkImage(book.coverUrl),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Text(
                  book.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Flexible(
                flex: 2,
                child: Text(
                  'by ${book.author.name}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColorForGenre(String genre) {
    switch (genre) {
      case 'Thriller':
        return Colors.blue.withOpacity(0.3); // Softer blue
      case "Children's":
        return Colors.green.withOpacity(0.3); // Softer green
      case 'Science Fiction':
        return Colors.purple.withOpacity(0.3); // Softer purple
      case 'Fantasy':
        return Colors.orange.withOpacity(0.3); // Softer orange
      case 'Mystery':
        return Colors.red.withOpacity(0.3); // Softer red
      case 'Romance':
        return Colors.pink.withOpacity(0.3); // Softer pink
      case 'Young Adult':
        return Colors.yellow.withOpacity(0.3); // Softer yellow
      default:
        return Colors.grey.withOpacity(0.3); // Default soft gray
    }
  }
}
