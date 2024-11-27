import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week7/features/auth/auth_cubit.dart';

class UnauthorizedPage extends StatefulWidget {
  const UnauthorizedPage({super.key});

  @override
  State<UnauthorizedPage> createState() => _UnauthorizedPageState();
}

class _UnauthorizedPageState extends State<UnauthorizedPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authCubit = context.watch<AuthCubit>();
    final state = authCubit.state;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              hintText: 'Email address',
            ),
            controller: email,
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              hintText: 'Password',
            ),
            controller: password,
            obscureText: true,
          ),
          const SizedBox(height: 16),
          if (state case SignedOutState(:final error?)) ...[
            Text(error),
            const SizedBox(height: 16),
          ] else
            const SizedBox(height: 32),
          _SignInButton(
            enabled: state is SignedOutState,
            onSignIn: () => authCubit.signInWithEmail(
              email.text,
              password.text,
            ),
          ),
        ],
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton({
    required this.enabled,
    required this.onSignIn,
  });

  final bool enabled;
  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: enabled ? onSignIn : null,
      child: enabled
          ? const Text('Sign in')
          : const SizedBox.square(
              dimension: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
    );
  }
}
