import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:week7_lab/data/auth_service.dart';
import 'package:week7_lab/sample/2/auth_cubit.dart';
import 'package:week7_lab/sample/2/auth_gate.dart';

class WaterLogApp2 extends StatelessWidget {
  const WaterLogApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AuthService(
        firebaseAuth: FirebaseAuth.instance,
      ),
      child: BlocProvider(
        create: (ctx) => AuthCubit(
          authService: ctx.read(),
        ),
        child: MaterialApp(
          title: 'WaterLog',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: const Text('WaterLog'),
            ),
            body: const AuthGate(),
          ),
        ),
      ),
    );
  }
}
