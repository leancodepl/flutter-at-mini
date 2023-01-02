import 'package:meta/meta.dart';

@sealed // cannot be extended in a different package
class Storage {
  @internal // can be accessed within this package
  final cache = <String, String>{};

  @visibleForTesting // can be accessed here and in tests
  void invalidateCache() {
    // remove old cache
  }

  @mustCallSuper // overriders must call this implementation
  void set(String key, String value) {
    cache[key] = value;
  }

  @nonVirtual // cannot be overriden
  String? get(String key) {
    return cache[key];
  }

  @protected // can be accessed by subclasses only
  void clear() {
    cache.clear();
  }
}

class NewStorage extends Storage {
  @override // not ok, [get] is non-virtual
  String? get(String key) {
    return 'evil';
  }

  @override // not ok, [set] must call [super.set]
  void set(String key, String value) {
    // ignore
  }

  void clearStorage() {
    // ok, we are in the same file
    invalidateCache();
    // ok, we are a subclass
    clear();
  }
}
