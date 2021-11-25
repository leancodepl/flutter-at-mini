import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week7_lab/data/auth_service.dart';
import 'package:week7_lab/sample/2/auth_cubit.dart';

class AuthorizedPage extends StatelessWidget {
  const AuthorizedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: context.read<AuthCubit>().signOut,
            child: const Text('Sign out with cubit'),
          ),
          ElevatedButton(
            onPressed: context.read<AuthService>().signOut,
            child: const Text('Sign out with auth'),
          ),
        ],
      ),
    );
  }
}
