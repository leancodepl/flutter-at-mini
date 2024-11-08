import 'package:collection/collection.dart';

import 'src/data.dart' as data;
import 'src/entities.dart';

export 'src/entities.dart';

abstract final class Bookstore {
  Bookstore._();

  static final books = data.books;
  static final authors = data.authors;
  static final genres = data.genres;

  static Book? getBook({required String id}) {
    if (id.startsWith(':')) {
      throw ArgumentError(_paramColorError);
    }
    return books.firstWhereOrNull((book) => book.id == id);
  }

  static Author? getAuthor({required String id}) {
    if (id.startsWith(':')) {
      throw ArgumentError(_paramColorError);
    }
    return authors.firstWhereOrNull((author) => author.id == id);
  }

  static Genre? getGenre({required String id}) {
    if (id.startsWith(':')) {
      throw ArgumentError(_paramColorError);
    }
    return genres.firstWhereOrNull((genre) => genre.id == id);
  }
}

const _paramColorError =
    "`:` is not part of the ID – it's only used in go_router to mark a path parameter";
