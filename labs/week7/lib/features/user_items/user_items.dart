import 'package:flutter/material.dart';

class SliverUserItems extends StatelessWidget {
  const SliverUserItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 100,
      itemBuilder: (context, i) => ListTile(
        title: Text(i.toString()),
      ),
    );
  }
}
