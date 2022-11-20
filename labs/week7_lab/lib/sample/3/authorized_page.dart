import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week7_lab/data/auth_service.dart';
import 'package:week7_lab/sample/3/auth_cubit.dart';

class AuthorizedPage extends StatelessWidget {
  const AuthorizedPage({
    Key? key,
    required this.state,
  }) : super(key: key);

  final SignedInState state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Signed in as: ${state.email}'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: context.read<AuthCubit>().signOut,
            child: const Text('Sign out with cubit'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: context.read<AuthService>().signOut,
            child: const Text('Sign out with auth'),
          ),
        ],
      ),
    );
  }
}
