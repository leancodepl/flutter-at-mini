import 'package:flutter/material.dart';

class const LoadingIndicator({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox.square(
        dimension: 128,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
