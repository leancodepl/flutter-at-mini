import 'dart:collection';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:lecture_week3/demo_info.dart';

/// Demo: Listenable in practice (slides 79–86).
///
/// Run: `fvm flutter run -d macos -t lib/demo_11_listenables.dart` and keep the
/// console visible.
///
/// 1. ValueNotifier: tap "+1" → only the ValueListenableBuilder prints
///    "builder", the page itself does not rebuild. Tap "set the same value"
///    → nothing happens: ValueNotifier notifies only when the value changes.
/// 2. ChangeNotifier (Cart): add products → the badge and the total rebuild
///    (ListenableBuilder), the product list does not.
/// 3. ScrollController: scroll and watch the positions in the console
///    (manual addListener / removeListener in State).
/// 4. AnimationController: an Animation is a Listenable too – AnimatedBuilder
///    rebuilds only the rotating part every frame.
void main() {
  runApp(const MaterialApp(home: ListenablesMenu()));
}

class const ListenablesMenu({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void open(Widget page) {
      Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => page));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Listenables'),
        actions: const [
          DemoInfo(
            title: 'Listenables',
            steps: [
              'ValueNotifier: "+1" → only the ValueListenableBuilder prints "builder", the page doesn\'t rebuild. "set the same value" → nothing happens.',
              "Cart: add products → only the badge and the total rebuild (ListenableBuilder), the product list doesn't. The cart icon is the child – built once.",
              'ScrollController: scroll and watch positions in the console (manual addListener / removeListener in State).',
              'AnimationController: an Animation is a Listenable too – AnimatedBuilder rebuilds only the rotating part.',
            ],
            watch: 'the console',
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('ValueNotifier + ValueListenableBuilder'),
            onTap: () => open(const ValueNotifierExample()),
          ),
          ListTile(
            title: const Text('ChangeNotifier (Cart) + ListenableBuilder'),
            onTap: () => open(const CartExample()),
          ),
          ListTile(
            title: const Text('ScrollController (console)'),
            onTap: () => open(const ScrollExample()),
          ),
          ListTile(
            title: const Text('AnimationController + AnimatedBuilder'),
            onTap: () => open(const AnimationExample()),
          ),
        ],
      ),
    );
  }
}

class const ValueNotifierExample({super.key}) extends StatefulWidget {
  @override
  State<ValueNotifierExample> createState() => _ValueNotifierExampleState();
}

class _ValueNotifierExampleState() extends State<ValueNotifierExample> {
  final _counter = ValueNotifier(0);

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build: ValueNotifierExample page');
    return Scaffold(
      appBar: AppBar(title: const Text('ValueNotifier')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 24,
          children: [
            ValueListenableBuilder<int>(
              valueListenable: _counter,
              builder: (context, value, child) {
                debugPrint('builder: $value');
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.displayMedium,
                );
              },
            ),
            ElevatedButton(
              onPressed: () => _counter.value++,
              child: const Text('+1'),
            ),
            OutlinedButton(
              // same value → no notification, no rebuild
              onPressed: () => _counter.value = _counter.value,
              child: const Text('set the same value'),
            ),
          ],
        ),
      ),
    );
  }
}

class Product({required final String name, required final int price});

class Cart() extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => UnmodifiableListView(_items);
  int get totalPrice => _items.fold(0, (sum, p) => sum + p.price);

  void add(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

class const CartExample({super.key}) extends StatefulWidget {
  @override
  State<CartExample> createState() => _CartExampleState();
}

class _CartExampleState() extends State<CartExample> {
  final _cart = Cart();

  static final _products = [
    Product(name: 'Coffee', price: 12),
    Product(name: 'Croissant', price: 8),
    Product(name: 'Orange juice', price: 10),
  ];

  @override
  void dispose() {
    _cart.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build: CartExample page');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          ListenableBuilder(
            listenable: _cart,
            builder: (context, child) {
              debugPrint('builder: badge');
              return Badge(label: Text('${_cart.items.length}'), child: child);
            },
            child: const Icon(Icons.shopping_cart), // built once
          ),
          IconButton(
            onPressed: _cart.clear,
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
      body: Column(
        children: [
          for (final product in _products)
            ListTile(
              title: Text(product.name),
              subtitle: Text('${product.price} zł'),
              trailing: IconButton(
                onPressed: () => _cart.add(product),
                icon: const Icon(Icons.add_shopping_cart),
              ),
            ),
          const Divider(),
          ListenableBuilder(
            listenable: _cart,
            builder: (context, child) {
              debugPrint('builder: total');
              return Text(
                'Total: ${_cart.totalPrice} zł',
                style: Theme.of(context).textTheme.headlineSmall,
              );
            },
          ),
        ],
      ),
    );
  }
}

class const ScrollExample({super.key}) extends StatefulWidget {
  @override
  State<ScrollExample> createState() => _ScrollExampleState();
}

class _ScrollExampleState() extends State<ScrollExample> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_printScrollPosition);
  }

  void _printScrollPosition() {
    debugPrint('Scroll position: ${scrollController.position.pixels}');
  }

  @override
  void dispose() {
    scrollController.removeListener(_printScrollPosition);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ScrollController')),
      body: ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
        itemCount: 100,
      ),
    );
  }
}

class const AnimationExample({super.key}) extends StatefulWidget {
  @override
  State<AnimationExample> createState() => _AnimationExampleState();
}

class _AnimationExampleState()
    extends State<AnimationExample>
    with TickerProviderStateMixin {
  late final animationController = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  );

  late final rotation = Tween<double>(
    begin: 0,
    end: 2 * math.pi,
  ).animate(animationController);

  @override
  void initState() {
    super.initState();

    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimationController')),
      body: Center(
        child: AnimatedBuilder(
          animation: rotation,
          builder: (context, child) =>
              Transform.rotate(angle: rotation.value, child: child),
          child: const Text('Hello, world!'),
        ),
      ),
    );
  }
}
