import 'package:bookstore_data/authors.dart' as a;
import 'package:bookstore_data/books.dart' as b;
import 'package:bookstore_data/entities.dart';
import 'package:bookstore_data/genres.dart' as g;

export 'entities.dart';

abstract class Bookstore {
  static final books = b.books;
  static final authors = a.authors;
  static final genres = g.genres;

  Book getBook({required String id}) {
    if (id.startsWith(':')) {
      throw ArgumentError(
          '`:` nie jest częścią `id`. To tylko marker w go_routerze, który oznacza, że to jest parametr');
    }
    return books.firstWhere((book) => book.id == id);
  }

  Author getAuthor({required String id}) {
    if (id.startsWith(':')) {
      throw ArgumentError(
          '`:` nie jest częścią `id`. To tylko marker w go_routerze, który oznacza, że to jest parametr');
    }
    return authors.firstWhere((author) => author.id == id);
  }

  Genre getGenre({required String id}) {
    if (id.startsWith(':')) {
      throw ArgumentError(
          '`:` nie jest częścią `id`. To tylko marker w go_routerze, który oznacza, że to jest parametr');
    }
    return genres.firstWhere((genre) => genre.id == id);
  }
}
