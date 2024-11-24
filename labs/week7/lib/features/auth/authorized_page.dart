import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week7/features/auth/auth_cubit.dart';
import 'package:week7/features/auth/auth_service.dart';

class AuthorizedPage extends StatelessWidget {
  const AuthorizedPage({
    super.key,
    required this.state,
  });

  final SignedInState state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
