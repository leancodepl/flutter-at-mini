import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Sample2Widget extends StatelessWidget {
  const Sample2Widget({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final SampleCubit cubit;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sample2'),
        ),
        body: BlocBuilder<SampleCubit, String?>(
          bloc: cubit,
          builder: (context, message) {
            return Center(
              child: message != null
                  ? Text(message)
                  : const CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class SampleCubit extends Cubit<String?> {
  SampleCubit() : super(null);

  void changeMessage(String message) => emit(message);
}
