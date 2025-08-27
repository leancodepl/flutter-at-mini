import 'package:bookstore_data/bookstore_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Cover extends StatelessWidget {
  const Cover(this.coverUrl, {super.key});

  final String coverUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      coverUrl,
      fit: BoxFit.cover,
      width: 200,
      height: 300,
      frameBuilder: (context, child, _, __) {
        return ClipRRect(borderRadius: BorderRadius.circular(16), child: child);
      },
    );
  }
}

class PageTitle extends StatelessWidget {
  const PageTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(title, style: theme.textTheme.displayLarge);
  }
}

class _ListEntry extends StatelessWidget {
  const _ListEntry({
    required this.onTap,
    required this.icon,
    required this.label,
    this.subtitle,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String label;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card.filled(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsetsDirectional.zero,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icon, color: theme.colorScheme.onSurface),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: theme.textTheme.labelLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (subtitle case final subtitle?) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: theme.textTheme.labelMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: theme.colorScheme.onSurface,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookEntry extends StatelessWidget {
  const BookEntry({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return _ListEntry(
      onTap: () => context.push('/book/${book.id}'),
      icon: Icons.book_rounded,
      label: book.title,
      subtitle: 'by ${book.author.name}',
    );
  }
}

class AuthorEntry extends StatelessWidget {
  const AuthorEntry({super.key, required this.author});

  final Author author;

  @override
  Widget build(BuildContext context) {
    return _ListEntry(
      onTap: () => context.push('/author/${author.id}'),
      icon: Icons.person_rounded,
      label: author.name,
    );
  }
}
