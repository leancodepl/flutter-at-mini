import 'package:bookstore_data/bookstore_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:week3/main.dart';

class AuthorScreen extends StatelessWidget {
  const AuthorScreen({super.key, required this.authorId});

  final String authorId;
  @override
  Widget build(BuildContext context) {
    final author = Bookstore.getAuthor(id: authorId);
    if (author == null) {
      context.go('/');
      return Container();
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
            title: const Text('Author'),
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
                                  image: NetworkImage(author.pictureUrl),
                                ),
                              ),
                            ),
                            _buildAuthorDetails(
                              context,
                              author,
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
                                  image: NetworkImage(author.pictureUrl),
                                ),
                              ),
                            ),
                            Expanded(
                              child: _buildAuthorDetails(
                                context,
                                author,
                                constraints.maxWidth / 2,
                              ),
                            ),
                          ],
                        );
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return BookListCard(book: author.books.elementAt(index));
              },
              childCount: author.books.length,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildAuthorDetails(BuildContext context, Author author, double width) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          author.name,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.perm_identity, size: 20),
            const SizedBox(width: 8),
            Text(
              'Bio',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: width - 30,
          child: Text(
            author.bio,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    ),
  );
}
