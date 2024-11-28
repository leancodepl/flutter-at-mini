import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:week7/features/auth/auth_cubit.dart';
import 'package:week7/features/auth/auth_gate.dart';
import 'package:week7/features/auth/auth_service.dart';
import 'package:week7/features/user_items/user_items_service.dart';

class Week7App extends StatelessWidget {
  const Week7App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => AuthService(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(
            authService: context.read(),
          ),
        ),
        Provider(
          create: (context) => UserItemsService(
            db: FirebaseFirestore.instance,
            auth: context.read(),
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
