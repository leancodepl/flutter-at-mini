import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class InteractiveViewerExample extends StatelessWidget {
  const InteractiveViewerExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: InteractiveViewer(
        child: Padding(
          padding: const EdgeInsets.all(120),
          child: CachedNetworkImage(
            imageUrl: 'https://picsum.photos/400/300',
          ),
        ),
      ),
    ));
  }
}
