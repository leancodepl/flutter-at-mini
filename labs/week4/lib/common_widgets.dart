import 'package:bookstore_data/bookstore_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class const Cover(final String coverUrl, {super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      coverUrl,
      fit: BoxFit.cover,
      width: 200,
      height: 300,
      frameBuilder: (context, child, _, _) {
        return ClipRRect(borderRadius: BorderRadius.circular(16), child: child);
      },
    );
  }
}

class const PageTitle(final String title, {super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(title, style: theme.textTheme.displayLarge);
  }
}

class const _ListEntry({
  required final VoidCallback onTap,
  required final IconData icon,
  required final String label,
  final String? subtitle,
}) extends StatelessWidget {
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

class const BookEntry({super.key, required final Book book})
    extends StatelessWidget {
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

class const AuthorEntry({super.key, required final Author author})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _ListEntry(
      onTap: () => context.push('/author/${author.id}'),
      icon: Icons.person_rounded,
      label: author.name,
    );
  }
}
