import 'package:flutter/material.dart';
import 'package:week3/util/build_aware_widget.dart';

class Example3 extends StatelessWidget {
  const Example3({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox.shrink(),
          title: const Text('SingleChildScrollView vs ListView'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'SingleChildScrollView'),
              Tab(text: 'ListView'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [_SingleChildScrollViewScreen(), _ListViewScreen()],
        ),
      ),
    );
  }
}

class _SingleChildScrollViewScreen extends StatelessWidget {
  const _SingleChildScrollViewScreen();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var i = 0; i < 1000; i++)
            BuildAwareWidget(
              index: i,
              parent: 'SingleChildScrollView',
              child: Container(
                height: 80,
                color: Colors.primaries[i % Colors.primaries.length],
              ),
            ),
        ],
      ),
    );
  }
}

class _ListViewScreen extends StatelessWidget {
  const _ListViewScreen();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var i = 0; i < 1000; i++)
          BuildAwareWidget(
            index: i,
            parent: 'ListView',
            child: Container(
              height: 80,
              color: Colors.primaries[i % Colors.primaries.length],
            ),
          ),
      ],
    );
  }
}
