import 'package:flutter/material.dart';

class PageViewExample extends StatefulWidget {
  const PageViewExample({Key? key}) : super(key: key);

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  child: Text('Page 1'),
                ),
                Tab(
                  child: Text('Page 2'),
                ),
                Tab(
                  child: Text('Page 3'),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Page 1'),
                        ElevatedButton(
                          onPressed: () {
                            controller.animateToPage(
                              1,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeOut,
                            );
                          },
                          child: Text('Next page'),
                        ),
                      ],
                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}
