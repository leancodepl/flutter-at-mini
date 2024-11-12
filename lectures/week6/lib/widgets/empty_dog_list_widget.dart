import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6/bloc/dog_list_bloc.dart';
import 'package:week6/bloc/dog_list_event.dart';

class EmptyDogListWidget extends StatelessWidget {
  const EmptyDogListWidget({super.key, required this.onFetch});

  final VoidCallback onFetch;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/undraw_dog.png'),
            Text('There are no dogs yet :('),
            OutlinedButton(
              child: Text('More dogs!'),
              onPressed: onFetch,
            )
          ],
        ),
      ),
    );
  }
}
