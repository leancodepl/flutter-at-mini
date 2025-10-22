import 'package:flutter/material.dart';
import 'package:week3/util/build_aware_widget.dart';

class Example1 extends StatelessWidget {
  const Example1({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox.shrink(),
          title: const Text('SingleChildScrollView vs ListView'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'SingleChildScrollView'),
              Tab(text: 'ListView'),
              Tab(text: 'ListView.builder'),
            ],
          ),
          actions: const [
            IconButton(
              onPressed: BuildAwareWidget.resetCounters,
              icon: Icon(Icons.refresh),
              tooltip: 'Reset counters',
            ),
          ],
        ),
        body: const SizedBox(
          height: 500,
          child: Column(
            children: [
              _CountersBar(),
              Expanded(
                child: TabBarView(
                  children: [
                    _SingleChildScrollViewScreen(),
                    _ListViewScreen(),
                    _ListViewBuilder(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SingleChildScrollViewScreen extends StatelessWidget {
  const _SingleChildScrollViewScreen();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
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
        ),
      ],
    );
  }
}

class _CountersBar extends StatelessWidget {
  const _CountersBar();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Counts>(
      valueListenable: BuildAwareWidget.counts,
      builder: (context, c, _) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            'Constructed: ${c.constructed} | Mounted(initState): ${c.mounted} | Disposed: ${c.disposed}',
            style: const TextStyle(
              fontFeatures: [FontFeature.tabularFigures()],
            ),
          ),
        );
      },
    );
  }
}

class _ListViewScreen extends StatelessWidget {
  const _ListViewScreen();

  @override
  Widget build(BuildContext context) {
    BuildAwareWidget.resetCounters(label: 'children');

    return ListView(
      // itemCount: 1000,
      children: [
        ...List.generate(
          1000,
          (i) => BuildAwareWidget(
            index: i,
            parent: 'ListView',
            child: Container(
              height: 80,
              color: Colors.primaries[i % Colors.primaries.length],
            ),
          ),
        ),
      ],
    );
  }
}

class _ListViewBuilder extends StatelessWidget {
  const _ListViewBuilder();

  @override
  Widget build(BuildContext context) {
    BuildAwareWidget.resetCounters(label: 'builder');

    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (context, i) => BuildAwareWidget(
        index: i,
        parent: 'ListView.builder',
        child: Container(
          height: 80,
          color: Colors.primaries[i % Colors.primaries.length],
        ),
      ),
    );
  }
}
