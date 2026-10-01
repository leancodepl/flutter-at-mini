import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labs_week7/features/auth/auth_cubit.dart';
import 'package:labs_week7/features/auth/auth_gate.dart';
import 'package:labs_week7/features/auth/auth_service.dart';
import 'package:labs_week7/features/user_items/user_items_service.dart';
import 'package:provider/provider.dart';

class const Week7App({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => AuthService(firebaseAuth: FirebaseAuth.instance),
        ),
        BlocProvider(
          create: (context) => AuthCubit(authService: context.read()),
        ),
        Provider(
          create: (context) => UserItemsService(
            db: FirebaseFirestore.instance,
            auth: context.read(),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Week 7')),
        body: const AuthGate(),
      ),
    );
  }
}
