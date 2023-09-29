import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week7_lab/sample/1/auth_cubit.dart';
import 'package:week7_lab/sample/1/authorized_page.dart';
import 'package:week7_lab/sample/1/unauthorized_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return state is SignedInState
            ? const AuthorizedPage()
            : const UnauthorizedPage();
      },
    );
  }
}
