import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FadeInImageExample extends StatelessWidget {
  const FadeInImageExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (_, i) => CachedNetworkImage(
          imageUrl: 'https://picsum.photos/300/200?$i',
          placeholder: (_, __) => Center(
            child: Container(
              width: 300,
              height: 200,
              color: Colors.grey.shade200,
            ),
          ),
        ),
      ),
    );
  }
}
