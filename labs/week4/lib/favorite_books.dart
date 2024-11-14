import 'package:bookstore_data/bookstore_data.dart';
import 'package:flutter/foundation.dart';

class FavoriteBooks extends ValueNotifier<List<String>> {
  FavoriteBooks() : super([]);

  void addBook(Book book) => value = [...value, book.id];

  void removeBook(Book book) =>
      value = value.where((id) => id != book.id).toList();
}
