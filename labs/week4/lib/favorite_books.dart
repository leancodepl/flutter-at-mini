import 'package:bookstore_data/bookstore_data.dart';
import 'package:flutter/foundation.dart';

class FavoriteBooks extends ValueNotifier<Set<String>> {
  FavoriteBooks() : super({});

  void addBook(Book book) => value = value.union({book.id});

  void removeBook(Book book) => value = value.difference({book.id});
}
