import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week7/features/auth/auth_cubit.dart';
import 'package:week7/features/auth/auth_service.dart';
import 'package:week7/features/user_items/user_items.dart';

class AuthorizedPage extends StatelessWidget {
  const AuthorizedPage({super.key, required this.state});

  final SignedInState state;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        PinnedHeaderSliver(child: _AccountInfoBox(state: state)),
        const SliverUserItems(),
      ],
    );
  }
}

class _AccountInfoBox extends StatelessWidget {
  const _AccountInfoBox({required this.state});

  final SignedInState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: theme.colorScheme.surface,
      child: Card.outlined(
        color: theme.colorScheme.surfaceContainerLowest,
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text('Signed in as: ${state.email}'),
              const SizedBox(height: 16),
              FilledButton.tonal(
                onPressed: context.read<AuthCubit>().signOut,
                child: const Text('Sign out with cubit'),
              ),
              const SizedBox(height: 16),
              FilledButton.tonal(
                onPressed: context.read<AuthService>().signOut,
                child: const Text('Sign out with auth'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
