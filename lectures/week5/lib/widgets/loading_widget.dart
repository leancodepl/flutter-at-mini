import 'package:flutter/material.dart';

class const LoadingWidget({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
