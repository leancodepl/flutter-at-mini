import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:week7/features/auth/auth_cubit.dart';
import 'package:week7/features/auth/auth_gate.dart';
import 'package:week7/features/auth/auth_service.dart';

class Week7App extends StatelessWidget {
  const Week7App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => AuthService(
            firebaseAuth: FirebaseAuth.instance,
          ),
        ),
        BlocProvider(
          create: (context) => AuthCubit(
            authService: context.read(),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Week 7'),
        ),
        body: const AuthGate(),
      ),
    );
  }
}
