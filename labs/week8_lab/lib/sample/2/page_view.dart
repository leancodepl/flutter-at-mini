import 'package:flutter/material.dart';

class PageViewExample extends StatelessWidget {
  const PageViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          const Center(
            child: Text('Page 1'),
          ),
          ListView.builder(
            itemBuilder: (_, i) => ListTile(
              title: Text('Item $i'),
            ),
          ),
          const Center(
            child: Text('Page 3'),
          ),
        ],
      ),
    );
  }
}
