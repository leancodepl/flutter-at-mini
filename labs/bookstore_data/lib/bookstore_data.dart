import 'package:bookstore_data/authors.dart' as a;
import 'package:bookstore_data/books.dart' as b;
import 'package:bookstore_data/genres.dart' as g;

export 'entities.dart';

abstract class Bookstore {
  static final books = b.books;
  static final authors = a.authors;
  static final genres = g.genres;
}
