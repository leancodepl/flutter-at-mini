import 'package:flutter/material.dart';
import 'package:labs_week7/features/auth/auth_cubit.dart';
import 'package:labs_week7/features/auth/auth_service.dart';
import 'package:labs_week7/features/user_items/user_items.dart';
import 'package:provider/provider.dart';

class const AuthorizedPage({super.key, required final SignedInState state})
    extends StatelessWidget {
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

class const _AccountInfoBox({required final SignedInState state})
    extends StatelessWidget {
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
