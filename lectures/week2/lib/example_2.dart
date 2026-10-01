import 'package:flutter/material.dart';
import 'package:lecture_week2/util/build_aware_widget.dart';

class const Example2({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ListView vs CustomScrollView'),
          leading: const SizedBox.shrink(),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'ListView'),
              Tab(text: 'Slivers'),
            ],
          ),
        ),
        body: const TabBarView(children: [ListViewScreen(), SliversScreen()]),
      ),
    );
  }
}

class const ListViewScreen({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const _FakeParallaxHeader(),
        const SizedBox(height: 8),
        ...List.generate(
          30,
          (i) => BuildAwareWidget(
            index: i,
            parent: 'ListView',
            child: ListTile(title: Text('List item $i')),
          ),
        ),

        const _SectionTitle('Recommended'),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 60,
          itemBuilder: (c, i) => BuildAwareWidget(
            index: i,
            parent: 'GridView',
            child: Card(child: Center(child: Text('LV grid $i'))),
          ),
        ),

        const SizedBox(height: 200),
      ],
    );
  }
}

class const SliversScreen({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          expandedHeight: 200,
          pinned: true,
          leading: SizedBox.shrink(),
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Collapsible header'),
            background: _HeaderBg(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (c, i) => BuildAwareWidget(
              index: i,
              parent: 'SliverList',
              child: ListTile(title: Text('List item $i')),
            ),
            childCount: 30,
          ),
        ),
        const SliverPersistentHeader(
          pinned: true,
          delegate: _PinnedHeaderDelegate(child: _SectionTitle('Recommended')),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          delegate: SliverChildBuilderDelegate(
            (c, i) => BuildAwareWidget(
              index: i,
              parent: 'SliverGrid',
              child: Card(child: Center(child: Text('SL grid $i'))),
            ),
            childCount: 60,
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 200)),
      ],
    );
  }
}

class const _FakeParallaxHeader() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _HeaderBg(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Static header (no collapse)',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class const _HeaderBg() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.indigo, Colors.blue]),
      ),
    );
  }
}

class const _SectionTitle(final String text) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

class const _PinnedHeaderDelegate({required final Widget child})
    extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 44;

  @override
  double get maxExtent => 44;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) => child;

  @override
  bool shouldRebuild(covariant _PinnedHeaderDelegate oldDelegate) => false;
}
